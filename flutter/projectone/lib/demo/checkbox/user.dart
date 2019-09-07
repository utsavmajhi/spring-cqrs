import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class user {
  num userid;
  num id;
  String title;
  String body;

  user({this.userid, this.id, this.title, this.body});

  factory user.fromJson(Map<String, dynamic> json) => _$userFromJson(json);

  Map<String, dynamic> toJson() => _$userToJson(this);
}


main() {
  String json = "{ \"title\": \"John Smith\", \"body\": \"john@example.com\"}";

  var john = user.fromJson(jsonDecode(json));
  print(john.title);
  print(john.body);

  print(jsonEncode(json));


//  Map map = jsonDecode(json);
//  var decode = user.fromJson(jsonDecode(json));
//  print(decode.title);
//  print(decode.body);
//
//  decode.toJson()
//
//  String encode = jsonEncode(decode);
//  print(encode);
}


