// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dashfleet_ui/data/entities.dart';
import 'package:dashfleet_ui/data/user_repository.dart';

class FirebaseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserRepository userRepository;
  FirebaseRepository({
    required this.userRepository,
  });

// Sign in a user with their phone number and password
  Future<bool> signIn(
      {required String phoneNumber, required String password}) async {
    // Get the user document with the matching phone number
    QuerySnapshot snapshot = await _firestore
        .collection('Users')
        .where('cellphone', isEqualTo: phoneNumber)
        .get();
    if (snapshot.docs.isEmpty) {
      // No matching documents found
      return false;
    }
    DocumentSnapshot user = snapshot.docs[0];
    // Check the password
    if (user['password'] == password) {
      /// Usuario obtenido de firestore.
      final userToSave = User(
          cellphone: user['cellphone'],
          password: user['password'],
          name: user['name']);

      /// Se guarda en el repo.
      userRepository.setUser(userToSave);
      return true;
    } else {
      // Incorrect password
      return false;
    }
  }
}
