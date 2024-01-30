import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Método para realizar autenticação anônima.
  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      // Trate possíveis erros, por exemplo, log e retorno nulo.
      print('Error during anonymous sign-in: $e');
      return null;
    }
  }

  /// Método para realizar autenticação com e-mail e senha.
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      // Trate possíveis erros, por exemplo, log e retorno nulo.
      print('Error during email/password sign-in: $e');
      return null;
    }
  }

  /// Método para criar uma nova conta com e-mail e senha.
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      // Trate possíveis erros, por exemplo, log e retorno nulo.
      print('Error during email/password sign-up: $e');
      return null;
    }
  }

  /// Método para realizar logout.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // Trate possíveis erros, por exemplo, log.
      print('Error during sign-out: $e');
    }
  }

  /// Método para obter o usuário atual.
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  /// Adicione outros métodos conforme necessário para diferentes cenários de autenticação.
}
