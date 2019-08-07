// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(
    timestamp: json['timestamp'] as String,
    exception: json['exception'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'exception': instance.exception,
      'message': instance.message,
    };
