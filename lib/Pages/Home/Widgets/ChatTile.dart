import 'package:flutter/material.dart';
import 'package:sampark_app_26/Config/Images.dart';

class ChatTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastChat,
    required this.lastTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(AssetsImage.boyPic, width: 70),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text(name, style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 5),
                    Text(
                      lastChat,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(lastTime, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
