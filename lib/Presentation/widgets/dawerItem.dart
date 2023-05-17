import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_colors.dart';

class DrawerItem extends StatelessWidget {
  IconData iconData;
  String text;
  DrawerItem({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: bgBodyColor,
            child: Icon(iconData, color: Colors.grey[700]),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(),
          )
        ],
      ),
    );
  }
}
