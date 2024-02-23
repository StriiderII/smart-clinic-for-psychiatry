// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/FirebaseUtils.dart' as _i3;
import '../data/datasource/athenticationOnlineDataSource/AuthenticationOnlineDataSource.dart'
    as _i7;
import '../data/datasourceContracts/authenticationDataSource/AuthenticationDataSource.dart'
    as _i6;
import '../data/repository/authenticationRepositoryImpl/AuthenticationRepositoryImpl.dart'
    as _i9;
import '../domain/repository/authenticationRepository/AuthenticationRepository.dart'
    as _i8;
import '../domain/usecase/LoginUseCase.dart' as _i10;
import '../domain/usecase/RegisterUseCase.dart' as _i12;
import '../presentation/authentication/loginScreen/LoginScreenViewModel.dart'
    as _i11;
import '../presentation/authentication/registerScreen/RegisterScreenViewModel.dart'
    as _i13;
import '../presentation/doctorSide/homeScreen/HomeScreenViewModel.dart' as _i5;
import '../presentation/patientSide/homeScreen/HomeScreenViewModel.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FirebaseUtils>(() => _i3.FirebaseUtils());
    gh.factory<_i4.HomeViewModel>(() => _i4.HomeViewModel());
    gh.factory<_i5.HomeViewModelDoctor>(() => _i5.HomeViewModelDoctor());
    gh.factory<_i6.AuthenticationDataSource>(
        () => _i7.AuthenticationOnlineDataSource(gh<_i3.FirebaseUtils>()));
    gh.factory<_i8.AuthenticationRepository>(() =>
        _i9.AuthenticationRepositoryImpl(gh<_i6.AuthenticationDataSource>()));
    gh.factory<_i10.LoginUseCase>(
        () => _i10.LoginUseCase(gh<_i8.AuthenticationRepository>()));
    gh.factory<_i11.LoginViewModel>(
        () => _i11.LoginViewModel(gh<_i10.LoginUseCase>()));
    gh.factory<_i12.RegisterUseCase>(
        () => _i12.RegisterUseCase(gh<_i8.AuthenticationRepository>()));
    gh.factory<_i13.RegisterViewModel>(
        () => _i13.RegisterViewModel(gh<_i12.RegisterUseCase>()));
    return this;
  }
}
