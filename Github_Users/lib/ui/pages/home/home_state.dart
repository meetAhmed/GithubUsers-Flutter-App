import '../../../data/models/user.dart';

class HomeState {
  // Indicates if data is being loaded
  final bool isLoading;

  // List of users to display
  final List<User> users;

  // Error message, if any
  final String errorMessage;

  HomeState({
    required this.isLoading,
    required this.users,
    this.errorMessage = '', // Default to empty string if no error
  });

  // Creates a new HomeState with updated values, preserving existing ones where not provided
  HomeState copyWith({
    bool? isLoading, // Optional update for loading state
    List<User>? users, // Optional update for user list
    String? errorMessage, // Optional update for error message
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
