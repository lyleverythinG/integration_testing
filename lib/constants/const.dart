import 'package:cloud_firestore/cloud_firestore.dart';

class Const {
  static CollectionReference<Map<String, dynamic>> kUserCollection =
      FirebaseFirestore.instance.collection('users');
}
