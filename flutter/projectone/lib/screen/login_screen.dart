import 'package:flutter/material.dart';
import 'package:projectone/screen/zero_screen.dart';

class LoginScreen extends StatelessWidget {
	
	final Color primaryColor;
	
	const LoginScreen({Key key, this.primaryColor}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
//		return ListDisplay();
		return ZeroScreen();
	}
	
}