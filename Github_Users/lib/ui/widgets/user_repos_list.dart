import 'package:flutter/material.dart';
import 'package:github_users/data/models/user_repo.dart';
import 'package:github_users/ui/widgets/user_repo.dart';

class UserReposList extends StatelessWidget {
  final List<UserRepo> userRepos;

  const UserReposList({super.key, required this.userRepos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: userRepos.length,
      itemBuilder: (context, index) {
        return UserRepoWidget(userRepo: userRepos[index]);
      },
    );
  }
}
