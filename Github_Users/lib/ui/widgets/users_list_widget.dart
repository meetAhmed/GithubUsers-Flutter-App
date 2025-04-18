import 'package:flutter/material.dart';
import 'package:github_users/data/models/user.dart';
import 'package:github_users/ui/widgets/user_widget.dart';

class UsersListWidget extends StatelessWidget {
  final List<User> users;

  const UsersListWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => UserWidget(user: users[index]),
        )
    );
  }
}
