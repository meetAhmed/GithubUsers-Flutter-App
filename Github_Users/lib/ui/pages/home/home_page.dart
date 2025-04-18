import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/ui/pages/home/home_provider.dart';
import 'package:github_users/ui/widgets/search_widget.dart';
import 'package:github_users/ui/widgets/users_list_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // Controller for search input
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose(); // Dispose controller when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch state from home provider
    final homeState = ref.watch(homeProvider);

    // Check if dark mode is enabled
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Github app", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Search bar widget for user query input
            SearchWidget(
              searchController: searchController,
              isDarkMode: isDarkMode,
              onChanged: (query) {
                // Trigger user search on query change
                ref.read(homeProvider.notifier).searchUsers(query);
              },
            ),

            SizedBox(height: 15),

            // Show loading indicator while fetching users
            if (homeState.isLoading) Center(child: CircularProgressIndicator()),

            // Display error message if any
            if (homeState.errorMessage.trim().isNotEmpty)
              Text(homeState.errorMessage.trim()),

            // Show list of users if data is loaded and not empty
            if (!homeState.isLoading && homeState.users.isNotEmpty)
              UsersListWidget(users: homeState.users),
          ],
        ),
      ),
    );
  }
}
