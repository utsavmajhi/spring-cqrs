import 'package:flutter/material.dart';

final appBarTheme = AppBarTheme(
	elevation: 0,
	color: Colors.lightBlueAccent,
);

final themeData = ThemeData(
	brightness: Brightness.light,
	primaryColor: const Color(0xFFFFD300),
	accentColor: const Color(0xFFFFB900),
	appBarTheme: appBarTheme,
	
	// Define the default Font Family
	fontFamily: 'Montserrat',
	
	// Define the default TextTheme. Use this to specify the default
	// text styling for headlines, titles, bodies of text, and more.
	textTheme: TextTheme(
		display1: TextStyle(
			fontSize: 36,
			fontWeight: FontWeight.bold,
		),
		
		//headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
		//title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
		//body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
	),
);


