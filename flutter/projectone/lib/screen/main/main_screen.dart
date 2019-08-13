import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectone/screen/addretail/retail_screen.dart';
import 'package:projectone/screen/profile/profile_screen.dart';

import '../home/home_screen.dart';

class MainScreen extends StatefulWidget {
  final _screens = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    RetailScreen(),
    ProfileScreen(),
  ];

  final _titles = <String>[
    'Home Screen',
    'Cart Screen',
    'Add Retail Screen',
    'Profile Screen',
  ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _node = FocusNode();
  var _currentIndex = 0;
  var _title = '';

  @override
  void initState() {
    super.initState();
    _title = widget._titles[_currentIndex];
  }

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      _title = widget._titles[_currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build MainScreen');
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_node),
      // for hide keyboard
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(
            _title,
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: widget._screens,
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() =>
      BottomNavigationBar(
        iconSize: 40,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text(''),
          ),
        ],
        currentIndex: _currentIndex,
//			selectedItemColor: Colors.blueAccent,
        onTap: _onTapped,
      );
}
