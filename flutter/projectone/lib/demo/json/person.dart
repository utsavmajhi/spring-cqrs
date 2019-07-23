import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
	
	final String code;
	final String name;
	final String email;
	
	factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
	
	Map<String, dynamic> toJson() => _$PersonToJson(this);
	
	Person({this.code, this.name, this.email});
	
}

main() {
	String json = '{ "name": "John Smith", "email": "john@example.com"}';
	Map map = jsonDecode(json);
	var decode = Person.fromJson(map);
	print(decode.name);
	print(decode.email);
	print(decode.code);
	
	String encode = jsonEncode(decode);
	print(encode);
}
