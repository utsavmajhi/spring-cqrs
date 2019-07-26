import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Zero extends StatefulWidget {
	@override
	_ZeroState createState() => _ZeroState();
}

class _ZeroState extends State<Zero> {
	
	var usernameController;
	var passwordController;
	
	@override
	void initState() {
		super.initState();
		usernameController = TextEditingController();
		passwordController = TextEditingController();
		getSharedPreferences();
	} //
	@override
	void dispose() {
		usernameController.dispose();
		passwordController.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		final node = FocusNode();
		return Scaffold(
			appBar: AppBar(title: Text("Login"),),
			body: SafeArea(
				child: GestureDetector(
					onTap: () => FocusScope.of(context).requestFocus(node),
					child: Container(
						decoration: BoxDecoration(color: Colors.white),
						height: MediaQuery
							.of(context)
							.size
							.height,
						width: MediaQuery
							.of(context)
							.size
							.width,
						child: SingleChildScrollView(
							child: Column(
								children: <Widget>[
									Container(
										margin: EdgeInsets.only(top: 80),
										child: Image.asset('images/dutchmill-logo.png', width: 250,),
									),
									Text("Dutch mill",
										style: TextStyle(
											fontSize: 40.0,
											fontWeight: FontWeight.w400,
										),
									),
									SizedBox(
										height: 150.0,
									),
									Container(
										margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
										decoration: BoxDecoration(
											border: Border.all(
												color: CupertinoColors.activeBlue.withOpacity(0.5),
												width: 1,
											),
											borderRadius: BorderRadius.circular(40.0),
										),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												Padding(
													padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
													child: Icon(
														Icons.person_outline,
														color: CupertinoColors.activeBlue.withOpacity(0.5),
														size: 30,
													),
												),
												Container(
													height: 50.0,
													width: 1.0,
													color: CupertinoColors.activeBlue.withOpacity(0.5),
													margin: const EdgeInsets.only(right: 20.0),
												),
												Expanded(
													child: TextField(
														style: TextStyle(color: Colors.black, fontSize: 20.0),
//														maxLength: 20,
														autocorrect: false,
														controller: usernameController,
														decoration: InputDecoration(
															border: InputBorder.none,
															hintText: 'Username',
															hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
														),
													),
												)
											],
										),
									),
									Container(
										margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
										decoration: BoxDecoration(
											border: Border.all(
												color: CupertinoColors.activeBlue.withOpacity(0.5),
												width: 1,
											),
											borderRadius: BorderRadius.circular(40.0),
										),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												Padding(
													padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
													child: Icon(
														Icons.lock_open,
														color: CupertinoColors.activeBlue.withOpacity(0.5),
														size: 30,
													),
												),
												Container(
													height: 50.0,
													width: 1.0,
													color: CupertinoColors.activeBlue.withOpacity(0.5),
													margin: const EdgeInsets.only(right: 20.0),
												),
												Expanded(
													child: TextField(
														style: TextStyle(color: Colors.black, fontSize: 20.0),
//														maxLength: 20,
														autocorrect: false,
														controller: passwordController,
														obscureText: true,
														decoration: InputDecoration(
															border: InputBorder.none,
															hintText: 'Password',
															hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
														),
													),
												)
											],
										),
									),
									Container(
										margin: EdgeInsets.only(top: 5),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceEvenly,
											children: <Widget>[
												Row(
													children: <Widget>[
														Radio(value: 0, groupValue: _radioValue, onChanged: _onRadioChange,),
														Text("Remember password", style: const TextStyle(fontSize: 20, color: CupertinoColors.inactiveGray),),
													],
												),
												Row(
													children: <Widget>[
														Radio(value: 1, groupValue: _radioValue, onChanged: _onRadioChange,),
														Text("Forget password", style: const TextStyle(fontSize: 20, color: CupertinoColors.inactiveGray),),
													],
												)
											],
										),
									),
									Container(
										margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
										child: Row(
											children: <Widget>[
												Expanded(
													child: RaisedButton(
														shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
														color: Colors.blue,
														child: Text('Log In', style: const TextStyle(fontSize: 20, color: Colors.white),),
														padding: EdgeInsets.symmetric(vertical: 25,),
														onPressed: () {
															Navigator.pushReplacementNamed(context, '/second');
														},
													),
												),
											],
										),
									)
								
								],
							),
						),
					),
				),
			),
		);
	}
	
	int _radioValue = -1;
	
	void _onRadioChange(int value) async {
		setState(() {
			_radioValue = value;
			switch (_radioValue) {
				case 0:
					saveSharedPreferences();
					break;
				case 1:
					resetSharedPreferences();
					break;
			}
		});
	}
	
	saveSharedPreferences() async {
		var prefs = await SharedPreferences.getInstance();
		prefs.setString("username", usernameController.text);
		prefs.setString("password", passwordController.text);
	}
	
	getSharedPreferences() async {
		var prefs = await SharedPreferences.getInstance();
		usernameController.text = prefs.getString("username") ?? "";
		passwordController.text = prefs.getString("password") ?? "";
	}
	
	resetSharedPreferences() async {
		var prefs = await SharedPreferences.getInstance();
		prefs.clear();
	}
	
}
