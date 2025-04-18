import 'package:flutter/material.dart';
import 'package:github_users/shared/app_dimens.dart';

class SearchWidget extends StatelessWidget {
  // Controller for managing the input text
  final TextEditingController searchController;

  // Boolean to determine if the app is in dark mode
  final bool isDarkMode;

  // Callback when text changes
  final ValueChanged<String> onChanged;

  const SearchWidget({
    super.key,
    required this.searchController,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      // Sets the text controller for the input field
      onChanged: onChanged,
      // Calls the onChanged callback whenever the text changes
      decoration: InputDecoration(
        filled: true,
        fillColor: isDarkMode ? Colors.grey[850] : Colors.grey[200],
        // Background color based on dark mode
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          borderSide: BorderSide.none,
        ),
        hintText: "Enter github username...",
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.white70 : Colors.black45,
        ),
        suffixIcon: searchController.text.trim().isEmpty ? null : clearButton(),
      ),
    );
  }

  // Clear button to reset the search field
  Widget clearButton() {
    return IconButton(
      icon: Icon(Icons.clear), // Icon for the clear button
      onPressed: () {
        searchController.clear(); // Clears the text field
        onChanged(""); // Calls the onChanged callback with an empty string
      },
    );
  }
}
