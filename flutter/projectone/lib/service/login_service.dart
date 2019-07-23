import 'dart:convert' deferred as convert;

import 'package:http/http.dart' deferred as http;

class Post {
	final int userId;
	final int id;
	final String title;
	final String body;
	
	Post({this.userId, this.id, this.title, this.body});
	
	factory Post.fromJson(Map<String, dynamic> json) =>
		Post(
			userId: json['userId'],
			id: json['id'],
			title: json['title'],
			body: json['body'],
		);
	
	Map<String, dynamic> toJson() =>
		{
			'userId': userId,
			'id': id,
			'title': title,
			'body': body
		};
	
}

Future<Post> post() async {
	final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
	if (response.statusCode == 200) {
		return Post.fromJson(convert.jsonDecode(response.body));
	} else {
		throw Exception('Failed to load post');
	}
}

Future<List> posts() async {
	final response = await http.get('https://jsonplaceholder.typicode.com/posts');
	if (response.statusCode == 200) {
		return convert
			.jsonDecode(response.body)
			.map((model) => Post.fromJson(model))
			.toList();
	} else {
		throw Exception('Failed to load post');
	}
}

main() async {
	var p = await post();
	print(p);
	String encode = convert.jsonEncode(p);
	print(encode);
	
	var list = await posts();
	print(list.length);
}
