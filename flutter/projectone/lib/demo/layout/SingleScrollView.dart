// Flutter code sample for widgets.SingleChildScrollView.2

// In this example, the column becomes either as big as viewport, or as big as
// the contents, whichever is biggest.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return WidgetsApp(
			title: 'Flutter Code Sample',
			builder: (BuildContext context, Widget navigator) {
				return MyStatelessWidget();
			},
			color: const Color(0xffffffff),
		);
	}
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
	MyStatelessWidget({Key key}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return LayoutBuilder(
			builder: (BuildContext context, BoxConstraints viewportConstraints) {
				return SingleChildScrollView(
					child: ConstrainedBox(
						constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight,
						),
						child: IntrinsicHeight(
							child: Column(
								children: <Widget>[
									Expanded(
										child: Container(
											// A fixed-height child.
											color: Colors.blue
										),
									),
									Expanded(
										// A flexible child that will grow to fit the viewport but
										// still be at least as big as necessary to fit its contents.
										child: Container(
											color: Colors.grey
										),
									),
								],
							),
						),
					),
				);
			},
		);
	}
}