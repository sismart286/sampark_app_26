import 'package:flutter/material.dart';
import 'package:sampark_app_26/Pages/Welcome/Widgets/WelcomeBody.dart';
import 'package:sampark_app_26/Pages/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:sampark_app_26/Pages/Welcome/Widgets/WelcomeHeading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [WelcomeHeading(), WelcomeBody(), WelcomeFooterButton()],
          ),
        ),
      ),
    );
  }
}
