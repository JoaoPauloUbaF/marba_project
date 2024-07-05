import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_marba/src/features/authentication/data/authentication_repository.dart';
import 'package:riverpod/riverpod.dart';

class FirebaseAuthProvider implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
      log('Error during email/password sign-up: $e');
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
      log('Error during sign-out: $e');
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
      log('Error checking user registration: $e');
      return false;
    }
  }

  @override
  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      return 'Usuário não autenticado';
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);
      return 'Senha atualizada com sucesso';
    } catch (error) {
      log('Error changing password: $error');
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'wrong-password':
            return 'Senha atual incorreta';
          case 'weak-password':
            return 'A nova senha é muito fraca';
          case 'requires-recent-login':
            return 'Reautenticação necessária. Faça login novamente e tente novamente.';
          default:
            return 'Erro ao atualizar senha: ${error.message}';
        }
      } else {
        return 'Erro desconhecido: $error';
      }
    }
  }

  // @override
  // Future<void> updatePhoneNumber(String value) {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     return Future.error('Usuário não autenticado');
  //   }
  // }
}

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => FirebaseAuthProvider(),
);

final authStateChangeProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryProvider).authStateChanged(),
);
