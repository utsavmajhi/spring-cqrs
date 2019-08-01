import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(App());

final appStyle = const TextStyle(
	fontFamily: 'K2D',
	fontSize: 18,
	fontWeight: FontWeight.w400,
	color: CupertinoColors.black
);

class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return CupertinoApp(
			theme: CupertinoThemeData(
				textTheme: CupertinoTextThemeData(
					textStyle: appStyle
				)
			),
			debugShowCheckedModeBanner: false,
			title: 'Tab demo',
			home: Home(),
		);
	}
}

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	@override
	Widget build(BuildContext context) =>
		CupertinoTabScaffold(
			tabBar: CupertinoTabBar(
				iconSize: 50.0,
				backgroundColor: CupertinoColors.lightBackgroundGray,
				items: [
					BottomNavigationBarItem(
						icon: Icon(CupertinoIcons.home),
//						title: Text('Home'),
					),
					BottomNavigationBarItem(
						icon: Icon(CupertinoIcons.shopping_cart),
//						title: Text('Cart'),
					),
					BottomNavigationBarItem(
						icon: Icon(CupertinoIcons.add,),
//						title: Text('Add'),
					),
					BottomNavigationBarItem(
						icon: Icon(CupertinoIcons.person_solid),
//						title: Text('Person'),
					),
				],
			),
			tabBuilder: (context, index) =>
				CupertinoTabView(
					builder: (context) {
						switch (index) {
							case 0:
								return HomeTab();
								break;
							case 1:
								return CartTab();
								break;
							case 2:
								return AddTab();
								break;
							case 3:
								return PersonTab();
								break;
							default:
								return Container();
						}
					},
				),
		);
}

class HomeTab extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text("Home Tab", style: appStyle),
			),
			child: SafeArea(
				child: Container(
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text("Home"),
								CupertinoTextField(textCapitalization: TextCapitalization.words,)
							],
						),
					)
				),
			)
		);
}

class CartTab extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text("Cart Tab 2", style: appStyle),
			),
			child: SafeArea(
				child: Container(
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text("Cart")
							],
						),
					)
				),
			)
		);
}

class AddTab extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text("Add", style: appStyle),
			),
			child: SafeArea(
				child: Container(
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text("Hehe")
							],
						),
					)
				),
			)
		);
}

class PersonTab extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text("Profile", style: appStyle),
			),
			child: SafeArea(
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
											child: CupertinoButton(
												onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => LeaveScreen()),),
												color: Colors.blue,
												child: Text("Leave", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),),
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
											child: CupertinoButton(
												onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => LeaveStatusScreen()),),
												color: Colors.blue,
												child: Text("Leave Status", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),),
												padding: EdgeInsets.all(35),
											),
										),
									],
								),
							)
						],
					),
				),
			),
		);
}

class LeaveStatusScreen extends StatelessWidget {
	final items = List<String>.generate(5, (i) => "Item $i");
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: CupertinoPageScaffold(
				navigationBar: CupertinoNavigationBar(
					leading: GestureDetector(child: Icon(CupertinoIcons.back), onTap: () {
						Navigator.pop(context);
					},),
					middle: Text("Leave Status", style: appStyle),
				),
				child: SafeArea(
					child: ListView.builder(
						scrollDirection: Axis.vertical,
						itemCount: items.length,
						itemBuilder: (context, index) {
							return Card(
								elevation: 1.0,
								margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
								color: Color.fromRGBO(242, 242, 242, 1),
								child: Container(
									child: ListTile(
										contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
										title: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Text('XXX-0000000', style: appStyle,),
												Text('Business Leave DutchMill', style: appStyle,),
//										     Text(DateTime.now().toString()),
											],
										),
										subtitle: Text(
											DateFormat("dd/MM/yyyy").format(DateTime.now()) + ' - ' + DateFormat("dd/MM/yyyy").format(DateTime.now().add(Duration(days: 1)))
											, style: appStyle,),
										trailing: Icon(Icons.brightness_1, size: 60.0, color: index > 0 ? Colors.green : Colors.red,),
									),
								),
							);
						},
					
					)
				),
			),
		);
	}
}

