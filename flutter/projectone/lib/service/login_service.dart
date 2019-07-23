import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' deferred as http;
import 'package:projectone/dto/login.dart';

Future login(final username, final password) async {
	final url = 'http://localhost:8080/authenticate';
	final headers = {
		HttpHeaders.contentTypeHeader: 'application/json',
		HttpHeaders.acceptHeader: 'application/json',
	};
	final request = jsonEncode({'username': username, 'password': password});
	final response = await http.post(url, headers: headers, body: request);
	if (response.statusCode == 200) {
		return Login.fromJson(jsonDecode(response.body));
	} else {
		throw Exception(jsonDecode(response.body));
	}
}

Future find(String id) async {
	final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
	return (response.statusCode == 200)
		? Login.fromJson(jsonDecode(response.body)) : throw Exception("Failed to find");
}

main() async {
	Login response = await login('admin', 'password');
	print(response?.token);
	print(response?.refreshToken);
}