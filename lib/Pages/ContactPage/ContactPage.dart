import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Pages/Chat/ChatPage.dart';
import 'package:sampark_app_26/Pages/ContactPage/Widget/ContactSearch.dart';
import 'package:sampark_app_26/Pages/ContactPage/Widget/NewContactTile.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatTile.dart';

class CaontactPage extends StatelessWidget {
  const CaontactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const ContactSearch(),
            const SizedBox(height: 10),
            NewContactTile(
              btnName: "New contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            const SizedBox(height: 10),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {},
            ),
            const SizedBox(height: 10),
            const Row(children: [Text("Contacts on Sampark")]),
            const SizedBox(height: 10),
            Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(() => ChatPage());
                  },

                  child: ChatTile(
                    imageUrl: "",
                    name: "Milon Singha",
                    lastChat: "I am good.",
                    lastTime: "09:00 AM",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
