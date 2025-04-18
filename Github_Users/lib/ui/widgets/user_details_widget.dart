import 'package:flutter/material.dart';
import 'package:github_users/data/models/user.dart';
import 'package:github_users/shared/app_dimens.dart';
import 'package:github_users/shared/app_styles.dart';

class UserDetailsWidget extends StatelessWidget {
  final User user; // The user object that contains user details to display

  const UserDetailsWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              CircleAvatar(
                radius: 50, // Avatar size
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
              SizedBox(height: 12.0), // Space between the avatar and text
              // Display the user's login name
              Text(user.login, style: AppStyles.subHeading),

              // Display the user's full name
              Text(user.name, style: AppStyles.heading),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Label for followers count
                  Text("Followers "),

                  // Display the number of followers
                  Text(user.followers.toString(), style: AppStyles.subHeading),

                  // Space between followers and following count
                  SizedBox(width: 10),

                  // Label for following count
                  Text("Following "),

                  // Display the number of people the user is following
                  Text(user.following.toString(), style: AppStyles.subHeading),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
