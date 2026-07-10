import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class StatusController extends GetxController with WidgetsBindingObserver {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    db.collection("users").doc(auth.currentUser!.uid).update({
      "Status": "Online",
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive) {
      log("Offline");
      db.collection("users").doc(auth.currentUser!.uid).update({
        "Status": "Offline",
      });
    } else if (state == AppLifecycleState.resumed) {
      log("Online");
      db.collection("users").doc(auth.currentUser!.uid).update({
        "Status": "Online",
      });
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
