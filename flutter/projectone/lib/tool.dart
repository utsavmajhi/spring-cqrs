import 'package:flutter/cupertino.dart';

// wrap component with GestureDetector
// GestureDetector(onTap:(){dismissKeyboard(context)})
dismissKeyboard(BuildContext context) {
	FocusScope.of(context).requestFocus(new FocusNode());
}



