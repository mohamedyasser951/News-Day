import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Authentication/register/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/modules/Splash/splash.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/config/themes.dart';
import 'package:newsapp/utils/constants/constants.dart';

class app extends StatefulWidget {
  final bool? isDarkformShared;
  final Widget start;
  app(this.isDarkformShared, this.start, {super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  void initState() {
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
