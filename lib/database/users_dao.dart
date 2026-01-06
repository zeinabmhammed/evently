import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/database/model/app_user.dart';

class UsersDao {
  static var _db = FirebaseFirestore.instance;

  static CollectionReference<AppUser> _getUsersCollections() {
    return _db
        .collection('users')
        .withConverter<AppUser>(
          fromFirestore: (snapshot, options) =>
              AppUser.fromMap(snapshot.data()),
          toFirestore: (user, options) => user.toMap(),
        );
  }

  static Future<void> addUser(AppUser user) async {
    //insert into database
    var docReference = _getUsersCollections().doc(user.id);
    await docReference.set(user);
  }

  static Future<AppUser?> getUserById(String? uid) async {
    var doc = await _getUsersCollections().doc(uid).get();
    return doc.data();
  }
}
