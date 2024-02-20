import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> register(
      String name,
      String email,
      String password,
      String passwordVerification,
      String phone,
      String role
      );
  Future<User?> login(
      String email,
      String password);
}
