import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
	final int milliseconds;
	Timer _timer;
	
	Debouncer({this.milliseconds});
	
	run(VoidCallback _callback) {
		if (_timer?.isActive ?? false) _timer.cancel();
		_timer = Timer(Duration(milliseconds: milliseconds), _callback);
	}
}


