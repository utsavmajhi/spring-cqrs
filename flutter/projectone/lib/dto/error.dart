import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class Error {
	
	// response
	String timestamp;
	String exception;
	String message;
	
	Error({this.timestamp, this.exception, this.message});
	
	factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
	
	Map<String, dynamic> toJson() => _$ErrorToJson(this);
	
}