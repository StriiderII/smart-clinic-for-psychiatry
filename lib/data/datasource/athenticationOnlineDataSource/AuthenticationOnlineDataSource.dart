import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/data/database/FirebaseUtils.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/userModel/User.dart';

import '../../datasourceContracts/authenticationDataSource/AuthenticationDataSource.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationOnlineDataSource extends AuthenticationDataSource {
  FirebaseUtils firebaseUtils;

  @factoryMethod
  AuthenticationOnlineDataSource(this.firebaseUtils);

  @override
  Future<User?> register(
      String name,
      String email,
      String password,
      String passwordVerification,
      String phone,
      String role,
      ) async {
    try {
      // Check if passwords match
      if (password != passwordVerification) {
        throw Exception("Passwords do not match");
      }

      // Create user in Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get the generated user
      User? user = userCredential.user;

      // Save additional user data to Firestore based on the user's role
      if (role == 'patient') {
        await FirebaseUtils.addPatientToFireStore(MyUser(
          id: user?.uid,
          name: name,
          email: email,
          phone: phone,
          role: role,
        ));
      } else if (role == 'doctor') {
        await FirebaseUtils.addDoctorToFireStore(MyUser(
          id: user?.uid,
          name: name,
          email: email,
          phone: phone,
          role: role,
        ));
      } else {
        throw Exception("Invalid user role");
      }

      return user;
    } catch (e) {
      print("Error registering user: $e");
      return null;
    }
  }

  @override
  Future<User?> login(String email, String password, String role) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password );

      // Get the user object
      User? user = userCredential.user;

      return user;
    } catch (e) {
      print("Error logging in: $e");
      return null;
    }
  }
}
