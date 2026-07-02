import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/CustomMessage.dart';
import 'package:sampark_app_26/Controllers/ProfileController.dart';
import 'package:sampark_app_26/Models/ChatModel.dart';
import 'package:sampark_app_26/Models/GroupModel.dart';
import 'package:sampark_app_26/Models/UserModel.dart';
import 'package:sampark_app_26/Pages/Home/HomePage.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> groupMembers = <UserModel>[].obs;

  var uuid = Uuid();
  RxBool isloading = false.obs;
  RxString selectedImagePath = "".obs;
  RxList<GroupModel> groupList = <GroupModel>[].obs;
  ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

  void selectMember(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    isloading.value = true;
    String groupId = uuid.v6();
    groupMembers.add(
      UserModel(
        id: auth.currentUser!.uid,
        name: profileController.currentUser.value.name,
        profileImage: profileController.currentUser.value.profileImage,
        email: profileController.currentUser.value.email,
        role: "admin",
      ),
    );

    try {
      String imageUrl = await profileController.uploadFileToFirebase(imagePath);

      await db.collection("groups").doc(groupId).set({
        "id": groupId,
        "name": groupName,
        "profileUrl": imageUrl,
        "members": groupMembers.map((e) => e.toJson()).toList(),
        "createdAt": DateTime.now().toString(),
        "createdBy": auth.currentUser!.uid,
        "timestamp": DateTime.now().toString(),
      });
      getGroups();
      successMessage("Group Created");
      Get.offAll(const HomePage());
      isloading.value = false;
    } catch (e) {
      log("error: $e");
    }
  }

  Future<void> getGroups() async {
    isloading.value = true;
    List<GroupModel> tempGroup = [];
    await db.collection("groups").get().then((value) {
      tempGroup = value.docs.map((e) => GroupModel.fromJson(e.data())).toList();
    });
    groupList.clear();
    groupList.value = tempGroup
        .where(
          (e) =>
              e.members!.any((element) => element.id == auth.currentUser!.uid),
        )
        .toList();
    isloading.value = false;
  }

  Future<void> sendGroupMessage(
    String message,
    String groupId,
    String imagePath,
  ) async {
    isloading.value = true;
    var chatId = uuid.v6();
    String imageUrl = await profileController.uploadFileToFirebase(
      selectedImagePath.value,
    );

    var newChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl,
      senderId: auth.currentUser!.uid,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    await db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .doc(chatId)
        .set(newChat.toJson());

    selectedImagePath.value = "";
    isloading.value = false;
  }

  Stream<List<ChatModel>> getGroupMessages(String groupId) {
    return db
        .collection("groups")
        .doc(groupId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((e) => ChatModel.fromJson(e.data())).toList(),
        );
  }

  Future<void> addMemberToGroup(String groupId, UserModel user) async {
    isloading.value = true;
    try {
      await db.collection("groups").doc(groupId).update({
        "members": FieldValue.arrayUnion([user.toJson()]),
      });
      getGroups();
    } catch (e) {
      log("Error adding member: $e");
    } finally {
      isloading.value = false;
    }
  }
}
