import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';

void main() {
  Map<int, Widget> op = {
    1: Home(),
  };

  runApp(MaterialApp(
    home: AnimatedSplash(
      imagePath: 'assets/flutter_icon.png',
      home: Home(),
      duration: 2500,
      type: AnimatedSplashType.StaticDuration,
      outputAndHome: op,
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
            child: Text('My Cool App',
                style: TextStyle(color: Colors.black, fontSize: 20.0))));
  }
}

class HomeSt extends StatefulWidget {
  @override
  _HomeStState createState() => _HomeStState();
}

class _HomeStState extends State<HomeSt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
            child: Text('My Cool App home page 2',
                style: TextStyle(color: Colors.black, fontSize: 20.0))));
  }
}
