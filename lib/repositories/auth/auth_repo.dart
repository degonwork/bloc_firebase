import 'package:bloc_firebase/repositories/auth/base_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepo extends BaseAuthRepo {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepo({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (_) {}
    return null;
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}
