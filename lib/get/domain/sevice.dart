import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<User>> getdata() async {
    final value = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
    if (value.statusCode == 200) {
      final List<dynamic> newUser = jsonDecode(value.body);
      final userInfo = newUser.map(
        (e) {
          return User(
              id: e["id"],
              name: e["name"],
              email: e["email"],
              body: e["body"],
              postId: e["postId"]);
        },
      ).toList();
      return userInfo;
    } else {
      throw Exception("error");
    }
  }
}
