import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/data/database/FirebaseUtils.dart';
import '../../datasourceContracts/authenticationDataSource/AuthenticationDataSource.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationOnlineDataSource extends AuthenticationDataSource {
  FirebaseUtils firebaseUtils;

  @factoryMethod AuthenticationOnlineDataSource(this.firebaseUtils);

  @override
  Future<User?> register(String name, String email, String password,
      String passwordVerification, String phone, String role) async {
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
      // Save additional user data to Firestore
      await FirebaseFirestore.instance.collection('user').doc(user?.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'role' : role,
        // You can add more fields as needed
      });

      return user;
    } catch (e) {
      print("Error registering user: $e");
      return null;
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Get the user object
      User? user = userCredential.user;

      return user;
    } catch (e) {
      print("Error logging in: $e");
      return null;
    }
  }
}
