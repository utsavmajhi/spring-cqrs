// Flutter code sample for material.DropdownButton.1

// This sample shows a `DropdownButton` whose value is one of
// "One", "Two", "Free", or "Four".

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
	static const String _title = 'Flutter Code Sample';
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: _title,
			home: Scaffold(
				appBar: AppBar(title: const Text(_title)),
				body: MyStatefulWidget(),
			),
		);
	}
}

class MyStatefulWidget extends StatefulWidget {
	MyStatefulWidget({Key key}) : super(key: key);
	
	@override
	_MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
	String dropdownValue = 'One';
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: DropdownButton<String>(
//					icon: Icon(Icons.build),
					value: dropdownValue,
					onChanged: (String newValue) {
						setState(() {
							dropdownValue = newValue;
						});
					},
					items: <String>['One', 'Two', 'Free', 'Four']
						.map<DropdownMenuItem<String>>((String value) {
						return DropdownMenuItem<String>(
							value: value,
							child: Text(value),
						);
					}).toList(),
				),
			),
		);
	}
}