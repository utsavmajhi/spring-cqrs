import 'package:flutter/material.dart';

import 'demo.dart';

class LoginScreen extends StatelessWidget {
	
	final Color primaryColor;
	
	const LoginScreen({Key key, this.primaryColor}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return WelcomeScreen();
	}
	
	Widget loginForm(context) =>
		SafeArea(
			child: Center(
				child: Container(
					height: MediaQuery
						.of(context)
						.size
						.height,
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Text("A"),
							Text("B"),
							Text("C"),
						],
					),
				),
			),
		);
	
}

Widget _SafeArea(context) =>
	SafeArea(
		child: Center(
			child: RaisedButton(
				child: Text('Login'),
				onPressed: () {
					Navigator.pushReplacementNamed(context, '/second');
				},
			),
		),
	);

Widget _buildCard() =>
	SizedBox(
		height: 210,
		child: Card(
			child: Column(
				children: [
					ListTile(
						title: Text('1625 Main Street',
							style: TextStyle(
								fontWeight: FontWeight.w500)),
						subtitle: Text('My City, CA 99984'),
						leading: Icon(
							Icons.restaurant_menu,
							color: Colors.blue[500],
						),
					),
					Divider(),
					ListTile(
						title: Text('(408) 555-1212',
							style: TextStyle(
								fontWeight: FontWeight.w500)),
						leading: Icon(
							Icons.contact_phone,
							color: Colors.blue[500],
						),
					),
					ListTile(
						title: Text('costa@example.com'),
						leading: Icon(
							Icons.contact_mail,
							color: Colors.blue[500],
						),
					),
				],
			),
		),
	);
