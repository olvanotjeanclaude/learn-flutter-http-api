import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:phone/Models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final url = Uri.parse("http://suarenext.com/api/customers");

  Future<List<User>> fetchUsers() async {
    final response = await http.get(url);
    final body = jsonDecode(response.body) as List;

    if (response.statusCode != 200) {
      throw Exception("Unable to load user data");
    }
    return body.map((user) => User.fromJson(user)).toList();
  }

  Future<List<dynamic>> fetchAllUsers() async {
    try {
      final response = await http.get(url);

      return jsonDecode(response.body);
    } catch (e) {
      debugPrint(e.toString());
    }

    return [];
  }
}
