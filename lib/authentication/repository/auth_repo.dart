import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user!;
  }

  Future<User?> signInWithEmailPassword(
      {required String email, required String password}) async {
    final UserCredential authResult =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }
}
