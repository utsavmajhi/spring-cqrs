import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectone/demo/timer/debouncer.dart';
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
		
		usernameTextfield.addListener(_onTextFieldChange);
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
										margin: EdgeInsets.only(top: 100),
										child: Column(
											children: <Widget>[
												FittedBox(
													child: Image.asset('images/dutchmill-logo.png',
														width: 250,
//														height: 300,
													),
//												fit: BoxFit.cover,
												),
//												DecoratedBox(
//													decoration: BoxDecoration(
//														image: DecorationImage(
//															image: AssetImage('images/dutchmill-logo.png'),
//															fit: BoxFit.cover
//														),
//													),
//												),
//												Text(
//													"Dutchmill",
//													style: TextStyle(
//														fontSize: 50.0,
//														fontWeight: FontWeight.bold,
//													),
//												),
//												Text(
//													"Login Screen",
//													style: TextStyle(
//														fontSize: 20.0,
//														fontWeight: FontWeight.bold,
//													),
//												),
											],
										),
									),
//									SizedBox(height: MediaQuery
//										.of(context)
//										.size
//										.height / 6,),
//									Padding(
//										padding: const EdgeInsets.only(left: 100.0),
//										child: Text(
//											"Username",
//											style: TextStyle(color: Colors.grey, fontSize: 20.0),
//										),
//									),
									Container(
										height: 70,
										decoration: BoxDecoration(
											border: Border.all(
												color: Colors.grey.withOpacity(0.5),
												width: 1.0,
											),
											borderRadius: BorderRadius.circular(20.0),
										),
										margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
										child: Row(
											children: <Widget>[
												Padding(
													padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
													child: Icon(
														Icons.person_outline,
														color: Colors.grey,
														size: 30,
													),
												),
												Container(
													height: 50.0,
													width: 1.0,
													color: Colors.grey.withOpacity(0.5),
													margin: const EdgeInsets.only(left: 00.0, right: 10.0),
												),
												Expanded(
													child: TextField(
														style: TextStyle(color: Colors.black, fontSize: 20.0),
//														maxLength: 20,
														autocorrect: false,
														controller: usernameTextfield,
														decoration: InputDecoration(
															border: InputBorder.none,
															hintText: 'Username',
//															labelText: 'Enter your username',
															hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
														),
													),
												)
											],
										),
									),
//									Padding(
//										padding: const EdgeInsets.only(left: 100.0),
//										child: Text(
//											"Password",
//											style: TextStyle(color: Colors.grey, fontSize: 16.0),
//										),
//									),
									Container(
										height: 70,
										decoration: BoxDecoration(
											border: Border.all(
												color: Colors.grey.withOpacity(0.5),
												width: 1.0,
											),
											borderRadius: BorderRadius.circular(20.0),
										),
										margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
										child: Row(
											children: <Widget>[
												Padding(
													padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
													child: Icon(
														Icons.lock_open,
														color: Colors.grey,
														size: 30,
													),
												),
												Container(
													height: 50.0,
													width: 1.0,
													color: Colors.grey.withOpacity(0.5),
													margin: const EdgeInsets.only(left: 00.0, right: 10.0),
												),
												Expanded(
													child: TextField(
														style: TextStyle(color: Colors.black, fontSize: 20.0),
														autocorrect: false,
														controller: passwordTextfield,
														decoration: InputDecoration(
															border: InputBorder.none,
															hintText: 'Password',
															hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
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
										child: Column(
											children: <Widget>[

//												SizedBox(height: 10,),
												Row(
													children: <Widget>[
														Expanded(
															child: RaisedButton(
																shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
																color: Colors.blue,
																child: Text('Log In', style: const TextStyle(fontSize: 21, color: Colors.white),),
																padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
																onPressed: () {
//															resetSharedPreferences();
																	Navigator.pushReplacementNamed(context, '/second');
																},
															),
														),
													],
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
				)
				,
			)
			,
		);
	}
	
	login(BuildContext context) {
	
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
	
	final _debouncer = Debouncer(milliseconds: 1000);
	
	_onTextFieldChange() {
		_debouncer.run(() => print(DateTime.now().toString() + ' : ' + usernameTextfield.text));
	}
	
	int _radioValue = -1;
	
	void _onRadioChange(int value) {
		setState(() {
			_radioValue = value;
			Scaffold.of(context).showSnackBar(SnackBar(content: Text("value : $_radioValue"),));
		});
	}
	
	Widget buildRadioRow(BuildContext context) {
		return
			Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Column(children: <Widget>[
						Row(
							children: <Widget>[
								Radio(
									value: 1,
									groupValue: _radioValue,
									onChanged: _onRadioChange,
								),
								Text("Remember password", style: const TextStyle(fontSize: 21, color: Colors.black),),
							],
						),
					
					],),
					Column(children: <Widget>[
						Row(
							children: <Widget>[
								Radio(
									value: 2,
									groupValue: _radioValue,
									onChanged: _onRadioChange,
								),
								Text("Forget password", style: const TextStyle(fontSize: 21, color: Colors.black),),
							],
						),
					
					],),
					Divider(
						height: 5.0,
						color: Colors.grey,
					),

//														Expanded(
//															child: RaisedButton(
//																child: Text("Remember password", style: const TextStyle(fontSize: 21, color: Colors.white),),
//																padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
//																color: Colors.blue,
//																onPressed: () => saveSharedPreferences(),
//															),
//														),
//														Container(width: 10,),
//														Expanded(
//															child: RaisedButton(
////													shape: StadiumBorder(side: BorderSide(color: Colors.red)),
//																color: Colors.blue,
//																child: Text('Forget password', style: const TextStyle(fontSize: 21, color: Colors.white),),
//																padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
//																onPressed: () => resetSharedPreferences(),
//															),
//														),
				],
			);
	}
	
}
