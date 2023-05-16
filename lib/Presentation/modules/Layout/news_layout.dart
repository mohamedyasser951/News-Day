import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/modules/bottomNavScreens/categoriesScreen.dart';
import 'package:newsapp/Presentation/modules/bottomNavScreens/homeScreen.dart';
import 'package:newsapp/Presentation/modules/bottomNavScreens/profileScreen.dart';
import 'package:newsapp/Presentation/modules/bottomNavScreens/video/videosScreen.dart';
import 'package:newsapp/Presentation/widgets/noInternetconnection.dart';
import 'package:newsapp/config/app_local.dart';

class NewsLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final List<Widget> screens = [
    const HomeScreen(),
    const VideosScreen(),
    CategoriesScreen(),
    const ProfileScreen(),
  ];
  NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNewsCubit, AppNewsStates>(
        listener: ((context, state) => {}),
        builder: ((context, state) {
          AppNewsCubit cubit = AppNewsCubit.get(context);
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return 
                  Scaffold(
                      body: snapshot.data == ConnectivityResult.none?
                      NoConnectionWidget()
                      :Builder(builder: (context) {
                        return screens[cubit.currentindex];
                      }),
                      bottomNavigationBar: BottomNavigationBar(
                          currentIndex: cubit.currentindex,
                          onTap: (value) => cubit.bottomNavChange(value),
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(EvaIcons.home),
                                label: getLang(context, "home")),
                            BottomNavigationBarItem(
                                icon: Icon(EvaIcons.video),
                                label: getLang(context, "videos")),
                            BottomNavigationBarItem(
                                icon: Icon(EvaIcons.checkmarkSquare2),
                                label: getLang(context, "category")),
                            BottomNavigationBarItem(
                                icon: Icon(EvaIcons.person),
                                label: getLang(context, "profile")),
                          ]),
                    );
            },
          );
        }));
  }
}


