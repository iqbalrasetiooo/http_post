import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_get_post/models/user_model.dart';

class ApiService {
  String baseUrl = 'https://63997d6416b0fdad773e5bfb.mockapi.io';
  String users = 'https://63997d6416b0fdad773e5bfb.mockapi.io/users';

  Future getUser() async {
    var apiUrl = Uri.parse(users);
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      final data = json.map((e) => UserModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception();
    }
  }

  Future postData({
    required String url,
    required Object body,
  }) async {
    var apiUrl = Uri.parse(baseUrl + url);
    final response = await http.post(apiUrl, body: body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception(response.body);
    }
  }

  Future registerUser({
    required String name,
    required String age,
  }) async {
    var body = jsonEncode({
      "name": name,
      "age": age,
    });
    return await postData(url: '/users', body: body);
  }
}
