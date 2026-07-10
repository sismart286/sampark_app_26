import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Config/Strings.dart';
import 'package:sampark_app_26/Controllers/AppController.dart';
import 'package:sampark_app_26/Controllers/ContactController.dart';
import 'package:sampark_app_26/Controllers/ProfileController.dart';
import 'package:sampark_app_26/Controllers/StatusController.dart';
import 'package:sampark_app_26/Pages/Auth/AuthPage.dart';
import 'package:sampark_app_26/Pages/CallHistory/CallHistory.dart';
import 'package:sampark_app_26/Pages/ContactPage/ContactPage.dart';
import 'package:sampark_app_26/Pages/Groups/GroupPage.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatList.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/TabBar.dart';
import 'package:sampark_app_26/Pages/ProfilePage/ProfilePage.dart';
import 'package:sampark_app_26/Pages/UserProfile/UserProfilePage.dart';
import 'package:sampark_app_26/Pages/Welcome/WelcomePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ContactController contactController = Get.put(ContactController());
    StatusController statusController = Get.put(StatusController());
    AppController appController = Get.put(AppController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsImage.appIconSVG),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Get.to(() => UserProfilePage());
              appController.checkLatestVersion();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              await profileController.getUserDetails();
              Get.to(() => ProfilePage());
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: TabBarView(
          controller: tabController,
          children: [const ChatList(), const GroupPage(), const CallHistory()],
        ),
      ),
    );
  }
}
