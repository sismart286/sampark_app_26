import 'package:flutter/material.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Pages/GroupInfo/GroupMemberInfo.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatTile.dart';

class GroupInfo extends StatelessWidget {
  const GroupInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Milon Singha"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GroupMemberInfo(),
            const SizedBox(height: 20),
            Text("Members", style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 10),
            Column(
              children: [
                ChatTile(
                  imageUrl: AssetsImage.boyPic,
                  name: "Suman Singha",
                  lastChat: "How are you friends?",
                  lastTime: "10:10 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.girlPic,
                  name: "Milon Singha",
                  lastChat: "How are you friends?",
                  lastTime: "10:10 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.boyPic,
                  name: "Aditya Singha",
                  lastChat: "How are you friends?",
                  lastTime: "10:10 AM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.boyPic,
                  name: "Raj Singha",
                  lastChat: "How are you friends?",
                  lastTime: "10:10 AM",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
