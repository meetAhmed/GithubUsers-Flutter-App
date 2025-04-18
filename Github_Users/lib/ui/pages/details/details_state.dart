import '../../../data/models/user.dart';
import '../../../data/models/user_repo.dart';

class DetailsState {
  // Indicates if user details are loading
  final bool isLoading;

  // The user details object
  final User? user;

  // Error message if the operation fails
  final String errorMessage;

  // Indicates if repositories are loading
  final bool isRepoLoading;

  // List of user repositories
  final List<UserRepo> repos;

  DetailsState({
    required this.isLoading,
    required this.user,
    this.errorMessage = '',
    this.isRepoLoading = false,
    this.repos = const [],
  });

  // Creates a new DetailsState with updated values
  DetailsState copyWith({
    bool? isLoading,
    User? user,
    String? errorMessage,
    bool? isRepoLoading,
    List<UserRepo>? repos,
  }) {
    return DetailsState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      isRepoLoading: isRepoLoading ?? this.isRepoLoading,
      repos: repos ?? this.repos,
    );
  }
}
