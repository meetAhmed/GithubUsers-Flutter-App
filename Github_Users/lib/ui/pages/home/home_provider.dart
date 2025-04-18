import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_users/data/repositories/providers/user_repository_provider.dart';
import 'package:github_users/ui/pages/home/home_state.dart';

import '../../../data/repositories/user_repository.dart';

class HomeProvider extends StateNotifier<HomeState> {
  final UserRepository userRepository;

  HomeProvider(super.state, this.userRepository);

  // Search users based on the query
  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      // Clear users if the query is empty
      state = state.copyWith(users: []);
      return;
    }

    // Show loading state
    state = state.copyWith(isLoading: true);

    try {
      // Fetch users from the repository
      final users = await userRepository.search(query);
      state = state.copyWith(users: users, errorMessage: "", isLoading: false);
    } catch (e) {
      // Update state with error message if an exception occurs
      state = state.copyWith(
        errorMessage: 'Failed to load users $e',
        isLoading: false,
      );
    }
  }
}

// Provider to manage the state of the home page
final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  // Initial state with no users and loading false
  final state = HomeState(isLoading: false, users: []);
  return HomeProvider(state, userRepository);
});
