import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Pages/UserProfile/UserUpdateProfile.dart';
import 'package:sampark_app_26/Pages/UserProfile/Widgets/LoginUserInfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => UserUpdateProfile());
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
