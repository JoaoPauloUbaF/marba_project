import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_marba/src/features/authentication/data/authentication_repository.dart';
import 'package:riverpod/riverpod.dart';

class FirebaseAuthProvider implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Método para realizar autenticação anônima.
  @override
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

  /// Método para criar uma nova conta com e-mail e senha.
  @override
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
  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // Trate possíveis erros, por exemplo, log.
      print('Error during sign-out: $e');
    }
  }

  /// Método para obter o usuário atual.
  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Stream<User?> authStateChanged() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<bool> checkUserRegistration(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return snapshot.exists;
    } catch (e) {
      print('Error checking user registration: $e');
      return false;
    }
  }
}

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => FirebaseAuthProvider(),
);

final authStateChangeProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryProvider).authStateChanged(),
);
