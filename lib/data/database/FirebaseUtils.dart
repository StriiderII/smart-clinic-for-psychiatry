import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/userModel/User.dart';

/*
@injectable
@singleton
class FirebaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter(
      fromFirestore: (snapshot, options) =>
          MyUser.fromFireStore(snapshot.data()),
      toFirestore: (user, options) => user.toFireStore(),
    );
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String uId) async {
    var querySnapshot = await getUsersCollection().doc(uId).get();
    return querySnapshot.data();
  }
}*/




