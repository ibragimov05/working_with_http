import 'package:flutter/material.dart';
import 'package:working_with_http/controllers/user_controller.dart';
import 'package:working_with_http/models/user/user_model.dart';
import 'package:working_with_http/views/widgets/custom_grid_view_builder.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: FutureBuilder(
        future: _userController.getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.data == null) {
            return const Center(
              child: Text('error: snapshot'),
            );
          } else {
            final List<User> users = snapshot.data;
            return CustomGridViewBuilder(
              objectList: users,
              isSelected: true,
            );
          }
        },
      ),
    );
  }
}
