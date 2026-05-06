import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpWithEmail({
    // required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception("The email address is already in use.");
      } else if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak.");
      } else {
        throw Exception(e.message);
      }
    }
    // await credential.user?.updateDisplayName(name);
  }

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try{
 await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    if (FirebaseAuth.instance.currentUser == null) {
      await _auth.signOut();
      throw Exception("Please sign up before logging in.");
    }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw Exception("Wrong password provided for that user.");
      } else {
        throw Exception(e.message);
      }
    }
   
  }

  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
