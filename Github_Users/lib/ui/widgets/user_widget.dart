import 'package:flutter/material.dart';
import 'package:github_users/data/models/user.dart';
import 'package:github_users/shared/app_dimens.dart';
import 'package:github_users/shared/app_styles.dart';
import 'package:github_users/ui/pages/details/details_page.dart';

class UserWidget extends StatelessWidget {
  final User user; // User object to display

  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Navigate to the DetailsPage when the user widget is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(username: user.login),
          ),
        );
      },
      child: Card(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        elevation: 2.0,
        margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // Align items to the start
            children: [
              // Display user's image
              CircleAvatar(
                radius: 25, // Avatar size
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
              // Space between avatar and text
              SizedBox(width: 12.0),

              // Display user's login name
              Expanded(child: Text(user.login, style: AppStyles.heading)),
              Icon(Icons.arrow_forward_ios, size: AppDimens.iconSize),
            ],
          ),
        ),
      ),
    );
  }
}
