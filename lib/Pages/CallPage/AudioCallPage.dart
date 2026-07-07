import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Strings.dart';
import 'package:sampark_app_26/Controllers/ChatController.dart';
import 'package:sampark_app_26/Controllers/ProfileController.dart';
import 'package:sampark_app_26/Models/UserModel.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallPage extends StatelessWidget {
  final UserModel target;
  const AudioCallPage({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    var callId = chatController.getRoomId(target.id!);

    return ZegoUIKitPrebuiltCall(
      appID: ZegoCloudConfig.appId, // your AppID,
      appSign: ZegoCloudConfig.appSign,
      userID: profileController.currentUser.value.id!,
      userName: profileController.currentUser.value.id!,
      callID: callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
