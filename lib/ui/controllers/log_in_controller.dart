// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashfleet_ui/data/entities.dart';
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

class LoginState {
  final User user;
  final bool isLoginOk;
  LoginState({
    required this.user,
    this.isLoginOk = false,
  });

  LoginState copyWith({
    User? user,
    bool? isLoginOk,
  }) {
    return LoginState(
      user: user ?? this.user,
      isLoginOk: isLoginOk ?? this.isLoginOk,
    );
  }
}

class LoginVM extends StateNotifier<LoginState> {
  final FirebaseController firebaseRepo;

  LoginVM({
    required this.firebaseRepo,
  }) : super(
          LoginState(
            user: User(
              cellphone: '',
              password: '',
              name: '',
            ),
          ),
        );

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

  void setCellphone(String cellphone) {
    if (cellphone.isNotEmpty) {
      state = state.copyWith(user: state.user.copyWith(cellphone: cellphone));
    }
  }

  void setPass(String pass) {
    if (pass.isNotEmpty) {
      state = state.copyWith(user: state.user.copyWith(password: pass));
    }
  }

  /// Permite loguerase.
  void onLogIn() async {
    /*
    final isOk = await firebaseRepo.signIn(
        phoneNumber: state.user.cellphone, password: state.user.password);
    if (isOk) {
      state = state.copyWith(
        isLoginOk: true,
      );
    }*/
  }

  /// Recuperar la contraseña mediante el numero de celular.
  void onForgotPass(String cell) {
    //TODO:
  }
}
