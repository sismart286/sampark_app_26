import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Models/UserModel.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> usersList = <UserModel>[].obs;

  void onInit() async {
    super.onInit();
    await getUserList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;

    try {
      usersList.clear();
      await db
          .collection("users")
          .get()
          .then(
            (value) => {
              usersList.value = value.docs
                  .map((e) => UserModel.fromJson(e.data()))
                  .toList(),
            },
          );
    } catch (ex) {
      log("getUserList().error: $ex");
    }

    isLoading.value = false;
  }
}
