import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_chat/services/database_service.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthService() {
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future registorUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if(user != null){
        await DatabaseService(uid: user.uid).updateUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }
}
