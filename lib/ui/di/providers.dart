import 'package:dashfleet_ui/data/auth_repository.dart';
import 'package:dashfleet_ui/data/entities.dart';
import 'package:dashfleet_ui/data/firebase_repository.dart';
import 'package:dashfleet_ui/ui/controllers/log_in_view_model.dart';
import 'package:dashfleet_ui/data/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// vm login.
final logInVM = StateNotifierProvider.autoDispose<LoginVM, LoginState>((ref) {
  return LoginVM(
    firebaseRepo: ref.read(firebaseRepository),
  );
});

final userProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});
final firebaseRepository = Provider<FirebaseRepository>((ref) {
  return FirebaseRepository(
    userRepository: ref.read(userProvider),
  );
});

final authProvider =
    StateNotifierProvider.autoDispose<AuthRepository, bool>((ref) {
  return AuthRepository();
});
