import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Controllers/AuthController.dart';
import 'package:sampark_app_26/Controllers/ProfileController.dart';
import 'package:sampark_app_26/Models/UserModel.dart';
import 'package:sampark_app_26/Pages/UserProfile/UserUpdateProfile.dart';
import 'package:sampark_app_26/Pages/UserProfile/Widgets/LoginUserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());

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
            LoginUserInfo(
              profileImage:
                  userModel.profileImage ?? AssetsImage.defaultProfileUrl,
              userName: userModel.name ?? "User",
              userEmail: userModel.email ?? "",
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
