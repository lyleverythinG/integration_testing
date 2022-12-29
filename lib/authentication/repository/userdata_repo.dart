import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants/const.dart';

class UserDataRepo {
  final auth = FirebaseAuth.instance;
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return Const.kUserCollection.doc(uid).snapshots();
  }
}
