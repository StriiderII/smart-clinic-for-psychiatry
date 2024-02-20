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
    as _i6;
import '../data/datasourceContracts/authenticationDataSource/AuthenticationDataSource.dart'
    as _i5;
import '../data/repository/authenticationRepositoryImpl/AuthenticationRepositoryImpl.dart'
    as _i8;
import '../domain/repository/authenticationRepository/AuthenticationRepository.dart'
    as _i7;
import '../domain/usecase/LoginUseCase.dart' as _i9;
import '../domain/usecase/RegisterUseCase.dart' as _i11;
import '../ui/screens/authentication/loginScreen/LoginScreenViewModel.dart'
    as _i10;
import '../ui/screens/authentication/registerScreen/RegisterScreenViewModel.dart'
    as _i12;
import '../ui/screens/homeScreen/HomeScreenViewModel.dart' as _i4;

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
    gh.factory<_i5.AuthenticationDataSource>(
        () => _i6.AuthenticationOnlineDataSource(gh<_i3.FirebaseUtils>()));
    gh.factory<_i7.AuthenticationRepository>(() =>
        _i8.AuthenticationRepositoryImpl(gh<_i5.AuthenticationDataSource>()));
    gh.factory<_i9.LoginUseCase>(
        () => _i9.LoginUseCase(gh<_i7.AuthenticationRepository>()));
    gh.factory<_i10.LoginViewModel>(
        () => _i10.LoginViewModel(gh<_i9.LoginUseCase>()));
    gh.factory<_i11.RegisterUseCase>(
        () => _i11.RegisterUseCase(gh<_i7.AuthenticationRepository>()));
    gh.factory<_i12.RegisterViewModel>(
        () => _i12.RegisterViewModel(gh<_i11.RegisterUseCase>()));
    return this;
  }
}
