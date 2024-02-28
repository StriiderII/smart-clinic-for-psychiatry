import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/data/database/firebase/FireBaseUtils.dart';
import 'package:smart_clinic_for_psychiatry/data/datasourceContracts/AuthenticationDataSource.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/userModel/UserModel.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationOnlineDataSource extends AuthenticationDataSource {
  FirebaseUtils firebaseUtils;

  @factoryMethod AuthenticationOnlineDataSource(this.firebaseUtils);

  @override
  Future<MyUser?> register(String name, String email, String password,
      String passwordVerification, String phone, String role) async {
    try {
      // Check if passwords match
      if (password != passwordVerification) {
        throw Exception("Passwords do not match");
      }

      // Create user in Firebase Authentication
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);

      // Create MyUser object with the provided information, including role
      MyUser myUser = MyUser(
          id: credential.user?.uid ?? '',
          name: name,
          email: email,
          phone: phone,
          role: role);

      // Save user data to Firestore using FirebaseUtils
      await FirebaseUtils.addUserToFireStore(myUser);

      return myUser; // Return the created user object
    } catch (e) {
      print("Error registering user: $e");
      return null;
    }
  }


  @override
  Future<MyUser?> login(String email, String password) async {
    try {
      // Sign in with email and password
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);

      // Retrieve user data from Firestore using FirebaseUtils
      var user = await FirebaseUtils.readUserFromFireStore(credential.user?.uid ?? '');

      // Check if user data is retrieved successfully
      if (user != null) {
        // Update the user object with the retrieved data, including the role
        user.role = user.role ?? ''; // Assign an empty string if role is not present
        return user;
      } else {
        return null; // Login failed if user data not retrieved
      }
    } catch (e) {
      print("Error logging in: $e");
      return null;
    }
  }



}
