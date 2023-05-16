import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/social_login.dart';
import 'package:newsapp/Presentation/modules/Authentication/register/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/modules/Layout/news_layout.dart';
import 'package:newsapp/Presentation/modules/on_boarding/on_boarding.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/config/themes.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/Data/Data%20Source/remote/dio_helper.dart';
import 'package:newsapp/splash.dart';
import 'utils/components/block_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await SharedHelper.init();

  bool? isDarkformShared = SharedHelper.getData("isDark");
  bool? onboarding = SharedHelper.getData("onBoarding");

  currentLocalApp = SharedHelper.getData("lang") ?? "us";
  Token = SharedHelper.getData("token");
  print("isDark From Shared ${isDarkformShared}");
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

class app extends StatefulWidget {
  bool? isDarkformShared;
  Widget start;
  app(this.isDarkformShared, this.start, {super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  void initState() {
//  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => CubitLogin())),
        BlocProvider(create: ((context) => CubitRegister())),
        BlocProvider(
            create: (context) => AppNewsCubit()
              ..changeAppMode(modeFromShered: widget.isDarkformShared)
              ..getExplore()
              ..getHeadLine()
              ..getUserData()),
      ],
      child: BlocConsumer<AppNewsCubit, AppNewsStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: AppNewsCubit.get(context).isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: Locale(currentLocalApp),
            localizationsDelegates: [
              AppLocale
                  .delegate, // Todo: Calling The Delegate which I created to load data from json files
              GlobalMaterialLocalizations
                  .delegate, // Todo: get the directions for names for specific widgets depending on Device language
              GlobalCupertinoLocalizations
                  .delegate, // Todo: get the directions for names for specific widgets depending on Device language
              GlobalWidgetsLocalizations
                  .delegate, // Todo: get the directions for widgets depending on Device language
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale!.languageCode) {
                  SharedHelper.saveData(
                      key: "lang", value: deviceLocale.languageCode);
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            supportedLocales: [Locale("en", ""), Locale("ar", "")],
            home: SplashScreen(widget.start),
          );
        }),
      ),
    );
  }
}
