import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _node = FocusNode();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_node),
        child: SafeArea(
            minimum: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: TextField(
                          style: Theme.of(context).textTheme.body1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(
                              CupertinoIcons.search,
                              size: 35,
                            ),
                            hintText: 'Search Store',
//                            suffixIcon: IconButton(
//                              icon: Icon(
//                                CupertinoIcons.clear,
//                                size: 35,
//                              ),
//                              onPressed: () => debugPrint('123'),
//                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.done,
                                size: 35,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.shade400,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Text(
                              '40',
                              style: Theme.of(context).textTheme.headline,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.red,
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: Container(
                    color: Colors.teal,
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: Container(
                    color: Colors.red,
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: Container(
                    color: Colors.teal,
                  ),
                  flex: 2,
                ),
              ],
            )),
      );
}
