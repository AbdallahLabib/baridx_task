import 'core/app/app_manager.dart';
import 'core/app/app_manager_env.dart';

void main() async {
  AppManager.instance.init(AppManagerEnv.dev);
  AppManager.instance.run();
}
