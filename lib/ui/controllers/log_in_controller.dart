import 'package:dashfleet_ui/ui/controllers/firebase_controller.dart';

class LogInController {
  final FirebaseController firebaseRepo;

  LogInController({
    required this.firebaseRepo,
  });

  /// guarda los datos de el usuario en shared prefrences.
  void onRememberUser({
    required String cell,
    required String password,
  }) {
    //TODO:
  }

  /// elimina los datos de el usuario de shared preferences.
  void onUnsetUser() {
    //TODO:
  }

  /// Permite loguerase.
  bool onLogIn({
    required String cell,
    required String password,
  }) {
    return true;
  }

  /// Recuperar la contraseña mediante el numero de celular.
  void onForgotPass(String cell) {
    //TODO:
  }
}
