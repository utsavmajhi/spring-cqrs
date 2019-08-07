import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 5,
                        child: TextField(
                          style: Theme.of(context).textTheme.body1,
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
                    margin: EdgeInsets.symmetric(vertical: 5),
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
                        Expanded(
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
                                        width: 180,
                                        child: ListTile(
                                            onTap: () {
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          items[index] +
                                                              ' Clicked')));
                                            },
                                            title: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Flexible(child: Icon(
                                                  Icons.store,
                                                  color: Colors.red,
                                                  size: 100,)),
                                                Flexible(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('Tesco Lotus',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                      Text(
                                                        'No 000${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                      Text(
                                                        'Location ${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                    ],
                                                  ),)
                                              ],
                                            )
                                        ),
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
                    margin: EdgeInsets.symmetric(vertical: 5),
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
                        Expanded(
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
                                        width: 180,
                                        child: ListTile(
                                            onTap: () {
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          items[index] +
                                                              ' Clicked')));
                                            },
                                            title: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Flexible(child: Icon(
                                                  Icons.store, color: Colors
                                                    .green, size: 100,)),
                                                Flexible(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('Big C', style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .body1,),
                                                      Text(
                                                        'No 000${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                      Text(
                                                        'Location ${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                    ],
                                                  ),)
                                              ],
                                            )
                                        ),
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
                    margin: EdgeInsets.symmetric(vertical: 5),
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
                        Expanded(
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
                                        width: 180,
                                        child: ListTile(
                                            onTap: () {
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          items[index] +
                                                              ' Clicked')));
                                            },
                                            title: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Flexible(child: Icon(
                                                  Icons.store, color: Colors
                                                    .yellow, size: 100,)),
                                                Flexible(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('Tops', style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .body1,),
                                                      Text(
                                                        'No 000${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                      Text(
                                                        'Location ${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                    ],
                                                  ),)
                                              ],
                                            )
                                        ),
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
                    margin: EdgeInsets.symmetric(vertical: 5),
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
                        Expanded(
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
                                        width: 180,
                                        child: ListTile(
                                            onTap: () {
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          items[index] +
                                                              ' Clicked')));
                                            },
                                            title: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: <Widget>[
                                                Flexible(child: Icon(
                                                  Icons.store, color: Colors
                                                    .redAccent, size: 100,)),
                                                Flexible(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text('Makro', style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .body1,),
                                                      Text(
                                                        'No 000${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                      Text(
                                                        'Location ${items[index]}',
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .body1,),
                                                    ],
                                                  ),)
                                              ],
                                            )
                                        ),
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
            )),
      );
}
