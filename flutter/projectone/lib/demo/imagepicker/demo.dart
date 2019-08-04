//import 'dart:io';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//
//
//main()=>runApp(MaterialApp(
//	title: 'demo',
//	home: MyHomePage(),
//));
//
//class MyHomePage extends StatefulWidget {
//	@override
//	_MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//	File _image;
//
//	Future getImage() async {
//		var image = await ImagePicker.pickImage(source: ImageSource.camera);
//
//		setState(() {
//			_image = image;
//		});
//	}
//
//	@override
//	Widget build(BuildContext context) {
//		return Scaffold(
//			appBar: AppBar(
//				title: Text('Image Picker Example'),
//			),
//			body: Center(
//				child: _image == null
//					? Text('No image selected.')
//					: Image.file(_image),
//			),
//			floatingActionButton: FloatingActionButton(
//				onPressed: getImage,
//				tooltip: 'Pick Image',
//				child: Icon(Icons.add_a_photo),
//			),
//		);
//	}
//}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() =>
	runApp(MaterialApp(
		title: 'demo',
		home: ImagePickerExample(),
	));

class ImagePickerExample extends StatefulWidget {
	const ImagePickerExample({Key key}) : super(key: key);
	
	@override
	_ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
	File _imageFile;
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: ListView(
				children: <Widget>[
					ButtonBar(
						children: <Widget>[
							IconButton(
								icon: Icon(Icons.photo_camera),
								onPressed: () async => await _pickImageFromCamera(),
								tooltip: 'Shoot picture',
							),
							IconButton(
								icon: Icon(Icons.photo),
								onPressed: () async => await _pickImageFromGallery(),
								tooltip: 'Pick from gallery',
							),
							IconButton(
								icon: Icon(Icons.file_upload),
								onPressed: () async => _upload(),
							)
						],
					),
					this._imageFile == null ? Placeholder() : Image.file(this._imageFile),
				],
			),
		);
	}
	
	Future _pickImageFromGallery() async {
		final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
		setState(() => this._imageFile = imageFile);
	}
	
	Future _pickImageFromCamera() async {
		final imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
		setState(() => this._imageFile = imageFile);
	}
	
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
					HttpHeaders
						.authorizationHeader: 'Bearer $token',
				},
			),
		);
	}
	
	Future<String> _getToken() async {
		var prefs = await SharedPreferences.getInstance();
		return prefs.getString("token") ?? "";
	}
	
}