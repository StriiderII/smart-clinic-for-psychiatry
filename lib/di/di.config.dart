// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/firebase/FireBaseUtils.dart' as _i3;
import '../data/datasource/AuthenticationOnlineDataSource.dart' as _i7;
import '../data/datasourceContracts/AuthenticationDataSource.dart' as _i6;
import '../data/repository/authenticationRepositoryImpl.dart' as _i9;
import '../domain/repository/AuthenticationRepository.dart' as _i8;
import '../domain/usecase/LoginUseCase.dart' as _i10;
import '../domain/usecase/LogoutUseCase.dart' as _i12;
import '../domain/usecase/RegisterUseCase.dart' as _i13;
import '../presentation/authentication/loginScreen/LoginScreenViewModel.dart'
    as _i11;
import '../presentation/authentication/registerScreen/RegisterScreenViewModel.dart'
    as _i14;
import '../presentation/doctorSide/homeScreen/HomeScreenViewModel.dart' as _i5;
import '../presentation/doctorSide/settingsScreen/SettingsScreenViewModel.dart'
    as _i15;
import '../presentation/patientSide/homeScreen/HomeScreenViewModel.dart' as _i4;
import '../presentation/patientSide/settingsScreen/SettingsScreenViewModel.dart'
    as _i16;

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
    gh.factory<_i12.LogoutUseCase>(
        () => _i12.LogoutUseCase(gh<_i8.AuthenticationRepository>()));
    gh.factory<_i13.RegisterUseCase>(
        () => _i13.RegisterUseCase(gh<_i8.AuthenticationRepository>()));
    gh.factory<_i14.RegisterViewModel>(
        () => _i14.RegisterViewModel(gh<_i13.RegisterUseCase>()));
    gh.factory<_i15.SettingsViewModel>(
        () => _i15.SettingsViewModel(gh<_i12.LogoutUseCase>()));
    gh.factory<_i16.SettingsViewModel>(
        () => _i16.SettingsViewModel(gh<_i12.LogoutUseCase>()));
    return this;
  }
}
