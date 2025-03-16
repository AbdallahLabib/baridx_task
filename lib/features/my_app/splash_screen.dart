import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common_widgets/app_svg_image.dart';
import '../../core/constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 360.w,
          height: 245.h,
          child: const AppSVGImage(image: AppImages.appLogo),
        ),
      )
          .animate()
          .fadeIn(duration: 1500.ms)
          .scaleXY(end: 1.5, duration: 900.ms)
          .then()
          .scaleXY(end: .8, duration: 900.ms)
          .then()
          .shimmer(duration: 1000.ms, color: Colors.white),
    );
  }
}
