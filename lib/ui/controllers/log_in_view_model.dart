// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashfleet_ui/data/firebase_repository.dart';

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
  final FirebaseRepository firebaseRepo;

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
}
