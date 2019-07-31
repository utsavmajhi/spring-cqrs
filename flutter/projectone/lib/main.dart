import 'package:flutter/material.dart';
import 'package:projectone/screen/login_screen.dart';
import 'package:projectone/screen/profile_screen.dart';

import 'constant.dart';

main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
	static const String _title = 'Dutchmill Stock Checker';
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: _title,
			theme: lightTheme,
			initialRoute: '/',
			routes: {
				'/': (context) => LoginScreen(),
				'/profileScreen': (context) => ProfileScreen(),
				'/second': (context) => MainScreen(),
			},
//			home: MainScreen(),
		);
	}
}

class EmployeeHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		Text('Home', style: const TextStyle(fontSize: 30,
			fontWeight: FontWeight.bold,
			backgroundColor: Colors.red),);
}

class ProductHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		Text('Product Home', style: const TextStyle(fontSize: 30,
			fontWeight: FontWeight.bold,
			backgroundColor: Colors.blue),);
}

class CartHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		Text('Cart Home', style: const TextStyle(fontSize: 30,
			fontWeight: FontWeight.bold,
			backgroundColor: Colors.blue),);
}

class SettingHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		Text('Setting Home', style: const TextStyle(fontSize: 30,
			fontWeight: FontWeight.bold,
			backgroundColor: Colors.green),);
}

class MainScreen extends StatefulWidget {
	MainScreen({Key key}) : super(key: key);
	
	@override
	_MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
	int _selectedIndex = 0;
	
	List<Widget> _widgetOptions = <Widget>[
		EmployeeHome(),
		ProductHome(),
		CartHome(),
		SettingHome(),
	];
	
	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Home Screen'),
			),
			body: SafeArea(
				child: Center(
					child: _widgetOptions.elementAt(_selectedIndex),
				),
			),
			bottomNavigationBar: Container(
				decoration: BoxDecoration(
					border: Border.all(
						color: Colors.grey.withOpacity(0.5),
						width: 1.0,
					),
				),
				child: BottomNavigationBar(
					iconSize: 50,
					showSelectedLabels: false,
					showUnselectedLabels: false,
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
					currentIndex: _selectedIndex,
					selectedItemColor: Colors.blueAccent,
					onTap: _onItemTapped,
				),
			),
		);
	}
}

