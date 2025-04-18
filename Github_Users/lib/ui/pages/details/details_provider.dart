import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/data/repositories/providers/user_repository_provider.dart';
import 'package:github_users/ui/pages/details/details_state.dart';

import '../../../data/models/user_repo.dart';
import '../../../data/repositories/user_repository.dart';

class DetailsProvider extends StateNotifier<DetailsState> {
  final UserRepository userRepository;

  DetailsProvider(super.state, this.userRepository);

  // Fetch user details and their repositories
  Future<void> fetchUserDetails(String username) async {
    // Set loading state
    state = state.copyWith(isLoading: true, user: null, repos: []);

    try {
      // Fetch user details
      final user = await userRepository.getUserDetails(username);
      state = state.copyWith(
        user: user,
        errorMessage: "",
        isLoading: false,
        isRepoLoading: true,
      );

      // Fetch user repositories and filter out forks
      List<UserRepo> repos = await userRepository.getUserRepos(user.reposUrl);
      state = state.copyWith(
        repos: repos.where((repo) => !repo.fork).toList(),
        isRepoLoading: false,
      );
    } catch (e) {
      // Handle errors and update state
      state = state.copyWith(
        errorMessage: 'Failed to load user details error = $e',
        isLoading: false,
      );
    }
  }
}

// Provider for managing details state
final detailsProvider = StateNotifierProvider<DetailsProvider, DetailsState>((
  ref,
) {
  final userRepository = ref.watch(userRepositoryProvider);
  final state = DetailsState(isLoading: false, user: null);
  return DetailsProvider(state, userRepository);
});
