import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> signInAnonymously();
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
  Stream<User?> authStateChanged();
  Future<bool> checkUserRegistration(String uid);

  // Adicione outros métodos conforme necessário para diferentes cenários de autenticação.
}
