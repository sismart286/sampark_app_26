import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Models/UserModel.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel().obs;

  void onInit() async {
    super.onInit();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then(
          (value) => {currentUser.value = UserModel.fromJson(value.data()!)},
        );
  }

  Future<void> updateProfile(
    String imagePath,
    String name,
    String about,
    String number,
  ) async {
    isLoading.value = true;
    try {
      final imageLink = await uploadFileToFirebase(imagePath);
      final updateUser = UserModel(
        id: auth.currentUser!.email,
        email: auth.currentUser!.email,
        name: name,
        about: about,
        profileImage: imagePath == ""
            ? currentUser.value.profileImage
            : imageLink,
        phoneNumber: number,
      );
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(updateUser.toJson());
      await getUserDetails();
    } catch (ex) {
      log("updateProfile() error: $ex");
    }
    isLoading.value = false;
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/${imagePath}";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        log("downloadImageUrl: $downloadImageUrl");

        return downloadImageUrl;
      } catch (ex) {
        log("ex: $ex");
        return "";
      }
    }

    return "";
  }
}
