import 'dart:convert';
import 'package:phone/Models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final url = Uri.parse("http://suarenext.com/api/customers");

  Future<User> fetchUser() async {
    final response = await http.get(url);
    final body = jsonDecode(response.body)[0];

    return User.fromJson(body);
  }

  Future<List<dynamic>> fetchAllUsers() async {
    final response = await http.get(url);
    return jsonDecode(response.body);
  }
}
