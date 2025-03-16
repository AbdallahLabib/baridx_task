import 'dart:async';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../navigation_service/navigation_service.dart';
import 'dialog_service.dart';
import 'dialogs/app_dialog.dart';
import 'dialogs/dialog_model.dart';
import 'dialogs/error_dialog.dart';

@LazySingleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final NavigationService _navigationService;

  DialogServiceImpl(this._navigationService);

  BuildContext get _context => _navigationService.navigatorKey.currentContext!;

  @override
  Future<void> showAppDialog(DialogModel model) async {
    await showDialog<void>(
      context: _context,
      barrierDismissible: false,
      builder: (_) => AppDialog(dialogModel: model),
    );
  }

  @override
  Future<void> showErrorMessage({required String errorMessage}) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => ErrorDialog(message: errorMessage),
    );
  }
}
