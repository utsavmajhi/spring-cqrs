import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// wrap component with GestureDetector
// GestureDetector(onTap:(){dismissKeyboard(context)})
dismissKeyboard(BuildContext context) {
	FocusScope.of(context).requestFocus(new FocusNode());
}

_incrementCounter() async {
	SharedPreferences prefs = await SharedPreferences.getInstance();
	int counter = (prefs.getInt('counter') ?? 0) + 1;
	print('Pressed $counter times.');
	await prefs.setInt('counter', counter);
}

