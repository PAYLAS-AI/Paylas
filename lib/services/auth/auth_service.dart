import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  FirebaseAuth get auth => _auth;

  String? getCurrentUserEmail() {
    return _auth.currentUser?.email;
  }
  String? getCurrentUserName() {
    return _auth.currentUser?.displayName;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  bool isEmailVerified() {
    User? user = _auth.currentUser;
    return user?.emailVerified ?? false;
  }

  Future<User?> register(String email, String password,
      {String name = "User"}) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();
      User? user = userCredential.user;
      if (user != null) {
        await user.sendEmailVerification();
        return user;
      }
    } catch (e) {
      print("Registration error: $e");
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    if (_auth.currentUser != null) {
      await _auth.currentUser!.delete();
    }
  }
}
