import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Provides a shared instance of http.Client for making network requests
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});
