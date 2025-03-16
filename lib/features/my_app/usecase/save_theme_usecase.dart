import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '/core/constants/app_strings.dart';
import '/core/services/local_storage_service/local_storage_service.dart';

import '../../../../core/base/base_usecase.dart';

@injectable
class SaveThemeUseCase extends AppAsyncUseCase<void, ThemeMode> {
  SaveThemeUseCase(@Named("AppLocalStorage") this.localStorageService);
  final LocalStorageService localStorageService;

  @override
  Future<void> execute(ThemeMode params) async {
    localStorageService.saveString(key: THEME_KEY, value: params.name);
  }
}
