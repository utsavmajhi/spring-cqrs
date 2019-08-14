import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RetailApplicationScreen extends StatefulWidget {
  final storeId;

  RetailApplicationScreen({this.storeId, Key key}) : super(key: key);

  @override
  _RetailApplicationScreenState createState() =>
      _RetailApplicationScreenState();
}

class _RetailApplicationScreenState extends State<RetailApplicationScreen> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _formState = GlobalKey<FormState>();
  final _node = FocusNode();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_node),
        child: Scaffold(
            key: _scaffoldState,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Add Retail Application Screen",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            body: SafeArea(
                minimum: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formState,
                      child: Column(
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            child: Center(
                              child: Container(
                                  width: 300.0,
                                  height: 200.0,
                                  child:
//                                  Image.asset('images/person.jpg'),
                                      IconButton(
                                    icon: Icon(Icons.image),
                                    onPressed: () {},
                                    iconSize: 88.8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  )),
                            ),
                          ),
//                          Flexible(
//                            flex: 1,
//                            child: Container(
//                                child: Align(
//                                    alignment: Alignment.bottomLeft,
//                                    child: Text(
//                                      'Detail',
//                                      style:
//                                          Theme.of(context).textTheme.headline,
//                                    ))),
//                          ),
                          Flexible(
                            flex: 8,
                            child: Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  style: Theme.of(context).textTheme.body1,
                                  decoration: InputDecoration(
                                    hintText: 'Code',
                                    hintStyle:
                                        Theme.of(context).textTheme.display1,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  style: Theme.of(context).textTheme.body1,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle:
                                        Theme.of(context).textTheme.display1,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  style: Theme.of(context).textTheme.body1,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Average Daily Sales',
                                    hintStyle:
                                        Theme.of(context).textTheme.display1,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  style: Theme.of(context).textTheme.body1,
                                  decoration: InputDecoration(
                                    hintText: 'Phone',
                                    hintStyle:
                                        Theme.of(context).textTheme.display1,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  style: Theme.of(context).textTheme.body1,
                                  decoration: InputDecoration(
                                    hintText: 'Address',
                                    hintStyle:
                                        Theme.of(context).textTheme.display1,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            bottomNavigationBar: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                    ),
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )),
      );
}
