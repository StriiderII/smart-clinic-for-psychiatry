
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/domain/repository/authenticationRepository/AuthenticationRepository.dart';

@injectable
class LoginUseCase{
  AuthenticationRepository repository;
  @factoryMethod LoginUseCase(this.repository);

  Future<User?>invoke(String email, String password, String role){
    return repository.login(email, password, role);
  }
}
