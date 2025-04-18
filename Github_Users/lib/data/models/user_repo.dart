// Model class representing a GitHub repository
class UserRepo {
  final String name; // Repository name
  final String url; // API URL of the repository
  final String language; // Main programming language
  final String description; // Repository description
  final bool fork; // Whether the repo is a fork
  final int stars; // stars count

  UserRepo({
    required this.name,
    required this.url,
    required this.language,
    required this.description,
    required this.fork,
    required this.stars,
  });

  // Factory constructor to create a UserRepo from JSON
  factory UserRepo.fromJson(Map<String, dynamic> json) {
    return UserRepo(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      language: json['language'] ?? '',
      description: json['description'] ?? '',
      fork: json['fork'] ?? false,
      stars: json['stargazers_count'] ?? 0,
    );
  }
}
