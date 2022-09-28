import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color primaryColor = Colors.amberAccent;
ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 243, 240, 240),
    primaryColor: primaryColor,
    tabBarTheme: TabBarTheme(
      labelPadding: const EdgeInsets.all(8),
      labelStyle: TextStyle(
          color: const Color.fromARGB(255, 71, 70, 70).withOpacity(.6),
          fontSize: 18,
          fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
          color: const Color.fromARGB(255, 243, 240, 240).withOpacity(.1),
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.amberAccent, size: 36),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black.withOpacity(.6),
          fontSize: 16,
          fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white),
    ),
    primaryIconTheme:
        const IconThemeData(color: Color.fromARGB(255, 215, 212, 212)),
    iconTheme: const IconThemeData(color: Colors.amberAccent),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.grey.withOpacity(.3)),
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(.2),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.grey.withOpacity(.2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        labelStyle: TextStyle(color: Colors.grey.withOpacity(.7)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        suffixIconColor: primaryColor,
        prefixIconColor:
            const Color.fromARGB(255, 127, 123, 123).withOpacity(.7)),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Color.fromARGB(255, 199, 194, 194),
      ),
      caption: TextStyle(color: primaryColor, fontSize: 14),
      bodyText1: TextStyle(
        color: Color.fromARGB(255, 92, 90, 90),
      ),
    ));
