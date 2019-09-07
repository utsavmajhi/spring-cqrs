// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

user _$userFromJson(Map<String, dynamic> json) {
  return user(
    userid: json['userid'] as num,
    id: json['id'] as num,
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$userToJson(user instance) => <String, dynamic>{
      'userid': instance.userid,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
