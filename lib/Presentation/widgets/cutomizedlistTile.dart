import 'package:flutter/material.dart';


class CutomListTile extends StatelessWidget {
  IconData iconData;
  Color iconColor;
  String text;
  Widget thrailing;
  CutomListTile(
      {super.key,
      required this.iconData,
      required this.iconColor,
      required this.text,
      this.thrailing = const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 18,
      )});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(4),
        // width: 25.0,
        // height: 25.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: iconColor, shape: BoxShape.rectangle),
        child: Icon(
          iconData,
          size: 18.0,
          color: Colors.white,
        ),
      ),
      title: Text(text,style: Theme.of(context).textTheme.bodyText2,),
      trailing: thrailing,
     
    );
  }
}
