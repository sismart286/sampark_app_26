import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Controllers/AuthController.dart';
import 'package:sampark_app_26/Widgets/PrimaryButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(
      text: "Suman Singha",
    ); //TODO: text: profileController.currentUser.value.name
    TextEditingController email = TextEditingController(
      text: "suman01@gmail.com",
    ); //TODO: text: profileController.currentUser.value.email
    TextEditingController phone = TextEditingController(
      text: "602647985",
    ); //TODO: text: profileController.currentUser.value.phoneNumber
    TextEditingController about = TextEditingController(
      text:
          "I am Suman Singha. App Developer. Job: Flutter Frontend Developer.",
    ); //TODO: text: profileController.currentUser.value.about

    AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(Icons.image),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: name,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Name",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: about,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "About",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            filled: false,
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: phone,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: "Number",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                              btnName: "Edit",
                              icon: Icons.edit,
                              ontap: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
