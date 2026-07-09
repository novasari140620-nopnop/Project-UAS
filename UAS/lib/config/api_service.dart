import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static Future<List<User>> fetchUsers({int page = 1}) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
      headers: {
        'x-api-key': 'reqres-free-v1',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List users = data['data'];
      return users.map((u) => User.fromJson(u)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
