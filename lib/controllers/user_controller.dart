import 'package:working_with_http/models/user/user_model.dart';
import 'package:working_with_http/services/user_http_services.dart';

class UserController{
  final UserHttpServices _userHttpServices = UserHttpServices();

  Future<List<User>> getUsers() async {
    final List<User> users = await _userHttpServices.fetchUsers();
    return users;
  }
}