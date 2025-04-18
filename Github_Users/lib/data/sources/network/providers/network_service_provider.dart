import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network_service.dart';
import 'http_provider.dart';

// Provides an instance of NetworkService using the shared http client
final networkServiceProvider = Provider<NetworkService>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  return NetworkServiceImpl(httpClient);
});
