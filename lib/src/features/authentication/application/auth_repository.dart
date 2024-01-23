import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_marba/src/features/authentication/data/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> signInWithEmailAndPassword();
}
