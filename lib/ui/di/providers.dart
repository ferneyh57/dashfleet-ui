import 'package:dashfleet_ui/ui/controllers/firebase_controller.dart';
import 'package:dashfleet_ui/ui/controllers/log_in_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controlador firebase.
final firebaseController = FirebaseController();

final logInVM = StateNotifierProvider.autoDispose<LoginVM, LoginState>((ref) {
  return LoginVM(
    firebaseRepo: firebaseController,
  );
});
