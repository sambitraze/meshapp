// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// import '../core/helpers/user_service.dart' as _i8;

// import '../network/games_api_service.dart' as _i5;
// import '../network/leagues_api_service.dart'
//  as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {var environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  // gh.lazySingleton<_i5.GamesApiService>(() => _i5.GamesApiService());
  // gh.lazySingleton<_i6.LeaguesApiService>(() => _i6.LeaguesApiService());
  // gh.lazySingleton<_i8.UserServiceViewModel>(() => _i8.UserServiceViewModel());

  return get;
}
