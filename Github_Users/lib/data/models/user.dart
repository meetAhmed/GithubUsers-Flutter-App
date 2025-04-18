// Model class representing a GitHub user
class User {
  final String login; // Username/login
  final String avatarUrl; // Profile image URL
  final String reposUrl; // URL to user's repositories
  final String name; // Full name
  final int followers; // Number of followers
  final int following; // Number of following

  User({
    required this.login,
    required this.avatarUrl,
    required this.reposUrl,
    required this.name,
    required this.followers,
    required this.following,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      reposUrl: json['repos_url'] ?? '',
      name: json['name'] ?? '',
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
    );
  }
}