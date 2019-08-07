import 'package:flutter/material.dart';
import 'package:projectone/demo/timer/debouncer.dart';
import 'package:projectone/screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controllers;

  final _node = FocusNode();
  final _formState = GlobalKey<FormState>();
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controllers = <String, TextEditingController>{
      'usernameController': TextEditingController(),
      'passwordController': TextEditingController(),
    };
    _getSharedPreferences();
    controllers['usernameController'].addListener(_onUsernameChange);
  } //

  @override
  void dispose() {
    controllers.forEach((k, v) => v.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_node),
        // for hide keyboard
        child: Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldState,
          appBar: AppBar(
            title: Text(
              "Log In Screen",
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          body: SafeArea(
            minimum: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Image.asset(
                        'images/dutchmill-logo.png',
                        width: 250,
                      ),
                    ),
                  ),
                  flex: 3,
                ),
                Form(
                  key: _formState,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: TextFormField(
                                controller: controllers['usernameController'],
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                                maxLength: 20,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
//																borderRadius: BorderRadius.circular(50)
                                  ),
                                  icon: Icon(
                                    Icons.person_outline,
                                    color: Colors.blueAccent,
                                    size: 35,
                                  ),
//														fillColor: Colors.white,
                                ),
                              ))
//							  		Text('Field1')
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: TextFormField(
                                controller: controllers['passwordController'],
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                                maxLength: 20,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
//																borderRadius: BorderRadius.circular(50)
                                  ),
//															enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                                  icon: Icon(
                                    Icons.lock_open,
                                    color: Colors.blueAccent,
                                    size: 35,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Container(),
                            flex: 2,
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              child: RadioListTile(
                                title: Text(
                                  'Remember me',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .body2,
                                ),
                                groupValue: _radioValue,
                                onChanged: _onRadioChange,
                                value: 0,
                                selected: false,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(),
                            flex: 1,
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              child: Center(
                                child: RadioListTile(
                                  title: Text(
                                    'Forgot me',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .body2,
                                  ),
                                  groupValue: _radioValue,
                                  onChanged: _onRadioChange,
                                  value: 1,
                                  selected: false,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(),
                            flex: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
//												shape: StadiumBorder(),
//												shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () {
                            _onLoginButtonClick(context);
                          },
                          child: Text(
                            'Log In',
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      );

  int _radioValue = -1;

  void _onRadioChange(int value) async {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _saveSharedPreferences();
          break;
        case 1:
          _clearSharedPreferences();
          break;
      }
    });
  }

  _saveSharedPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt("remember", _radioValue);
    prefs.setString("username", controllers['usernameController'].text);
    prefs.setString("password", controllers['passwordController'].text);
  }

  _getSharedPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    _radioValue = prefs.getInt("remember") ?? -1;
    controllers['usernameController'].text = prefs.getString("username") ?? "";
    controllers['passwordController'].text = prefs.getString("password") ?? "";
  }

  _clearSharedPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  final _debouncer = Debouncer(milliseconds: 1000);

  _onUsernameChange() {
    _debouncer.run(() =>
        print(DateTime.now().toString() +
            ' : ' +
            controllers['usernameController'].text));
  }

  _onLoginButtonClick(BuildContext context) {
//    Navigator.pushReplacementNamed(context, '/mainScreen');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }
}
