import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_marba/src/shared/models/user/user.dart';

class AppUser {
  UserModel? _userModel;
  User? _firebaseUser;

  AppUser({UserModel? userModel, User? firebaseUser})
      : _userModel = userModel,
        _firebaseUser = firebaseUser;

  UserModel? get userModel => _userModel;
  User? get firebaseUser => _firebaseUser;

  set userModel(UserModel? userModel) => _userModel = userModel;
  set firebaseUser(User? firebaseUser) => _firebaseUser = firebaseUser;
}
