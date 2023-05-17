import 'dart:io';
// Import the generated file
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/social_login.dart';
import 'package:newsapp/Presentation/modules/Layout/news_layout.dart';
import 'package:newsapp/Presentation/modules/on_boarding/on_boarding.dart';
import 'package:newsapp/app.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/Data/Data%20Source/remote/dio_helper.dart';
import 'utils/components/block_observer.dart';
import 'utils/components/firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DioHelper.init();
  await SharedHelper.init();

  bool? isDarkformShared = SharedHelper.getData("isDark");
  bool? onboarding = SharedHelper.getData("onBoarding");
  currentLocalApp = SharedHelper.getData("lang") ?? "us";
  Token = SharedHelper.getData("token");
  Widget startWidget;

  if (onboarding != null) {
    startWidget = OnBoardingScreen();
    if (Token != null) {
      startWidget = NewsLayout();
    } else {
      startWidget = SocialLogin();
    }
  } else {
    startWidget = OnBoardingScreen();
  }
  if (Platform.isWindows) {
    await DesktopWindow.setMinWindowSize(const Size(500, 600));
  }
  Bloc.observer = MyBlocObserver();

  runApp(app(isDarkformShared, startWidget));
}


