import 'package:flutter/material.dart';
import 'package:projectone/config.dart' as constant;

main() => runApp(Application());

class Application extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		MaterialApp(
			title: constant.title,
			theme: constant.lightTheme,
			debugShowCheckedModeBanner: false,
			initialRoute: constant.initialRoute,
			routes: constant.routes,
		);
	
}


