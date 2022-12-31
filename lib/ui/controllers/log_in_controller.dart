// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashfleet_ui/ui/controllers/firebase_controller.dart';

class LoginState {
  final bool isLoginOk;

  LoginState({
    required this.isLoginOk,
  });

  LoginState copyWith({
    bool? isLoginOk,
  }) {
    return LoginState(
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
            isLoginOk: false,
          ),
        );

  void onSwitchRememberUser(bool remember) {}

  /// Permite loguerase.
  void onLogIn({
    required String cell,
    required String pass,
  }) async {
    if (cell.isNotEmpty && pass.isNotEmpty) {
      final isOk = await firebaseRepo.signIn(phoneNumber: cell, password: pass);
      if (isOk) {
        state = state.copyWith(
          isLoginOk: true,
        );
      }
    }
  }

  /// Recuperar la contraseña mediante el numero de celular.
  void onForgotPass(String cell) {
    //TODO:
  }
  void resetData() {
    state = state.copyWith(
      isLoginOk: false,
    );
  }
}
