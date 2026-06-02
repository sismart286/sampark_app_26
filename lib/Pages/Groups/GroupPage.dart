import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Pages/GroupChat/GroupChatPage.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => GroupChatPage());
          },
          child: ChatTile(
            imageUrl: AssetsImage.girlPic,
            name: "Milon Singha",
            lastChat: "Group Created",
            lastTime: "Just Now",
          ),
        ),
      ],
    );
  }
}
