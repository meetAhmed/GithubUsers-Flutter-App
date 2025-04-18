import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/repositories/user_repository.dart';
import 'package:github_users/data/sources/network/network_service.dart';
import 'package:github_users/ui/pages/home/home_provider.dart';
import 'package:github_users/ui/pages/home/home_state.dart';
import 'package:http/http.dart' as http;

void main() {
  late UserRepository userRepository;
  late HomeProvider homeProvider;

  setUp(() {
    // Initialize the UserRepository and HomeProvider
    userRepository = UserRepositoryImpl(NetworkServiceImpl(http.Client()));
    homeProvider = HomeProvider(
      HomeState(isLoading: false, users: []),
      userRepository,
    );
  });

  test('searchUsers should return a list of users on success', () async {
    // Arrange
    final query = "John";

    // Act
    await homeProvider.searchUsers(query);

    // Assert
    expect(homeProvider.state.users.isNotEmpty, true);
    expect(homeProvider.state.isLoading, false);
    expect(homeProvider.state.errorMessage, "");
  });
}
