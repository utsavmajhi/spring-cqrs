// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    username: json['username'] as String,
    password: json['password'] as String,
    token: json['token'] as String,
    refreshToken: json['refresh-token'] as String,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'token': instance.token,
      'refresh-token': instance.refreshToken,
    };
