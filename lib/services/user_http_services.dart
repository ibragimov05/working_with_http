import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:working_with_http/models/user/user_model.dart';

class UserHttpServices {
  Future<List<User>> fetchUsers() async {
    Uri query = Uri.parse('https://api.escuelajs.co/api/v1/users');
    final response = await http.get(query);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data =
          (jsonDecode(response.body)).cast<Map<String, dynamic>>();

      List<User> users = [];
      for (int i = 0; i < data.length; i++) {
        users.add(User.fromJson(data[i]));
      }
      return users;
    } else {
      throw Exception('error: UserHttpServices().fetchUsers()');
    }
  }
}
