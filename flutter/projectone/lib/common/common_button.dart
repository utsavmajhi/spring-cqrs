import 'package:flutter/material.dart';

main() => runApp(Home());

class Home extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(home: Scaffold(body: Center(child: CommonButton(callback: () => print('Clicked !'), text: 'Dutchmill'),),),);
	}
}

class CommonButton extends StatelessWidget {
	CommonButton({this.callback, this.text });
	
	final String text;
	final GestureTapCallback callback;
	
	@override
	Widget build(BuildContext context) =>
		RaisedButton(
			textColor: Colors.white,
			onPressed: this.callback,
			color: Colors.blueAccent,
			padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
			child: Text(this.text, style: TextStyle(fontSize: 25, fontFamily: 'K2D'),),
		);
}
