import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
	
	@override
	_ProfileScreenState createState() => _ProfileScreenState();
	
}

class _ProfileScreenState extends State<ProfileScreen> {
	
	var controllers;
	
	@override
	void initState() {
		super.initState();
	}
	
	@override
	void dispose() {
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		print('build ProfileScreen');
		return SafeArea(
			minimum: EdgeInsets.all(25),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Expanded(
						child: Row(
							children: <Widget>[
								Expanded(
									child: Card(
										color: Colors.white70,
										elevation: 1,
										clipBehavior: Clip.antiAlias,
										child: Container(
//											color: Colors.tealAccent,
//											padding: EdgeInsets.symmetric(vertical: 10),
											child: Column(
												mainAxisAlignment: MainAxisAlignment.center,
//												crossAxisAlignment: CrossAxisAlignment.end,
												children: <Widget>[
													Expanded(
														child: Container(
//															color: Colors.teal,
															child: CircleAvatar(
																radius: 100.0,
																backgroundColor: Colors.blue.shade100,
																child: Icon(Icons.person_outline, size: 50,),
															),
														),
														flex: 4,
													),
//													Expanded(flex: 1,child: Container(),),
													Expanded(child: Container(child: Align(alignment: Alignment.centerLeft, child: Row(
														children: <Widget>[
															Icon(Icons.portrait),
															Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
															Text('X-00001',),
														],
													)), width: 300,),),
													Expanded(child: Container(child: Align(alignment: Alignment.centerLeft, child: Row(
														children: <Widget>[
															Icon(Icons.perm_identity),
															Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
															Text('NAME SURNAME',),
														],
													)), width: 300,),),
													Expanded(child: Container(child: Align(alignment: Alignment.centerLeft, child: Row(
														children: <Widget>[
															Icon(Icons.dashboard),
															Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
															Text('PC-XXXX',),
														],
													)), width: 300,),),
													Expanded(child: Container(child: Align(alignment: Alignment.centerLeft, child: Row(
														children: <Widget>[
															Icon(Icons.phone),
															Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
															Text('088-888-XXXX',),
														],
													)), width: 300,),),
												],
											),
										),
									),
								),
							],
						),
						flex: 2,
					),
					
					Expanded(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								Row(
									children: <Widget>[
//						  	SizedBox(width: 50,),
										Expanded(
											child: RaisedButton(
//						      	shape:  StadiumBorder(),
//						      	shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
												onPressed: () {
//									_onLoginButtonClick(context);
												},
												child: Text('Leave Apply', style: Theme
													.of(context)
													.textTheme
													.button,),
											),
										),
//							  SizedBox(width: 50,),
									],
								),
								
								Row(
									children: <Widget>[
//						  	SizedBox(width: 50,),
										Expanded(
											child: RaisedButton(
//						      	shape:  StadiumBorder(),
//						      	shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
												onPressed: () {
													Navigator.pushNamed(context, '/leaveStatusScreen');
												},
												child: Text('Leave Status', style: Theme
													.of(context)
													.textTheme
													.button,),
											),
										),
//							  SizedBox(width: 50,),
									],
								),
							
							],
						),
					),

//					Container(
//						margin: EdgeInsets.all(15.0),
//						padding: EdgeInsets.all(15.0),
//						child: Row(
//							mainAxisAlignment: MainAxisAlignment.start,
//							children: <Widget>[
//								Text("PROFILE", style: TextStyle(color: Colors.blue, fontSize: 21, fontWeight: FontWeight.bold),),
//							],
//						),
//					),
//					Container(
//						padding: EdgeInsets.all(20),
//						color: Colors.grey.withOpacity(0.65),
//						child: Row(
//							children: <Widget>[
//								FlatButton(
//									onPressed: () {},
//									padding: EdgeInsets.all(45),
//									child: Icon(
//										Icons.person,
//										color: Colors.blue.shade500,
//										size: 50.0,
//									),
//									shape: CircleBorder(),
//									color: Colors.blue.shade200.withOpacity(0.8)
//								),
//								Expanded(
//									child: Container(
//										height: 130,
////												color: Colors.red,
//										margin: EdgeInsets.only(left: 50.0),
//										child: Column(
//											mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//											children: <Widget>[
//												Row(
//													children: <Widget>[
//														Icon(Icons.edit, color: Colors.blue,),
//														Container(width: 20,),
//														Text("S001", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
//													],
//												),
//												Row(
//													children: <Widget>[
//														Icon(Icons.person, color: Colors.blue,),
//														Container(width: 20,),
//														Text("name surname", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
//													],
//												),
//												Row(
//													children: <Widget>[
//														Icon(Icons.lock, color: Colors.blue,),
//														Container(width: 20,),
//														Text("PC xxxx", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
//													],
//												),
//												Row(
//													children: <Widget>[
//														Icon(Icons.lock, color: Colors.white.withOpacity(0),),
//														Container(width: 20,),
//														Text("8888", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
//													],
//												),
//											],
//										),
//									),
//								),
//							],
//						),
//					),
//					SizedBox(
//						height: 100,
//					),
//					Container(
//						margin: EdgeInsets.symmetric(horizontal: 80),
//						child: Row(
//							children: <Widget>[
//								Expanded(
//									child: RaisedButton(
//										onPressed: () {},
//										color: Colors.blue,
//										child: Text("Leave", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
//										padding: EdgeInsets.all(35),
//									),
//								),
//							],
//						),
//					),
//					SizedBox(
//						height: 50,
//					),
//					Container(
//						margin: EdgeInsets.symmetric(horizontal: 80),
//						child: Row(
//							children: <Widget>[
//								Expanded(
//									child: RaisedButton(
//										onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => LeaveStatusScreen()),),
//										color: Colors.blue,
//										child: Text("Leave Status", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),),
//										padding: EdgeInsets.all(35),
//									),
//								),
//							],
//						),
//					)
				],
			),
		);
	}
}
