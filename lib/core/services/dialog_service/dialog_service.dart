import 'dialogs/dialog_model.dart';

abstract class DialogService {
  Future<void> showAppDialog(DialogModel model);
  Future<void> showErrorMessage({required String errorMessage});
}
