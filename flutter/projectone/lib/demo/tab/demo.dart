import 'package:flutter/material.dart';

main() => runApp(TabsDemoScreen());

class TabScreen extends StatelessWidget {
	final Color color;
	
	TabScreen(this.color);
	
	@override
	Widget build(BuildContext context) {
		return Container(
			color: color,
		);
	}
}

class TabsDemoScreen extends StatefulWidget {
	TabsDemoScreen() : super();
	
	final String title = "Flutter Bottom Tab demo";
	
	@override
	_TabsDemoScreenState createState() => _TabsDemoScreenState();
}

class _TabsDemoScreenState extends State<TabsDemoScreen> {
	int currentTabIndex = 0;
	List<Widget> tabs = [
		TabScreen(Colors.green),
		TabScreen(Colors.orange),
		TabScreen(Colors.blue)
	];
	
	onTapped(int index) {
		setState(() {
			currentTabIndex = index;
		});
	}
	
	@override
	Widget build(BuildContext context) =>
		MaterialApp(
			theme: ThemeData(primarySwatch: Colors.indigo),
			home: Scaffold(
				appBar: AppBar(
					title: Text(widget.title, style: const TextStyle(fontFamily: 'K2D'),),
				
				),
				body: tabs[currentTabIndex],
				bottomNavigationBar: _bottomNavigationBar(),
			),
		);
	
	Widget _bottomNavigationBar() =>
		BottomNavigationBar(
			onTap: onTapped,
			currentIndex: currentTabIndex,
			selectedFontSize: 18,
			unselectedFontSize: 18,
			iconSize: 35,
			items: [
				BottomNavigationBarItem(
					icon: Icon(Icons.home),
					title: Text("Home", style: const TextStyle(fontFamily: 'K2D'),),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.mail),
					title: Text("Messages", style: const TextStyle(fontFamily: 'K2D'),),
				),
				BottomNavigationBarItem(
					icon: Icon(Icons.person),
					title: Text("Profile", style: const TextStyle(fontFamily: 'K2D'),),
				)
			],
		);
	
}