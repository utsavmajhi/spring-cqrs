import 'dart:async';

main() {
//	Timer(Duration(seconds: 3), () {
//		print("Yeah, this line is printed after 3 seconds");
//	});
//
//	// async
//	print('This line is printed first');
	
	Timer.periodic(Duration(seconds: 2), (timer) {
		print(DateTime.now());
	});

//		final _debouncer = Debouncer(milliseconds: 1000);
//		for (int i = 0; i < 100; i++) {
//			_debouncer.run(()=> print(DateTime.now()));
//		}

}