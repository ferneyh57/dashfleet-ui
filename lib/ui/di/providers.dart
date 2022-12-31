import 'package:dashfleet_ui/ui/controllers/firebase_controller.dart';
import 'package:dashfleet_ui/ui/controllers/log_in_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controlador firebase.
final firebaseController = FirebaseRepository();

final logInVM = StateNotifierProvider.autoDispose<LoginVM, LoginState>((ref) {
  return LoginVM(
    firebaseRepo: firebaseController,
  );
});
