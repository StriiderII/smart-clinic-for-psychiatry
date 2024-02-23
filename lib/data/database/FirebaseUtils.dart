import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/userModel/User.dart';

@injectable
@singleton
class FirebaseUtils {
  static CollectionReference<MyUser> getPatientsCollection() {
    return FirebaseFirestore.instance
        .collection('patients')
        .withConverter(
      fromFirestore: (snapshot, options) =>
          MyUser.fromFireStore(snapshot.data()),
      toFirestore: (user, options) => user.toFireStore(),
    );
  }

  static CollectionReference<MyUser> getDoctorsCollection() {
    return FirebaseFirestore.instance
        .collection('doctors')
        .withConverter(
      fromFirestore: (snapshot, options) =>
          MyUser.fromFireStore(snapshot.data()),
      toFirestore: (user, options) => user.toFireStore(),
    );
  }

  static Future<void> addPatientToFireStore(MyUser myUser) {
    return getPatientsCollection().doc(myUser.id).set(myUser);
  }

  static Future<void> addDoctorToFireStore(MyUser myUser) {
    return getDoctorsCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readPatientFromFireStore(String uId) async {
    var querySnapshot = await getPatientsCollection().doc(uId).get();
    return querySnapshot.data();
  }

  static Future<MyUser?> readDoctorFromFireStore(String uId) async {
    var querySnapshot = await getDoctorsCollection().doc(uId).get();
    return querySnapshot.data();
  }
}