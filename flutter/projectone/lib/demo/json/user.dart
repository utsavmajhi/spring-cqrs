import 'dart:convert';

class User {
	final String name;
	final String email;
	
	User(this.name, this.email);
	
	User.fromJson(Map<String, dynamic> json)
		: name = json['name'],
			email = json['email'];
	
	Map<String, dynamic> toJson() =>
		{
			'name': name,
			'email': email,
		};
}

main() {
	String jsonString = '{ "name": "John Smith", "email": "john@example.com"}';
	Map userMap = jsonDecode(jsonString);
	print(userMap);
	var user = User.fromJson(userMap);
	print(user);
	String encode = jsonEncode(user);
	print(encode);
	
	print('Howdy, ${user.name}!');
	print('We sent the verification link to ${user.email}.');
}