class LeaveScreen extends StatefulWidget {
	@override
	_LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
	final _leaveScreenFormKey = GlobalKey<FormState>();
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			supportedLocales: [
				const Locale('en', 'US'),
			],
			home: Scaffold(
				body: CupertinoPageScaffold(
					navigationBar: CupertinoNavigationBar(
						leading: GestureDetector(child: Icon(CupertinoIcons.back), onTap: () {
							Navigator.pop(context);
						},),
						middle: Text("Leave", style: appStyle),
					),
					child: Container(
						width: MediaQuery
							.of(context)
							.size
							.width,
						height: MediaQuery
							.of(context)
							.size
							.height,
						child: SafeArea(
							child: Builder(
								builder: (context) =>
									Form(
										key: _leaveScreenFormKey,
										child: Padding(
											padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
											child: Column(
												mainAxisAlignment: MainAxisAlignment.start,
												crossAxisAlignment: CrossAxisAlignment.start,
												children: <Widget>[
													Text('ประเภทการลา', style: appStyle,),
													Row(
														mainAxisAlignment: MainAxisAlignment.start,
														children: <Widget>[
															Radio(
																value: 0,
//											groupValue: _radioValue1,
//											onChanged: _handleRadioValueChange1,
															),
															Text(
																'Sick Leave',
																style: appStyle,
															),
															Radio(
																value: 1,
//											groupValue: _radioValue1,
//											onChanged: _handleRadioValueChange1,
															),
															Text(
																'Vacation Leave',
																style: appStyle,
															),
															Radio(
																value: 2,
//											groupValue: _radioValue1,
//											onChanged: _handleRadioValueChange1,
															),
															Text(
																'Business Leave',
																style: appStyle,
															),
														],
													),
													Container(
														margin: EdgeInsets.symmetric(vertical: 10),
														child: Divider(height: 1.0, color: Colors.grey,),
													),
													Column(
														mainAxisAlignment: MainAxisAlignment.spaceAround,
														crossAxisAlignment: CrossAxisAlignment.start,
														children: <Widget>[
															Text('เริ่มวันที่', style: appStyle,),
															GestureDetector(
																child: Text('Date picker 1'),
																onTap: () => _selectDate(context),
															),
														
														],
													),
													Container(
														margin: EdgeInsets.symmetric(vertical: 10),
														child: Divider(height: 1.0, color: Colors.grey,),
													),
													Column(
														mainAxisAlignment: MainAxisAlignment.spaceAround,
														crossAxisAlignment: CrossAxisAlignment.start,
														children: <Widget>[
															Text('ถึงวันที่', style: appStyle,),
															Text('Date picker 2'),
														],
													),
													Container(
														margin: EdgeInsets.symmetric(vertical: 10),
														child: Divider(height: 1.0, color: Colors.grey,),
													),
													Column(
														mainAxisAlignment: MainAxisAlignment.spaceAround,
														crossAxisAlignment: CrossAxisAlignment.start,
														children: <Widget>[
//												Text('Remark', style: appStyle,),
															TextField(
																maxLines: 3,
																decoration: InputDecoration(
																	labelStyle: TextStyle(fontSize: 25),
																	hintText: 'Tell me something why do you want to leave.',
																	labelText: 'หมายเหตุ',
																	border: OutlineInputBorder(
//															borderRadius:  BorderRadius.circular(20),
																	)
																),
															)
														],
													),
												],
											),
										),
									),
							
							),
						),
					)
				),
			),
		);
	}
	
	DateTime selectedDate = DateTime.now();
	
	Future<void> _selectDate(BuildContext context) async {
		final DateTime picked = await showDatePicker(
			context: context,
			initialDate: selectedDate,
			firstDate: DateTime(2019, 1),
			lastDate: DateTime(2200),
		);
		if (picked != null && picked != selectedDate)
			setState(() {
				selectedDate = picked;
			});
	}
	
}








