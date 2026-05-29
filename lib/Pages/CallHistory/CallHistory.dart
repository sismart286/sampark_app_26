import 'package:flutter/material.dart';
import 'package:sampark_app_26/Config/Images.dart';
import 'package:sampark_app_26/Pages/Home/Widgets/ChatTile.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatTile(
          imageUrl: AssetsImage.girlPic,
          name: "Milon Singha",
          lastChat: "Call Recieved",
          lastTime: "Just Now",
        ),
      ],
    );
  }
}
