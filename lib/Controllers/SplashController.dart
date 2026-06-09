import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Pages/Auth/AuthPage.dart';
import 'package:sampark_app_26/Pages/Home/HomePage.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    await splashHanlde();
  }

  Future<void> splashHanlde() async {
    await Future.delayed(Duration(seconds: 3), () {});
    if (auth.currentUser == null) {
      Get.offAll(() => AuthPage());
    } else {
      Get.offAll(() => HomePage());
      log("CurrentUser: ${auth.currentUser!.email}");
    }
  }
}
