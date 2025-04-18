import 'package:github_users/shared/app_constants.dart';
import 'package:http/http.dart' as http;

// Abstract class defining the network contract
abstract class NetworkService {
  // Fetches response from a given URL
  Future<String> fetchData(String url);
}

// Implementation of NetworkService using http.Client
class NetworkServiceImpl implements NetworkService {
  final http.Client client;

  NetworkServiceImpl(this.client);

  final String token = AppConstants.githubToken;

  // Fetches response from a given URL
  @override
  Future<String> fetchData(String url) async {
    final headers = <String, String>{};

    // Add Authorization header if token is available
    if (token.trim().isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    final response = await http.get(Uri.parse(url), headers: headers);

    // Return response body if successful, else throw an exception
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed: Error = ${response.body}');
    }
  }
}
