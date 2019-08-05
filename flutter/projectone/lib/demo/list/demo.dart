import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDisplay extends StatefulWidget {
	@override
	_ListDisplayState createState() => _ListDisplayState();
}
//
//class _ListDisplayState extends State<ListDisplay> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

class _ListDisplayState extends State<ListDisplay> {
	List<String> litems = ['A', 'B'];
	final TextEditingController eCtrl = new TextEditingController();
	
	@override
	Widget build(BuildContext ctxt) {
		return new Scaffold(
			appBar: new AppBar(title: new Text("Dynamic Demo"),),
			body: new Column(
				children: <Widget>[
					new TextField(
						controller: eCtrl,
						onSubmitted: (text) {
							litems.add(text);
							eCtrl.clear();
//							setState(() {});
						},
					),
					new Expanded(
						child: new ListView.builder
							(
							itemCount: litems.length,
								itemBuilder: (BuildContext ctxt, int index) {
									return new Text(litems[index]);
							}
						)
					)
				],
			)
		);
	}
}