import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/images/no-internet-connection.json",
              height: 380, width: 300),
          Text(
            "whoops ! ",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "No internet Connection.\n check your internet settings and try again.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}