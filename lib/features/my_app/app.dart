import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/router/app_router.dart';
import '../../core/services/dependency_injection/dependency_init.dart';
import 'cubit/app_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>()..onPreload(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, snapshot) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, _) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}
