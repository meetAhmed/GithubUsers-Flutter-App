import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/repositories/user_repository.dart';
import 'package:github_users/data/sources/network/network_service.dart';
import 'package:github_users/ui/pages/details/details_provider.dart';
import 'package:github_users/ui/pages/details/details_state.dart';
import 'package:http/http.dart' as http;

void main() {
  late UserRepository userRepository;
  late DetailsProvider detailsProvider;

  setUp(() {
    // Initialize the UserRepository and DetailsProvider
    userRepository = UserRepositoryImpl(NetworkServiceImpl(http.Client()));
    detailsProvider = DetailsProvider(
      DetailsState(isLoading: false, user: null),
      userRepository,
    );
  });

  test('fetchUserDetails should return user details on success', () async {
    // Arrange
    final username = "meetAhmed";

    // Act
    await detailsProvider.fetchUserDetails(username);

    // Assert
    expect(detailsProvider.state.user?.login, username);
    expect(detailsProvider.state.isLoading, false);
    expect(detailsProvider.state.errorMessage, "");
  });

  test('fetchUserDetails should set error message on failure', () async {
    // Arrange
    final username = "";

    // Act
    await detailsProvider.fetchUserDetails(username);

    // Assert
    expect(detailsProvider.state.user, null);
    expect(detailsProvider.state.isLoading, false);
    expect(detailsProvider.state.isRepoLoading, false);
    expect(detailsProvider.state.errorMessage.isNotEmpty, true);
  });
}
