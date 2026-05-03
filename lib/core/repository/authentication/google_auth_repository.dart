// core/lib/auth/repositories/google_auth_repository.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hyperion_core/core/repository/authentication/user_model.dart';
import 'package:hyperion_core/core/services/app_snackbar_service.dart';

class GoogleAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  GoogleAuthRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  GoogleUser? get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    
    return GoogleUser(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL,
    );
  }
  Future<GoogleUser?> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize();
            final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth = 
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = 
          await _firebaseAuth.signInWithCredential(credential);
      
      final user = userCredential.user;
      if (user == null) return null;
            AppSnackbarService.showSnackbar("Successfully logged in");

      return GoogleUser(
        id: user.uid,
        email: user.email ?? '',
        displayName: user.displayName ?? '',
        photoUrl: user.photoURL,
      );
    } catch (e) {
      print('Google Sign-In Error: $e');
      AppSnackbarService.showSnackbar(e.toString());
      return null;
    }
  }
  Future<void> signOut() async {
    await _googleSignIn.disconnect(); 
    await _firebaseAuth.signOut();
  }
}