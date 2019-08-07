import 'package:flutter/material.dart';
import 'package:projectone/screen/login/login_screen.dart';
import 'package:projectone/screen/main/main_screen.dart';
import 'package:projectone/screen/profile/profile_screen.dart';

const title = 'Dutchmill';

const initialRoute = '/';

final routes = <String, WidgetBuilder>{
	'/': (context) => LoginScreen(),
	'/profileScreen': (context) => ProfileScreen(),
	'/mainScreen': (context) => MainScreen(),
//	'/leaveStatusScreen': (context) => LeaveStatusScreen(),
//	'/leaveApplicationScreen': (context) => LeaveApplicationScreen(),
};


final lightTheme = ThemeData(
	primarySwatch: Colors.blue,
	brightness: Brightness.light,
	primaryColor: Colors.blue,
	accentColor: Colors.blueAccent,
	appBarTheme: AppBarTheme(
		elevation: 1,
		color: Colors.blue,
	),
	fontFamily: 'K2D',
	buttonColor: Colors.blue,
	buttonTheme: ButtonThemeData(
		buttonColor: Colors.blue,
		padding: EdgeInsets.symmetric(vertical: 30,),
	),
	textTheme: TextTheme(
		title: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
		headline: TextStyle(
				fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
		body1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
		body2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black87),
		button: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
	)
);



