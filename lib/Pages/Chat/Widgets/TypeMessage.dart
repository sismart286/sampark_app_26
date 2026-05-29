import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sampark_app_26/Config/Images.dart';

class TypeMessage extends StatelessWidget {
  const TypeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(AssetsImage.chatEmoji, width: 25),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: false,
                hintText: "Type message...",
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(AssetsImage.chatGallarySvg, width: 25),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
