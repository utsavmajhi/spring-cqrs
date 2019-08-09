import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectone/screen/branch/branch_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _node = FocusNode();

  final items = List<String>.generate(8, (i) => '${i + 1}');

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_node),
        child: SafeArea(
            minimum: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 5,
                            child: TextField(
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .body1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(CupertinoIcons.search,
                                    size: 35, color: Colors.blueAccent),
                                hintText: 'Search Store',
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
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
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.5),
                        color: Colors.white.withOpacity(0.88),
                        child: Column(
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.lightBlue,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Tesco Lotus',
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        )),
                                    flex: 3,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .body1,
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          CupertinoIcons.search,
                                          size: 25,
                                          color: Colors.blueAccent,
                                        ),
                                        hintText: 'Search Store',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder: (context, index) =>
                                        Card(
                                          margin: const EdgeInsets.all(10),
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 1,
                                          color: Colors.white.withOpacity(0.88),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 180,
                                            child: ListTile(
                                                onTap: () =>
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                BranchScreen(
                                                                  title: 'Tesco',))),
                                                title: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                        child: Container(
                                                            child: Image.asset(
                                                              'images/tesco.png',
//                                                          width: 150,height: 150,
                                                            ))
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              'Tesco Lotus',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch code 000${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch name xxx${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.5),
                        color: Colors.white.withOpacity(0.88),
                        child: Column(
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.lightBlue,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Big C',
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        )),
                                    flex: 3,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .body1,
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          CupertinoIcons.search,
                                          size: 25,
                                          color: Colors.blueAccent,
                                        ),
                                        hintText: 'Search Store',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder: (context, index) =>
                                        Card(
                                          margin: const EdgeInsets.all(10),
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 1,
                                          color: Colors.white.withOpacity(0.88),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 180,
                                            child: ListTile(
                                                onTap: () =>
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                BranchScreen(
                                                                  title: 'BigC',))),
                                                title: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                        child: Container(
                                                            child: Image.asset(
                                                              'images/bigc.png',
//                                                          width: 150,height: 150,
                                                            ))
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              'Big C',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch code 000${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch name xxx${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.5),
                        color: Colors.white.withOpacity(0.88),
                        child: Column(
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.lightBlue,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Tops',
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        )),
                                    flex: 3,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .body1,
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          CupertinoIcons.search,
                                          size: 25,
                                          color: Colors.blueAccent,
                                        ),
                                        hintText: 'Search Store',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder: (context, index) =>
                                        Card(
                                          margin: const EdgeInsets.all(10),
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 1,
                                          color: Colors.white.withOpacity(0.88),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 180,
                                            child: ListTile(
                                                onTap: () =>
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                BranchScreen(
                                                                  title: 'Tops',))),
                                                title: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                        child: Container(
                                                            child: Image.asset(
                                                              'images/tops-logo.jpg',
//                                                          width: 150,height: 150,
                                                            ))
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              'Tops',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch code 000${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch name xxx${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2.5),
                        color: Colors.white.withOpacity(0.88),
                        child: Column(
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.lightBlue,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Makro',
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        )),
                                    flex: 3,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .body1,
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(
                                          CupertinoIcons.search,
                                          size: 25,
                                          color: Colors.blueAccent,
                                        ),
                                        hintText: 'Search Store',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder: (context, index) =>
                                        Card(
                                          margin: const EdgeInsets.all(10),
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 1,
                                          color: Colors.white.withOpacity(0.88),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 180,
                                            child: ListTile(
                                                onTap: () =>
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                BranchScreen(
                                                                  title: 'Makro',))),
                                                title: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                        child: Container(
                                                            child: Image.asset(
                                                              'images/makro-th.jpg',
//                                                          width: 150,height: 150,
                                                            ))
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              'Makro',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch code 000${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                            Text(
                                                              'branch name xxx${items[index]}',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .body1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 2,
                    ),

                  ],
                ),
              ),
            )),
      );
}
