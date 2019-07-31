import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectone/demo/cupertino/tab.dart';

class ProfileScreen extends StatefulWidget {
	@override
	_ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
	
	var controllers;
	
	final _node = FocusNode();
	final _formKey = GlobalKey<FormState>();
	final _scaffoldState = GlobalKey<ScaffoldState>();
	
	@override
	void dispose() {
		print('Profile Screen dispose');
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		print('Profile Screen build');
		return SafeArea(
			child: Container(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget>[
						Container(
							margin: EdgeInsets.all(15.0),
							padding: EdgeInsets.all(15.0),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.start,
								children: <Widget>[
									Text("PROFILE", style: TextStyle(color: Colors.blue, fontSize: 21, fontWeight: FontWeight.bold),),
								],
							),
						),
						Container(
							padding: EdgeInsets.all(20),
							color: Colors.grey.withOpacity(0.65),
							child: Row(
								children: <Widget>[
									FlatButton(
										onPressed: () {},
										padding: EdgeInsets.all(45),
										child: Icon(
											Icons.person,
											color: Colors.blue.shade500,
											size: 50.0,
										),
										shape: CircleBorder(),
										color: Colors.blue.shade200.withOpacity(0.8)
									),
									Expanded(
										child: Container(
											height: 130,
//												color: Colors.red,
											margin: EdgeInsets.only(left: 50.0),
											child: Column(
												mainAxisAlignment: MainAxisAlignment.spaceEvenly,
												children: <Widget>[
													Row(
														children: <Widget>[
															Icon(Icons.edit, color: Colors.blue,),
															Container(width: 20,),
															Text("S001", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
														],
													),
													Row(
														children: <Widget>[
															Icon(Icons.person, color: Colors.blue,),
															Container(width: 20,),
															Text("name surname", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
														],
													),
													Row(
														children: <Widget>[
															Icon(Icons.lock, color: Colors.blue,),
															Container(width: 20,),
															Text("PC xxxx", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
														],
													),
													Row(
														children: <Widget>[
															Icon(Icons.lock, color: Colors.white.withOpacity(0),),
															Container(width: 20,),
															Text("8888", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
														],
													),
												],
											),
										),
									),
								],
							),
						),
						SizedBox(
							height: 100,
						),
						Container(
							margin: EdgeInsets.symmetric(horizontal: 80),
							child: Row(
								children: <Widget>[
									Expanded(
										child: RaisedButton(
											onPressed: () {},
											color: Colors.blue,
											child: Text("Leave", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
											padding: EdgeInsets.all(35),
										),
									),
								],
							),
						),
						SizedBox(
							height: 50,
						),
						Container(
							margin: EdgeInsets.symmetric(horizontal: 80),
							child: Row(
								children: <Widget>[
									Expanded(
										child: RaisedButton(
											onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => LeaveStatusScreen()),),
											color: Colors.blue,
											child: Text("Leave Status", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
											padding: EdgeInsets.all(35),
										),
									),
								],
							),
						)
					],
				),
			),
		);
	}
}
