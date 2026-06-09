import 'package:get/get.dart';
import 'package:sampark_app_26/Pages/Auth/AuthPage.dart';
import 'package:sampark_app_26/Pages/Chat/ChatPage.dart';
import 'package:sampark_app_26/Pages/Home/HomePage.dart';
import 'package:sampark_app_26/Pages/ProfilePage/ProfilePage.dart';
import 'package:sampark_app_26/Pages/UserProfile/UserProfilePage.dart';

var pagePath = [
  GetPage(name: "/authPage", page: () => AuthPage()),
  GetPage(name: "/homePage", page: () => HomePage()),
  GetPage(name: "/chatPage", page: () => ChatPage()),
  GetPage(name: "/profilePage", page: () => ProfilePage()),
  GetPage(name: "/userProfilePage", page: () => UserProfilePage()),
];
