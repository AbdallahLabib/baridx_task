import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/router/app_router.dart';
import '../usecase/save_theme_usecase.dart';

part 'app_cubit.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(ThemeMode.light) ThemeMode themeData,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CurrentAppState;
}

@Singleton()
class AppCubit extends Cubit<AppState> {
  final SaveThemeUseCase _saveThemeUseCase;

  AppCubit(
    this._saveThemeUseCase,
  ) : super(AppState());

  FutureOr<void> onPreload() async {
    // Check if user is already logged in.

    // Wait for 3 seconds for splash screen.
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to order creation
    router.go('/order-creation');
  }

  FutureOr<void> onToggleThemeMode() async {
    final newThemeMode = state.themeData == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeData: newThemeMode));

    await _saveThemeUseCase.execute(newThemeMode);
  }
}
