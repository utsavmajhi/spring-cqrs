import 'package:flutter/material.dart';

main() => runApp(FlexApp());

class FlexApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flex Demo',
			home: FlexHome(),
		);
	}
}

class FlexHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					Expanded(
						child: Row(
							children: <Widget>[
								Expanded(child: Container(color: Colors.red,), flex: 1,),
								Expanded(child: Container(color: Colors.blue,)),
								Expanded(child: Container(color: Colors.green,)),
							],
						),
					),
					Expanded(
						child: Row(
							children: <Widget>[
								Expanded(child: Container(color: Colors.deepPurple,)),
								Expanded(child: Container(color: Colors.grey,)),
								Expanded(child: Container(color: Colors.yellow,)),
							],
						),
					),
				],
			)
		);
	}
}

