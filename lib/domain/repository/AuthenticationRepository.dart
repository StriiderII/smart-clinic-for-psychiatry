import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/userModel/UserModel.dart';

abstract class AuthenticationRepository {
  Future<MyUser?> register(
      String name,
      String email,
      String password,
      String passwordVerification,
      String phone,
      String role
      );
  Future<MyUser?> login(String email, String password);
  Future<void> logout();

}
