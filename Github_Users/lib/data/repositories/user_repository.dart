import 'dart:convert';

import 'package:github_users/data/sources/network/network_service.dart';
import 'package:github_users/shared/app_constants.dart';

import '../models/user.dart';
import '../models/user_repo.dart';

// Abstract repository defining user-related API methods
abstract class UserRepository {
  // Search users by query
  Future<List<User>> search(String query);

  // Get details of a specific user
  Future<User> getUserDetails(String username);

  // Get repos of a user via URL
  Future<List<UserRepo>> getUserRepos(String url);
}

// Implementation of UserRepository using a NetworkService
class UserRepositoryImpl implements UserRepository {
  final NetworkService source;

  UserRepositoryImpl(this.source);

  // Search users by query
  @override
  Future<List<User>> search(String query) async {
    final url = '${AppConstants.baseUrl}/search/users?q=$query';

    // Fetch raw JSON string from API
    final response = await source.fetchData(url);

    // Decode JSON string to Map
    final Map<String, dynamic> rawData = json.decode(response);

    // Extract list of users from 'items' key
    final List<dynamic> usersJson = rawData['items'];

    // Map JSON list to User model list
    return usersJson.map((item) => User.fromJson(item)).toList();
  }

  // Get details of a specific user
  @override
  Future<User> getUserDetails(String username) async {
    final url = '${AppConstants.baseUrl}/users/$username';

    // Fetch raw JSON string from API
    final response = await source.fetchData(url);

    // Decode JSON string to Map
    final Map<String, dynamic> rawData = json.decode(response);

    // Map JSON to User model
    return User.fromJson(rawData);
  }

  @override
  Future<List<UserRepo>> getUserRepos(String url) async {
    final response = await source.fetchData(url);

    // Fetch raw JSON string from API
    final List<dynamic> rawData = json.decode(response);

    // Map JSON list to UserRepo model list
    return rawData.map((repoJson) => UserRepo.fromJson(repoJson)).toList();
  }
}
