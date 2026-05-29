import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Pages/Chat/Widgets/ChatBubble.dart';
import 'package:sampark_app_26/Pages/Chat/Widgets/TypeMessage.dart';
import 'package:sampark_app_26/Pages/UserProfile/UserProfilePage.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => UserProfilePage());
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(AssetsImage.girlPic, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => UserProfilePage());
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Milon Singha",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("Online", style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      ChatBubble(
                        message: "Hi, how are you?",
                        isComming: false,
                        time: "09:30 AM",
                        status: "recieved",
                        imageUrl: "",
                      ),
                      ChatBubble(
                        message: "Hi, how are you?",
                        isComming: false,
                        time: "09:30 AM",
                        status: "recieved",
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX6_wSVRuXeIRyyE7b5xYSw_pThp-5T96LPw&s",
                      ),
                      ChatBubble(
                        message: "Hi, how are you?",
                        isComming: false,
                        time: "09:30 AM",
                        status: "recieved",
                        imageUrl: "",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TypeMessage(),
          ],
        ),
      ),
    );
  }
}
