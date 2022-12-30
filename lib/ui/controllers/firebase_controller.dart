import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController {
  /*
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Sign in a user with their phone number and password
  Future<bool> signIn(
      {required String phoneNumber, required String password}) async {
    // Get the user document with the matching phone number
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    if (snapshot.docs.isEmpty) {
      // No matching documents found
      return false;
    }
    DocumentSnapshot user = snapshot.docs[0];
    // Check the password
    if (user['password'] == password) {
      // Sign in successful
      return true;
    } else {
      // Incorrect password
      return false;
    }
  }*/
}
