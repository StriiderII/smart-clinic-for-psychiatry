import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/data/datasourceContracts/AuthenticationDataSource.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/userModel/UserModel.dart';
import 'package:smart_clinic_for_psychiatry/domain/repository/AuthenticationRepository.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository{
  AuthenticationDataSource authenticationOnlineDataSource;
  @factoryMethod AuthenticationRepositoryImpl(this.authenticationOnlineDataSource);
  @override
  Future<MyUser?> register(
      String name,
      String email,
      String password,
      String passwordVerification,
      String phone,
      String role) {
    return authenticationOnlineDataSource.register(
        name, email, password, passwordVerification, phone, role);
  }

  @override
  Future<MyUser?> login(String email, String password) {
    return authenticationOnlineDataSource.login(email, password);
  }

}

