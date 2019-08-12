import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' deferred as http;
import 'package:projectone/screen/login/model/login.dart';

Future login(final username, final password) async {
  final url = 'http://localhost:8080/authenticate';
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer xxx-xx-x"
  };
  final request = jsonEncode({'username': username, 'password': password});
  final response = await http.post(url, headers: headers, body: request);
  if (response.statusCode == 200) {
    return Login.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(jsonDecode(response.body));
  }
}

main() async {
//	Login response = await login('admin', 'password');
//	print(response?.token);
//	print(response?.refreshToken);

  login('admin', 'password').then((res) => print(res?.token)).catchError((e) {
    print(e.error);
  });
}
