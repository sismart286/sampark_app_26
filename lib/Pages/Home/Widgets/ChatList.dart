import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Pages/Chat/ChatPage.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => ChatPage());
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyPic,
            name: "Suman Singha",
            lastChat: "Hi, how are you?",
            lastTime: "Last Time",
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => ChatPage());
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyPic,
            name: "Suman Singha",
            lastChat: "Hi, how are you?",
            lastTime: "Last Time",
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => ChatPage());
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyPic,
            name: "Suman Singha",
            lastChat: "Hi, how are you?",
            lastTime: "Last Time",
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => ChatPage());
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyPic,
            name: "Suman Singha",
            lastChat: "Hi, how are you?",
            lastTime: "Last Time",
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => ChatPage());
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyPic,
            name: "Suman Singha",
            lastChat: "Hi, how are you?",
            lastTime: "Last Time",
          ),
        ),
      ],
    );
  }
}
