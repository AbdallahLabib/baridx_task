// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:baridx_task/core/global_context.dart' as _i49;
import 'package:baridx_task/core/services/dependency_injection/register_module.dart'
    as _i546;
import 'package:baridx_task/core/services/dialog_service/dialog_service.dart'
    as _i1009;
import 'package:baridx_task/core/services/dialog_service/dialog_service_impl.dart'
    as _i792;
import 'package:baridx_task/core/services/local_storage_service/local_storage_service.dart'
    as _i296;
import 'package:baridx_task/core/services/local_storage_service/local_storage_service_impl.dart'
    as _i30;
import 'package:baridx_task/core/services/navigation_service/i_navigation_service.dart'
    as _i715;
import 'package:baridx_task/core/services/navigation_service/navigation_service.dart'
    as _i1068;
import 'package:baridx_task/features/my_app/cubit/app_cubit.dart' as _i443;
import 'package:baridx_task/features/my_app/usecase/save_theme_usecase.dart'
    as _i115;
import 'package:baridx_task/features/order_creation/data/repositories/order_creation_repository.dart'
    as _i962;
import 'package:baridx_task/features/order_creation/presentation/cubit/order_creation_cubit.dart'
    as _i932;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter/widgets.dart' as _i718;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:uuid/uuid.dart' as _i706;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.getSharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i49.GlobalContext>(() => _i49.GlobalContext());
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigator);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.getSecureStorage);
    gh.lazySingleton<_i706.Uuid>(() => registerModule.uuid);
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i296.LocalStorageService>(
      () => _i30.LocalStorageServiceImpl(gh<_i460.SharedPreferences>()),
      instanceName: 'AppLocalStorage',
    );
    gh.lazySingleton<_i296.LocalStorageService>(
      () => _i30.AppSecureStorageImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i706.Uuid>(),
      ),
      instanceName: 'AppSecureStorage',
    );
    gh.factory<_i962.OrderCreationRepository>(
        () => _i962.OrderCreationRepositoryImpl());
    gh.factory<_i115.SaveThemeUseCase>(() => _i115.SaveThemeUseCase(
        gh<_i296.LocalStorageService>(instanceName: 'AppLocalStorage')));
    gh.lazySingleton<_i1068.NavigationService>(() =>
        _i715.INavigationService(gh<_i718.GlobalKey<_i718.NavigatorState>>()));
    gh.lazySingleton<_i1009.DialogService>(
        () => _i792.DialogServiceImpl(gh<_i1068.NavigationService>()));
    gh.factory<_i932.OrderCreationCubit>(() => _i932.OrderCreationCubit(
          gh<_i1009.DialogService>(),
          gh<_i962.OrderCreationRepository>(),
          gh<_i1068.NavigationService>(),
        ));
    gh.singleton<_i443.AppCubit>(
        () => _i443.AppCubit(gh<_i115.SaveThemeUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i546.RegisterModule {}
