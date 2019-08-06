import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveApplicationScreen extends StatefulWidget {
  final bool isView;

  LeaveApplicationScreen({this.isView, Key key}) : super(key: key);

  @override
  _LeaveApplicationScreenState createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _format = DateFormat("dd-MM-yyyy");
  final _node = FocusNode();

  int _leaveValue;

  @override
  void initState() {
    super.initState();
    _leaveValue = 0;
  }

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_node),
        child: Scaffold(
          key: _scaffoldState,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Leave Application Screen",
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          body: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 2,
                            child: Visibility(
                              visible: widget.isView,
                              child: Container(
                                height: 75,
                                color: Colors.green,
                                child: Center(
                                    child: Text(
                                      'Approved',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .button,
                                    )),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Leave Type',
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: RadioListTile(
                              value: 0,
                              groupValue: _leaveValue,
                              title: Text(
                                'Sick Leave',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                              ),
                              onChanged: widget.isView ? null : _leaveChanged,
                              selected: false,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: 1,
                              groupValue: _leaveValue,
                              title: Text(
                                'Vacation Leave',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                              ),
                              onChanged: widget.isView ? null : _leaveChanged,
                              selected: false,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: 2,
                              groupValue: _leaveValue,
                              title: Text(
                                'Business Leave',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                              ),
                              onChanged: widget.isView ? null : _leaveChanged,
                              selected: false,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: 3,
                              groupValue: _leaveValue,
                              title: Text(
                                'Other Leave',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                              ),
                              onChanged: widget.isView ? null : _leaveChanged,
                              selected: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Begin Date',
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: DateTimeField(
                          readOnly: widget.isView,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.blueAccent,
                              size: 35,
                            ),
                          ),
                          format: _format,
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                          onShowPicker: (context, currentValue) =>
                          widget.isView
                              ? null
                              : showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2200))),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'End Date',
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: DateTimeField(
                          readOnly: widget.isView,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.blueAccent,
                              size: 35,
                            ),
                          ),
                          format: _format,
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                          onShowPicker: (context, currentValue) =>
                          widget.isView
                              ? null
                              : showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2200))),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Remark',
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        readOnly: widget.isView,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
//															borderRadius:  BorderRadius.circular(20),
                          ),
                          icon: Icon(
                            Icons.bookmark,
                            color: Colors.blueAccent,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
              )
          ),
            bottomNavigationBar: Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Text(
                    'Save',
                    style: Theme
                        .of(context)
                        .textTheme
                        .button,
                  ),
                  onPressed: widget.isView ? null : () {},
                ),
              )
            ],)
        ),
      );

  _leaveChanged(int val) {
    setState(() {
      _leaveValue = val;
    });
  }
}
