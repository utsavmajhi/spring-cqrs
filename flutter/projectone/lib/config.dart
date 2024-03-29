import 'package:flutter/material.dart';
import 'package:projectone/screen/login/login_screen.dart';
import 'package:projectone/screen/main/main_screen.dart';

const title = 'Dutchmill';

const initialRoute = '/';

final routes = <String, WidgetBuilder>{
  '/': (context) => LoginScreen(),
  '/mainScreen': (context) => MainScreen(),
//	'/leaveStatusScreen': (context) => LeaveStatusScreen(),
//	'/leaveApplicationScreen': (context) => LeaveApplicationScreen(),
};

final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.blueAccent,
    iconTheme: IconThemeData(color: Colors.blueAccent, size: 35),
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.blue,
    ),
    fontFamily: 'RobotoMono',
    buttonTheme: ButtonThemeData(
      height: 75,
    ),
    textTheme: TextTheme(
      title: TextStyle(
          fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.bold),
      headline: TextStyle(
          fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.blue),
      body1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
      body2: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black87),
      display1: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.blue),
      button: TextStyle(
          fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.bold),
    ));
