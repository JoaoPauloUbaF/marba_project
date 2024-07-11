import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
  Stream<User?> authStateChanged();
  Stream<User?> userStateChanged();
  Future<bool> checkUserRegistration(String uid);

  Future<String> changePassword(
      {required String currentPassword, required String newPassword});

  Future<void> changeEmail({required String newEmail});

  //Future<void> updatePhoneNumber(String value);
}
