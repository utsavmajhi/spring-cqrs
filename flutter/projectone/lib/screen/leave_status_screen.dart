import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'leave_application_screen.dart';

class LeaveStatusScreen extends StatelessWidget {
  final items = List<String>.generate(5, (i) => '${i + 1}');
  final dateFomat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Leave Status Screen",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: RefreshIndicator(
            onRefresh: _refresh,
            color: Colors.blue,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: (context, index) => Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.white70,
                      child: Container(
                        child: ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeaveApplicationScreen(
                                        isView: true,
                                      ))),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'GSH-0000${items[index]}',
                                style: Theme.of(context).textTheme.body1,
                              ),
                              Text(
                                'Business Leave',
                                style: Theme.of(context).textTheme.body1,
                              ),
//										     Text(DateTime.now().toString()),
                            ],
                          ),
                          subtitle: Text(
                            dateFomat.format(DateTime.now()) +
                                ' - ' +
                                dateFomat.format(
                                    DateTime.now().add(Duration(days: 1))),
                            style: Theme.of(context).textTheme.body1,
                          ),
                          trailing: Icon(
                            Icons.brightness_1,
                            size: 60.0,
                            color: index > 0
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      );

  Future _refresh() async {
    print('refreshing status...');
  }
}
