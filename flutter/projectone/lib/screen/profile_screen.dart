import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'leave_application_screen.dart';
import 'leave_status_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      color: Colors.white70,
                      elevation: 1,
                      clipBehavior: Clip.antiAlias,
                      child: Container(
//											color: Colors.tealAccent,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () async =>
                                await _pickImageFromGallery(),
                                child: Container(
//																padding: const EdgeInsets.symmetric(vertical: 10),
//																width: 200,
//																height: 200,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 90,
                                        backgroundImage: _imageFile == null
                                            ? AssetImage('images/person.jpg')
                                            : FileImage(_imageFile),
                                      ),
//																_imageFile == null ? Image.asset('images/dutchmill-logo.png') : Image.file(_imageFile),),
                                    )),
                              ),
                              flex: 4,
                            ),
//													Expanded(flex: 1,child: Container(),),
                            Expanded(
                              child: Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.portrait),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                        Text(
                                          'X-00001',
                                          style:
                                          Theme
                                              .of(context)
                                              .textTheme
                                              .body2,
                                        ),
                                      ],
                                    )),
                                width: 220,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.perm_identity),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                        Text(
                                          'Nattaphon Jeamjit',
                                          style:
                                          Theme
                                              .of(context)
                                              .textTheme
                                              .body2,
                                        ),
                                      ],
                                    )),
                                width: 220,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.dashboard),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                        Text(
                                          'PC-8888',
                                          style:
                                          Theme
                                              .of(context)
                                              .textTheme
                                              .body2,
                                        ),
                                      ],
                                    )),
                                width: 220,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.phone),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                        Text(
                                          '088-888-8888',
                                          style:
                                          Theme
                                              .of(context)
                                              .textTheme
                                              .body2,
                                        ),
                                      ],
                                    )),
                                width: 220,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
//						  	SizedBox(width: 50,),
                      Expanded(
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
//						      	shape:  StadiumBorder(),
//						      	shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LeaveApplicationScreen(
                                            isView: false,
                                          ))),
                          child: Text(
                            'Leave Application',
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                          ),
                        ),
                      ),
//							  SizedBox(width: 50,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
//						  	SizedBox(width: 50,),
                      Expanded(
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
//						      	shape:  StadiumBorder(),
//						      	shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LeaveStatusScreen())),
                          child: Text(
                            'Leave Status',
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                          ),
                        ),
                      ),
//							  SizedBox(width: 50,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  File _imageFile;

  Future _pickImageFromGallery() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() => _imageFile = imageFile);
    }
  }

  Future<String> _getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  // call this method after picked image
  _upload() async {
    final token = await _getToken();
    final formData = new FormData.from({
      "name": "file-name.jpg",
      "image": new UploadFileInfo(_imageFile, basename(_imageFile.path))
    });
    await Dio().post(
      "http://localhost:8080/files",
      data: formData,
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );
  }
}
