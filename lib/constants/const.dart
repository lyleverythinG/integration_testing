import '../common_packages/common_packages.dart';

class Const {
  static CollectionReference<Map<String, dynamic>> kUserCollection =
      FirebaseFirestore.instance.collection('users');
}
