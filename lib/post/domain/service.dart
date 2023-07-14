
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:httplink/post/model/model.dart';

class PostService {
  Future<Posting> posting(
      {required String name,
      required String country,
      required String slogan,
      required String headquarters,
      required String establishment, }) async {
    final result = await http.post(
        Uri.parse("https://api.instantwebtools.net/v1/airlines"),
        headers: <String, String>{'content -Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'name': name,
          'country': country,
          'slogan': slogan,
          'head_quarters': headquarters,
          'establishment': establishment
        }));
    if (result.statusCode == 200) {
      final value = Posting.fromJson(jsonDecode(result.body));
      // ignore: avoid_print
      print(value);
      return value;
    } else {
      throw Exception("failed to login");
    }
  }
}
