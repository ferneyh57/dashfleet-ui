import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  bool isAuthUser = false;

  void onAuth() {
    isAuthUser = true;
  }
}
