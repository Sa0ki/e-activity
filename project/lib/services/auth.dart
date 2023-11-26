import "package:firebase_auth/firebase_auth.dart" as Firebase;
import "package:project/models/user.dart";
import "package:project/services/database.dart";

class AuthService {
  final Firebase.FirebaseAuth _auth = Firebase.FirebaseAuth.instance;

  //creates User object based on Firebase User
  User? _userFromFirebaseUser(Firebase.User user) {
    return User(uid: user.uid);
  }

  Stream<User?> get user {
    return _auth
        .authStateChanges()
        .map((Firebase.User? user) => _userFromFirebaseUser(user!));
  }

  String? getUserEmail() {
    return _auth.currentUser?.email;
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      Firebase.UserCredential authResult = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      Firebase.User? user = authResult.user;
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print("Authentification impossible -> Utilisateur introuvable.");
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      Firebase.UserCredential authResult = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Firebase.User? user = authResult.user;
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print(
          "Inscription impossible -> Vérifier l'email ou le mot de passe (6 caractères minimum).");
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
