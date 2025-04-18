import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../sources/network/providers/network_service_provider.dart';
import '../user_repository.dart';

// Provides an instance of UserRepository using the network service
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  return UserRepositoryImpl(networkService);
});
