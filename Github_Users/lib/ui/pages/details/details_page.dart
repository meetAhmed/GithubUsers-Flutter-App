import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/ui/pages/details/details_provider.dart';
import 'package:github_users/ui/widgets/user_details_widget.dart';
import 'package:github_users/ui/widgets/user_repos_list.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final String username;

  const DetailsPage({super.key, required this.username});

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPage();
}

class _DetailsPage extends ConsumerState<DetailsPage> {
  @override
  void initState() {
    super.initState();

    // Fetch user details when the page is initialized
    Future.delayed(Duration.zero).then((_) {
      ref.read(detailsProvider.notifier).fetchUserDetails(widget.username);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the state from the details provider
    final detailState = ref.watch(detailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${detailState.user?.name} Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Show loading indicator when user details are loading
              if (detailState.isLoading)
                Center(child: CircularProgressIndicator()),

              // Display error message if an error occurs
              if (detailState.errorMessage.trim().isNotEmpty)
                Text(detailState.errorMessage.trim()),

              // Display user details once fetched
              if (!detailState.isLoading && detailState.user != null)
                UserDetailsWidget(user: detailState.user!),

              // Show loading indicator for repos
              if (detailState.isRepoLoading)
                Center(child: CircularProgressIndicator()),

              // Display repos if available
              if (detailState.repos.isNotEmpty)
                UserReposList(userRepos: detailState.repos),
            ],
          ),
        ),
      ),
    );
  }
}
