import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/repositories/user_repository.dart';
import 'package:github_users/data/sources/network/network_service.dart';
import 'package:http/http.dart' as http;

void main() {
  late UserRepository userRepository;

  setUp(() {
    // Initialize the UserRepository
    userRepository = UserRepositoryImpl(NetworkServiceImpl(http.Client()));
  });

  test('search should return a list of users on success', () async {
    // Arrange
    final query = "meetAhmed";

    // Act
    final users = await userRepository.search(query);

    // Assert
    expect(users.isNotEmpty, true);
  });

  test('getUserDetails should return user details on success', () async {
    // Arrange
    final username = "meetAhmed";

    // Act
    final user = await userRepository.getUserDetails(username);

    // Assert
    expect(user.login, username);
  });

  test('getUserRepos should return a list of user repositories', () async {
    // Arrange
    final url = "https://api.github.com/users/meetahmed/repos";

    // Act
    final repos = await userRepository.getUserRepos(url);

    // Assert
    expect(repos.isNotEmpty, true);
  });
}
