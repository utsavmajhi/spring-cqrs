import 'package:flutter/material.dart';

class BranchScreen extends StatelessWidget {
  final title;

  const BranchScreen({this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(title, style: Theme
                .of(context)
                .textTheme
                .title)),
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Flexible(flex: 5, child: _top(context)),
//              Flexible(flex: 1, child: Container()),
              Flexible(flex: 3, child: _middle(context)),
              Flexible(flex: 3, child: _bottom(context)),
            ],
          ),
        ),
  );

  Widget _top(BuildContext context) =>
      Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(2.0),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          alignment: Alignment.center,
                          child: Text(
                            'Branch No 00001',
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: Text(
                            'Active',
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.only(left: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text('Line 1')),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Line 2'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Line 3'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.transparent,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Line 4'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Line 5'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _middle(BuildContext context) =>
      Container(
        padding: const EdgeInsets.all(2.0),
        color: Colors.white.withOpacity(0.88),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button1',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button2',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button3',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button4',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
              ],
            ),
          ],
        ),
      );

  Widget _bottom(BuildContext context) =>
      Container(
        padding: const EdgeInsets.all(2.0),
        color: Colors.white.withOpacity(0.88),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'PP',
                        style: Theme
                            .of(context)
                            .textTheme
                            .button,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'UHT',
                        style: Theme
                            .of(context)
                            .textTheme
                            .button,
                      ),
                    )),
              ],
            ),
          ],
        ),
      );
}
