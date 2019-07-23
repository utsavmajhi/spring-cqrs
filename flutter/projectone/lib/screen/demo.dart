import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
	@override
	_WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
	
	final usernameTextfield = TextEditingController();
	final passwordTextfield = TextEditingController();
	
	@override
	void initState() {
		super.initState();
		SystemChrome.setPreferredOrientations([
			DeviceOrientation.landscapeRight,
			DeviceOrientation.landscapeLeft,
		]);
		getSharedPreferences();
	}
	
	@override
	void dispose() {
		usernameTextfield.dispose();
		passwordTextfield.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		final node = FocusNode();
		return Scaffold(
			appBar: AppBar(title: Text("Login"),),
			body: GestureDetector(
				onTap: () => FocusScope.of(context).requestFocus(node),
				child: SafeArea(
					child: SingleChildScrollView(
						child: Container(
							height: MediaQuery
								.of(context)
								.size
								.height,
							decoration: BoxDecoration(
								color: Colors.white
							),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
									Container(
										alignment: Alignment.center,
										padding: EdgeInsets.only(top: 150.0, bottom: 100.0),
										child: Column(
											children: <Widget>[
												Text(
													"Dutchmill",
													style: TextStyle(
														fontSize: 50.0,
														fontWeight: FontWeight.bold,
													),
												),
												Text(
													"Login Screen",
													style: TextStyle(
														fontSize: 20.0,
														fontWeight: FontWeight.bold,
													),
												),
											],
										),
									),
									SizedBox(height: MediaQuery
										.of(context)
										.size
										.height / 6,),
									Padding(
										padding: const EdgeInsets.only(left: 100.0),
										child: Text(
											"Username",
											style: TextStyle(color: Colors.grey, fontSize: 16.0),
										),
									),
									Container(
										decoration: BoxDecoration(
											border: Border.all(
												color: Colors.grey.withOpacity(0.5),
												width: 1.0,
											),
											borderRadius: BorderRadius.circular(20.0),
										),
										margin:
										const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
										child: Row(
											children: <Widget>[
												Padding(
													padding:
													EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
													child: Icon(
														Icons.person_outline,
														color: Colors.grey,
													),
												),
												Container(
													height: 30.0,
													width: 1.0,
													color: Colors.grey.withOpacity(0.5),
													margin: const EdgeInsets.only(left: 00.0, right: 10.0),
												),
												Expanded(
													child: TextField(
//														maxLength: 20,
														autocorrect: false,
														controller: usernameTextfield,
														decoration: InputDecoration(
															border: InputBorder.none,
															hintText: 'Enter your username',
//															labelText: 'Enter your username',
															hintStyle: TextStyle(color: Colors.grey),
														),
													),
												)
											],
										),
									),
									Padding(
										padding: const EdgeInsets.only(left: 100.0),
										child: Text(
											"Password",
											style: TextStyle(color: Colors.grey, fontSize: 16.0),
										),
									),
									Container(
										decoration: BoxDecoration(
											border: Border.all(
												color: Colors.grey.withOpacity(0.5),
												width: 1.0,
											),
											borderRadius: BorderRadius.circular(20.0),
										),
										margin:
										const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
										child: Row(
											children: <Widget>[
												new Padding(
													padding:
													EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
													child: Icon(
														Icons.lock_open,
														color: Colors.grey,
													),
												),
												Container(
													height: 30.0,
													width: 1.0,
													color: Colors.grey.withOpacity(0.5),
													margin: const EdgeInsets.only(left: 00.0, right: 10.0),
												),
												new Expanded(
													child: TextField(
														autocorrect: false,
														controller: passwordTextfield,
														decoration: InputDecoration(
															border: InputBorder.none,
															hintText: 'Enter your password',
															hintStyle: TextStyle(color: Colors.grey),
														),
														obscureText: true,
													),
												)
											],
										),
									),
									Container(
										margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
										padding: const EdgeInsets.only(left: 20.0, right: 20.0),
										child: new Row(
											children: <Widget>[
												new Expanded(
													child: FlatButton(
														child: Text("Remember me", style: TextStyle(fontSize: 18),),
														padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
														color: Colors.blue,
														onPressed:
															() => saveSharedPreferences(),
													),
												),
												Container(width: 1,),
												Expanded(
													child: FlatButton(
//													shape: StadiumBorder(side: BorderSide(color: Colors.red)),
														color: Colors.blue,
														child: Text('Login', style: const TextStyle(fontSize: 18),),
														padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
														onPressed: () {
															resetSharedPreferences();
															Navigator.pushReplacementNamed(context, '/second');
														},
													),
												),
											],
										),
									),
								],
							),
						)
						,
					)
					,
				),
			),
		);
	}
	
	saveSharedPreferences() async {
		var prefs = await SharedPreferences.getInstance();
		prefs.setString("username", usernameTextfield.text);
		prefs.setString("password", passwordTextfield.text);
	}
	
	getSharedPreferences() async {
		var prefs = await SharedPreferences.getInstance();
		usernameTextfield.text = prefs.getString("username") ?? "";
		passwordTextfield.text = prefs.getString("password") ?? "";
	}
	
	resetSharedPreferences() async {
		var prefs = await SharedPreferences.getInstance();
		prefs.clear();
	}
}
