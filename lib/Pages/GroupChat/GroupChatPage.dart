import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Pages/Chat/Widgets/ChatBubble.dart';
import 'package:sampark_app_26/Pages/GroupChat/GroupTypeMessage.dart';
import 'package:sampark_app_26/Pages/GroupInfo/GroupInfo.dart';

class GroupChatPage extends StatelessWidget {
  const GroupChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(AssetsImage.girlPic),
              ),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => GroupInfo());
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Group Name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("Online", style: Theme.of(context).textTheme.labelSmall),
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
                        message: "How are you mom?",
                        isComming: true,
                        time: "09:00 AM",
                        status: "read",
                        imageUrl: "",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GroupTypeMessage(),
          ],
        ),
      ),
    );
  }
}
