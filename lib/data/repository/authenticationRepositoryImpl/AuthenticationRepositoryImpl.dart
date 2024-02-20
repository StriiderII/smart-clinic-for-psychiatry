import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/data/datasourceContracts/authenticationDataSource/AuthenticationDataSource.dart';
import 'package:smart_clinic_for_psychiatry/domain/repository/authenticationRepository/AuthenticationRepository.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository{
  AuthenticationDataSource authenticationOnlineDataSource;
  @factoryMethod AuthenticationRepositoryImpl(this.authenticationOnlineDataSource);
  Future<User?> register(
      String name,
      String email,
      String password,
      String passwordVerification,
      String phone,
      String role) {
      return authenticationOnlineDataSource.register(
          name, email, password, passwordVerification, phone, role);
  }

  Future<User?> login(String email, String password) {
    return authenticationOnlineDataSource.login(email, password);
  }

}


