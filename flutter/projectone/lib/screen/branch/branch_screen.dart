import 'package:flutter/material.dart';

class BranchScreen extends StatelessWidget {
  final title;

  const BranchScreen({this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
              Flexible(
                flex: 2,
                child: _middleFlex(context),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.white.withOpacity(0.88),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _middleFlex(BuildContext context) => Container(
        padding: const EdgeInsets.all(2.0),
        color: Colors.white.withOpacity(0.88),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button1',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button2',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button3',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Button4',
                    style: Theme.of(context).textTheme.button,
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      );
}
