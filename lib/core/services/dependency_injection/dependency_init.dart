import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:baridx_task/core/services/dependency_injection/dependency_init.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async => getIt.init(environment: env);
