import 'package:flutter/material.dart';
import 'package:projectone/main.dart';

class MainScreen extends StatefulWidget {
	@override
	_MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
	final _scaffoldState = GlobalKey<ScaffoldState>();
	var _currentTabIndex = 0;
	final _tabOptions = <Widget>[
		EmployeeHome(),
		ProductHome(),
		CartHome(),
		SettingHome(),
	];
	
	_onTapped(int index) => setState(() => _currentTabIndex = index);
	
	@override
	Widget build(BuildContext context) =>
		Scaffold(
			key: _scaffoldState,
			appBar: AppBar(
				title: Text('Main Screen'),
			),
			body: _tabOptions[_currentTabIndex],
			bottomNavigationBar: _buildBottomNavigationBar(),
		);
	
	Widget _buildBottomNavigationBar() =>
		BottomNavigationBar(
			iconSize: 50,
//			showSelectedLabels: false,
//			showUnselectedLabels: false,
			type: BottomNavigationBarType.fixed,
			items: const <BottomNavigationBarItem>[
				BottomNavigationBarItem(
					icon: Icon(Icons.home),
					title: Text('Home'),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.shopping_cart),
					title: Text('Cart'),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.add),
					title: Text('Add'),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.person),
					title: Text('Account'),
				),
			],
			currentIndex: _currentTabIndex,
//			selectedItemColor: Colors.blueAccent,
			onTap: _onTapped,
		);
	
}
