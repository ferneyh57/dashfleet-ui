import 'package:dashfleet_ui/ui/controllers/firebase_controller.dart';
import 'package:dashfleet_ui/ui/controllers/log_in_controller.dart';

/// Controlador firebase.
final firebaseController = FirebaseController();

/// Controlador login.
final logInController = LogInController(
  firebaseRepo: firebaseController,
);
