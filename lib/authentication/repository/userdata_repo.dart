import '../../common_packages/common_packages.dart';

class UserDataRepo {
  final auth = FirebaseAuth.instance;
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return Const.kUserCollection.doc(uid).snapshots();
  }
}
