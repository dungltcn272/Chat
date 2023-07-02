import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String? uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");
  final CollectionReference groupCollection =
  FirebaseFirestore.instance.collection("group");
  Future updateUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email" :email,
      "group" : [],
      "profilePic" :"",
      "uid" : uid,
    });
  }
}
