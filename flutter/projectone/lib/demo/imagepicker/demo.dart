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
		if (this._imageFile == null) return;

//		FormData formdata = new FormData(); // just like JS
//		formdata.add("photos", new UploadFileInfo(_image, basename(_image.path)));
		
		final formData = new FormData.from({
			"name": "file-name.jpg",
			"image": new UploadFileInfo(_imageFile, basename(_imageFile.path))
		});
		await Dio().post(
			"http://localhost:8080/files",
			data: formData,
			options: Options(
				headers: {
					// call this from sharedpreference
					HttpHeaders
						.authorizationHeader: 'Bearer eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNqqViouTVKyUkpMyc3MU9JRykwsUbIyNDUzMTc2MDIy1lFKLC3JAMoH-fu4xju6-Hr66YCZocGuQUDlqRUFEOUWhmZmRsa1AAAAAP__.jXzgZOqf0g2pl1zkZzqMFJ_FCH5DOdrnBJElolcw6AlGrAFk3mlNyg_oi8priWwTCYJrIGkrXoZ9LEZIiBygbg',
				},
			),
		);

//		String base64Image = await base64Encode(this._imageFile.readAsBytesSync());
//		String fileName = this._imageFile.path
//			.split("/")
//			.last;
//
//		http.post('dfdf', body: {
//			"image": base64Image,
//			"name": fileName,
//		}).then((res) {
//			print(res.statusCode);
//		}).catchError((err) {
//			print(err);
//		});
	}
	
}