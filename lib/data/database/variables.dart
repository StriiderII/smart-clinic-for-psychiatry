import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/authenticationModel/UserAuthenticationModel.dart';
import 'package:smart_clinic_for_psychiatry/presentation/userRoleScreen/selection/model/selection_model.dart';





late FirebaseFirestore firestore;

class AppPatient {
  late final String username;
  String? fullName;
  String? email;
  String? phoneNumber;




  AppPatient._internal();

  static final AppPatient _singleton = AppPatient._internal();

  factory AppPatient.setData({
    required username,
    required AuthenticationType authenticationType,
    fullName,
    email,
    phoneNumber,
  }) {
    _singleton.username = username;
    if (authenticationType == AuthenticationType.login) {
      firestore.collection("patients").doc(username).get().then(
        (value) {
          var patient = value.data()!;
          GeoPoint clientLocation = patient["location"];
          _singleton.fullName = patient["fullName"];
          _singleton.email = patient["email"];
          _singleton.phoneNumber = patient["phoneNumber"];

        },
      );
    } else {
      _singleton.fullName = fullName;
      _singleton.email = email;
      _singleton.phoneNumber = phoneNumber;

        (value) {
          GeoPoint position = GeoPoint(value.latitude, value.longitude);

          firestore.collection("clients").doc(username).set(
            {
              "fullName": fullName,
              "email": email,
              "phoneNumber": phoneNumber,

            },
          ).then(
            (value) {

            },
          );
        };

    }
    return _singleton;
  }
  factory AppPatient() {
    return _singleton;
  }
}

// var appClient = AppClient.setData(username: "AhmedSarg", authenticationType: AuthenticationType.login);

late AppPatient appPatient;

class AppDoctor {
  late final String username;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? medicalLicense;
  double? rate;


  AppDoctor._internal();

  static final AppDoctor _singleton = AppDoctor._internal();

  factory AppDoctor.setData({
    required username,
  }) {
    _singleton.username = username;
    firestore.collection("doctors").doc(username).get().then(
      (value) {
        var doctor = value.data()!;
        GeoPoint driverLocation = doctor["location"];
        _singleton.fullName = doctor["fullName"];
        _singleton.email = doctor["email"];
        _singleton.phoneNumber = doctor["phoneNumber"];
        _singleton.medicalLicense = doctor["medicalLicense"];
        _singleton.rate = doctor["rate"];

      },
    );
    return _singleton;
  }

  factory AppDoctor() {
    return _singleton;
  }
}

var appDoctor = AppDoctor.setData(username: "SherifMohamed");

Selection userType = Selection.patient;
