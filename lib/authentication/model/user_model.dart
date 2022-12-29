import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as developer;

class UserModel extends Equatable {
  final String uid;
  final DateTime accountCreated;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
    DateTime? accountCreated,
  }) : accountCreated = accountCreated ?? DateTime.now();

  UserModel.fromJson(
    String uid,
    Map<String, dynamic> json,
  )   : uid = json['uid'],
        email = json['email'],
        accountCreated = json['accountCreated'].toDate();

  static UserModel mapAUserDocSnap(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> json = doc.data()!;
    return UserModel.fromJson(doc.id, json);
  }

  @override
  List<Object> get props => [
        uid,
        accountCreated,
        email,
      ];

  Map<String, dynamic> get json => {
        'uid': uid,
        'accountCreated': accountCreated,
        'email': email,
      };
  Map<String, dynamic> toJson() => json;

  Future<bool> commit() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(toJson());
      return true;
    } on FirebaseException {
      developer.log('Error in Adding Users Collection',
          name: 'ErrorAddingUsersCollection');
      return false;
    }
  }
}
