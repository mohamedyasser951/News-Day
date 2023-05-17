import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/utils/app_colors.dart';

class Themes {
  static ThemeData darkTheme = ThemeData(
      backgroundColor: HexColor("181A20"),
      textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 25.0),
          bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
          caption: TextStyle(color: Colors.white)),
      primaryColor: primColor,
      primarySwatch: myPrimarySwatch,
      scaffoldBackgroundColor: HexColor("333739"),
      tabBarTheme: TabBarTheme(
          labelColor: Color(0xFF5a31ff), unselectedLabelColor: Colors.white),
      hintColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.white,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          titleSpacing: 20.0,
          backgroundColor: HexColor("181A20"),
          iconTheme: const IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('181A20'),
            statusBarIconBrightness: Brightness.light,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: HexColor('181A20'),
          selectedItemColor: primColor,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: const IconThemeData(color: Colors.grey)));

  static ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primColor,
    primarySwatch: myPrimarySwatch,
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: bgBodyColor,
    tabBarTheme: TabBarTheme(
        labelColor: primColor, unselectedLabelColor: Colors.black87),
    appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0.0,
        backgroundColor: Colors.white,
        //color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primColor,
        elevation: 20.0),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      // headline6: TextStyle(
      //   color: Colors.black,
      //   fontSize: 24.0,
      //   fontWeight: FontWeight.w800,
      // ),
    ),
  );
}
