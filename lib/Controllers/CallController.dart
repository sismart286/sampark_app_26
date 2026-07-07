import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sampark_app_26/Models/CallModel.dart';
import 'package:sampark_app_26/Models/UserModel.dart';
import 'package:sampark_app_26/Pages/CallPage/AudioCallPage.dart';
import 'package:sampark_app_26/Pages/CallPage/VideoCallPage.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uuid = Uuid().v4();

  @override
  void onInit() {
    super.onInit();
    getCallsNotification().listen((List<CallModel> calllist) {
      if (calllist.isNotEmpty) {
        var callData = calllist[0];
        if (callData.type == "audio") {
          audioCallNotification(callData);
        } else if (callData.type == "video") {
          videoCallNotification(callData);
        }
      }
    });
  }

  //FOR CALL RECIEVER
  Future<void> audioCallNotification(CallModel callData) async {
    Get.snackbar(
      callData.callerName!,
      "Incoming Audio Call",
      duration: Duration(days: 1),
      barBlur: 0,
      backgroundColor: Colors.grey[900],
      isDismissible: true,
      icon: Icon(Icons.call),
      onTap: (snack) {
        Get.back();
        Get.to(
          () => AudioCallPage(
            target: UserModel(
              id: callData.callerUid,
              name: callData.callerName,
              email: callData.callerEmail,
              profileImage: callData.callerPic,
            ),
          ),
        );
      },
      mainButton: TextButton(
        onPressed: () {
          endCall(callData);
          Get.back();
        },
        child: Text("End Call"),
      ),
    );
  }

  Future<void> callAction(
    UserModel receiver,
    UserModel caller,
    String type,
  ) async {
    String id = uuid;
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat("hh:mm a").format(timestamp);
    var newCall = CallModel(
      id: id,
      callerName: caller.name,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      callerEmail: caller.email,
      receiverName: receiver.name,
      receiverPic: receiver.profileImage,
      receiverUid: receiver.id,
      receiverEmail: receiver.email,
      type: type,
      time: nowTime,
      timestamp: DateTime.now().toString(),
    );
    try {
      await db
          .collection("notifications")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());

      Future.delayed(Duration(seconds: 10), () {
        endCall(newCall);
      });
    } catch (e) {
      log("CallAction() error: $e");
    }
  }

  Stream<List<CallModel>> getCallsNotification() {
    final user = auth.currentUser;

    if (user == null) {
      return Stream.empty();
    }

    return db
        .collection("notifications")
        .doc(auth.currentUser!.uid)
        .collection("calls")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CallModel.fromJson(doc.data()))
              .toList(),
        );
  }

  Future<void> endCall(CallModel call) async {
    try {
      await db
          .collection("notifications")
          .doc(call.receiverUid)
          .collection("calls")
          .doc(call.id)
          .delete();
    } catch (e) {
      log("error: $e");
    }
  }

  void videoCallNotification(CallModel callData) {
    Get.snackbar(
      callData.callerName!,
      "Incomming Video Call",
      duration: Duration(days: 1),
      barBlur: 0,
      backgroundColor: Colors.grey[900],
      isDismissible: true,
      icon: Icon(Icons.video_call),
      onTap: (snack) {
        Get.back();
        VideoCallPage(
          target: UserModel(
            id: callData.callerUid,
            name: callData.callerName,
            email: callData.callerEmail,
            profileImage: callData.callerPic,
          ),
        );
      },
      mainButton: TextButton(
        onPressed: () {
          endCall(callData);
          Get.back();
        },
        child: Text("End Call"),
      ),
    );
  }
}
