import 'package:flutter/material.dart';
import 'package:projectone/main.dart';
import 'package:projectone/screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
	final _screens = <Widget>[
		EmployeeHome(),
		ProductHome(),
		CartHome(),
		ProfileScreen(),
	];
	
	@override
	_MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
	final _scaffoldState = GlobalKey<ScaffoldState>();
	var _currentIndex = 3;
	
	_onTapped(int index) => setState(() => _currentIndex = index);
	
	@override
	Widget build(BuildContext context) {
		print('build main screen');
		return Scaffold(
			key: _scaffoldState,
			appBar: AppBar(title: Text("Main Screen", style: Theme
				.of(context)
				.textTheme
				.title,),),
			body: IndexedStack(
				index: _currentIndex,
				children: widget._screens,
			),
			bottomNavigationBar: _buildBottomNavigationBar(),
		);
	}
	
	Widget _buildBottomNavigationBar() =>
		BottomNavigationBar(
			iconSize: 50,
			showSelectedLabels: false,
			showUnselectedLabels: false,
			type: BottomNavigationBarType.fixed,
			items: const <BottomNavigationBarItem>[
				BottomNavigationBarItem(
					icon: Icon(Icons.home),
					title: Text(''),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.add_shopping_cart),
					title: Text(''),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.add),
					title: Text(''),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.person),
					title: Text(''),
				),
			],
			currentIndex: _currentIndex,
//			selectedItemColor: Colors.blueAccent,
			onTap: _onTapped,
		);
	
}
