import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_clinic_for_psychiatry/data/database/variables.dart';


class Patient {
  final String username;
  String? fullName;
  String? phoneNumber;
  String? dateOfBirth;
  String? email;


  Patient({
    required this.username,
    required this.fullName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.email,

  });

  Patient.getFromFirebase({
    required this.username,
  }) {

    firestore.collection("clients").doc(username).get().then((value) {

      var patientData = value.data()!;
      fullName = patientData["fullName"];
      phoneNumber = patientData["phoneNumber"];
      dateOfBirth = patientData["dateOfBirth"];
      email = patientData["email"];


    });

  }
}
