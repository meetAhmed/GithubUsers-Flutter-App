import 'package:flutter/material.dart';
import 'package:github_users/data/models/user_repo.dart';
import 'package:github_users/shared/app_dimens.dart';
import 'package:github_users/shared/app_styles.dart';

class UserRepoWidget extends StatelessWidget {
  final UserRepo userRepo; // The repository details to display

  const UserRepoWidget({super.key, required this.userRepo});

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        _showAlertDialog(context); // Show dialog when the card is tapped
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display repo name
                        Text(userRepo.name, style: AppStyles.heading),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),

                  // Display number of stars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        userRepo.stars.toString(),
                        style: AppStyles.subHeading,
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.star, size: AppDimens.iconSize),
                    ],
                  ),
                ],
              ),

              // Display programming language
              Text(userRepo.language, style: AppStyles.normal),

              // Display repo description
              if (userRepo.description.trim().isNotEmpty)
                Text(userRepo.description, style: AppStyles.normal),
            ],
          ),
        ),
      ),
    );
  }

  // Show an alert dialog with the repository URL
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Repo URL"),
          content: Text(userRepo.url), // Show the URL of the repository
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
