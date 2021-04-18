import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth;
  Auth() {
    auth = FirebaseAuth.instance;
  }
  signInWithEmail({String email, String password}) async {
    final result =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    if (result.user != null) {
      print(result.user.uid);
      return result.user.uid;
    }
  }
}
