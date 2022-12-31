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

/// repositorio de usuario.
final userProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

/// repositorio de firebase.
final firebaseRepository = Provider.autoDispose<FirebaseRepository>((ref) {
  return FirebaseRepository(
    userRepository: ref.read(userProvider),
  );
});
