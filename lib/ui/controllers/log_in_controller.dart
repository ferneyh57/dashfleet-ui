class LogInController {
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
  void onLogIn({
    required String cell,
    required String password,
  }) {}

  /// Recuperar la contraseña mediante el numero de celular.
  void onForgotPass(String cell) {
    //TODO:
  }
}