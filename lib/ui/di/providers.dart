import 'package:dashfleet_ui/ui/controllers/firebase_controller.dart';
import 'package:dashfleet_ui/ui/controllers/log_in_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controlador firebase.
final firebaseController = FirebaseController();

/// Controlador login.
final logInController = LogInController(
  firebaseRepo: firebaseController,
);

final logInVM = StateNotifierProvider<LoginVM, LoginState>((ref) {
  return LoginVM(
    firebaseRepo: firebaseController,
  );
});
