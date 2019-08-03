import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var dio = Dio();

main() => runApp(Demo());

class Demo extends StatelessWidget {
	@override
	Widget build(BuildContext context) =>
		MaterialApp(
			title: 'Demo',
			home: Home(),
		);
}

class Home extends StatelessWidget {
	
	@override
	Widget build(BuildContext context) =>
		Scaffold(
			body: Container(child: Center(
				child: RaisedButton(
					child: Text('Click'),
					onPressed: () async {
						final formData = new FormData.from({
							"name": "file-name.jpg",
							"file": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
						});
						await dio.post("/info", data: formData);
					},
				),
			),),
		);
}





