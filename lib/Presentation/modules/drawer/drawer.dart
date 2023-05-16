import 'package:flutter/material.dart';
import 'package:newsapp/Presentation/modules/bottomNavScreens/profileScreen.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/utils/components/components.dart';

import 'package:newsapp/Presentation/widgets/dawerItem.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      width: 280,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "News",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "Day",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.orange),
                        ),
                      ],
                    ),
                    Text(
                      "Version 1.0.0",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              DrawerItem(
                  iconData: Icons.bookmark, text: getLang(context, "bookmark")),
              InkWell(
                  onTap: () {
                    buildGoTo(context: context, widget: LnguageScreen());
                  },
                  child: DrawerItem(
                      iconData: Icons.language,
                      text: getLang(context, "language"))),
              DrawerItem(
                  iconData: Icons.info, text: getLang(context, "aboutus")),
              DrawerItem(
                  iconData: Icons.lock, text: getLang(context, "privacy")),
              DrawerItem(
                  iconData: Icons.message, text: getLang(context, "contactus"))
            ],
          ),
        ),
      ),
    );
  }
}
