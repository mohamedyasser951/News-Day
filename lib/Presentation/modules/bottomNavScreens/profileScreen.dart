import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/utils/styles/colors.dart';
import 'package:newsapp/Presentation/widgets/cutomizedlistTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppNewsCubit.get(context).getUserData();
      return BlocConsumer<AppNewsCubit, AppNewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppNewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(getLang(context, "profile")),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CircleAvatar(
                    //   radius: 45.0,
                    //   backgroundColor: Colors.blue,
                    //   backgroundImage: NetworkImage(cubit.userModel!.image!),
                    // ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // Text(cubit.userModel!.name!),
                    // Text(cubit.userModel!.bio!),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    CutomListTile(
                        iconData: Icons.mail_outline,
                        iconColor: Colors.blue,
                        text: "MohamedYasser12@gmail.com"),
                    InkWell(
                      onTap: () {},
                      child: CutomListTile(
                          iconData: Icons.edit_outlined,
                          iconColor: Colors.purple,
                          text: getLang(context, "editprofile")),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.black38,
                          context: context,
                          
                          builder: (context) {
                            
                            
                            return Center(
                              child: Container(
                                height: 140,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Do you really want to logout from the app?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("No")),
                                          TextButton(
                                              onPressed: () {
                                                Logout(context);
                                              },
                                              child: Text("Yes")),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          
                          },
                          
                        );
                      },
                      child: CutomListTile(
                          iconData: Icons.logout_outlined,
                          iconColor: Colors.pinkAccent,
                          text: getLang(context, "logout")),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(getLang(context, "generalsetting"),
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    CutomListTile(
                        iconData: Icons.bookmark_outline_outlined,
                        iconColor: Colors.blueGrey,
                        text: getLang(context, "bookmark")),
                    CutomListTile(
                      iconData: Icons.light_mode,
                      iconColor: Colors.grey,
                      text: getLang(context, "darkmode"),
                      thrailing: Switch(
                        value: cubit.isDarkMode,
                        onChanged: (val) {
                          cubit.changeAppMode();
                        },
                      ),
                    ),
                    CutomListTile(
                      iconData: Icons.notifications_outlined,
                      iconColor: primColor,
                      text: getLang(context, "notification"),
                      thrailing: Switch(
                        value: true,
                        onChanged: (val) {},
                      ),
                    ),
                    CutomListTile(
                        iconData: Icons.email_outlined,
                        iconColor: Colors.blue,
                        text: getLang(context, "contactus")),
                    InkWell(
                      onTap: () {
                        buildGoTo(context: context, widget: LnguageScreen());
                      },
                      child: CutomListTile(
                          iconData: Icons.language_sharp,
                          iconColor: Colors.pink,
                          text: getLang(context, "language")),
                    ),
                    CutomListTile(
                        iconData: Icons.star_outline,
                        iconColor: Colors.orange,
                        text: getLang(context, "rateApp")),
                    CutomListTile(
                        iconData: Icons.lock_outlined,
                        iconColor: Colors.red,
                        text: getLang(context, "privacy")),
                    CutomListTile(
                        iconData: Icons.info_outline,
                        iconColor: Colors.green,
                        text: getLang(context, "aboutus")),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

class LnguageScreen extends StatelessWidget {
  const LnguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        title: Text(getLang(context, "selectlang")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  AppNewsCubit.get(context).changeAppLang(locale: "en");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 28,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "English",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  AppNewsCubit.get(context).changeAppLang(locale: "ar");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 28,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Arabic",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
