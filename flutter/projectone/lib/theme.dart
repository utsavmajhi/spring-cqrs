import 'package:flutter/material.dart';

final appBarTheme = AppBarTheme(
	elevation: 1,
	color: Colors.blue,
);

final themeData = ThemeData(
	primarySwatch: Colors.blue,
	brightness: Brightness.light,
	primaryColor: Colors.blue,
	accentColor: Colors.blueAccent,
	appBarTheme: appBarTheme,
	fontFamily: 'RobotoMono',
	textTheme: TextTheme(
		display1: TextStyle(
			fontSize: 22,
			fontWeight: FontWeight.w200,
		),
	
	),
);


