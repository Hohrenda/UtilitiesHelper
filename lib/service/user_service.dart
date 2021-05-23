import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utilities_helper/models/user_model.dart';

class UserService {
  final _users = 'users';

  CollectionReference get _usersCollection =>
      FirebaseFirestore.instance.collection(_users);

  Stream<List<UserModel>> allUsersStream() {
    return _usersCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((doc) => UserModel.fromMap(doc.data()))
        .toList()
        .cast<UserModel>());
  }
}