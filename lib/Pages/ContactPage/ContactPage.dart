import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Controllers/ContactController.dart';
import 'package:sampark_app_26/Controllers/ProfileController.dart';
import 'package:sampark_app_26/Pages/Chat/ChatPage.dart';
import 'package:sampark_app_26/Pages/ContactPage/Widget/ContactSearch.dart';
import 'package:sampark_app_26/Pages/ContactPage/Widget/NewContactTile.dart';
import 'package:sampark_app_26/Pages/Groups/NewGroup/NewGroup.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    // ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value
                  ? Icon(Icons.close)
                  : Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value
                  ? const ContactSearch()
                  : const SizedBox(),
            ),

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
              ontap: () {
                Get.to(const NewGroup());
              },
            ),
            const SizedBox(height: 10),
            const Row(children: [Text("Contacts on Sampark")]),
            const SizedBox(height: 10),
            Obx(
              () => Column(
                children: contactController.usersList
                    .map(
                      (e) => InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(() => ChatPage());
                        },

                        child: ChatTile(
                          imageUrl:
                              e.profileImage ?? AssetsImage.defaultProfileUrl,
                          name: e.name ?? "User",
                          lastChat: e.about ?? "Hey There",
                          lastTime:
                              e.email ==
                                  profileController.currentUser.value.email
                              ? "You"
                              : "",
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
