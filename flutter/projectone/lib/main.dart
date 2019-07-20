
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
	static const String _title = 'Dutchmill Stock Checker';
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: _title,
			theme: ThemeData(
				primarySwatch: Colors.lightBlue
			),
			home: MyStatefulWidget(),
		);
	}
}

final optionStyle =  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class EmployeeHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) => Text('Employee Home',style: optionStyle,);
}

class ProductHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) => Text('Product Home',style: optionStyle,);
}

class SettingHome extends StatelessWidget {
	@override
	Widget build(BuildContext context) => Text('Setting Home',style: optionStyle,);
}

class MyStatefulWidget extends StatefulWidget {
	MyStatefulWidget({Key key}) : super(key: key);
	
	@override
	_MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
	int _selectedIndex = 0;
	
	List<Widget> _widgetOptions = <Widget>[
		EmployeeHome(),
		ProductHome(),
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
				title: const Text('BottomNavigationBar Sample'),
			),
			body: SafeArea(
				child: Center(
					child: _widgetOptions.elementAt(_selectedIndex),
				),
			),
			bottomNavigationBar: BottomNavigationBar(
				items: const <BottomNavigationBarItem>[
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						title: Text('Home'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.business),
						title: Text('Business'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.school),
						title: Text('School'),
					),
				],
				currentIndex: _selectedIndex,
				selectedItemColor: Colors.amber[800],
				onTap: _onItemTapped,
			),
		);
	}
}
