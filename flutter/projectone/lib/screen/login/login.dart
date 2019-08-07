import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
	// request
	String username;
	String password;
	
	// response
	String token;
	@JsonKey(name: 'refresh-token')
	String refreshToken;
	
	Login({this.username, this.password, this.token, this.refreshToken});
	
	factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
	
	Map<String, dynamic> toJson() => _$LoginToJson(this);
	
}

//main() {
//	String json = '{"token":"admin","refresh-token":"1234"}';
//	Map map = jsonDecode(json);
//	var decode = Login.fromJson(map);
//	print(decode.username);
//	print(decode.password);
//	print(decode.token);
//	print(decode.refreshToken);
//
//	String encode = jsonEncode(decode);
//	print(encode);
//}
