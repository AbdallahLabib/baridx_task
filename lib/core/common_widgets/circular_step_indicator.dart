import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/themes/colors/app_colors.dart';

class CircularStepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<bool> completedSteps;
  final List<String> stepTitles;
  final List<IconData> stepIcons;

  const CircularStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.completedSteps,
    required this.stepTitles,
    required this.stepIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(totalSteps, (index) {
          final isCompleted = completedSteps[index];
          final isCurrent = index == currentStep - 1;

          return Row(
            children: [
              if (index > 0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    width: 20.w,
                    height: 1,
                    color: isCompleted ? AppColors.primary500 : Colors.grey.shade300,
                  ).animate().fadeIn(delay: (100 * index).ms),
                ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCurrent
                              ? AppColors.primary500
                              : isCompleted
                                  ? AppColors.primary50
                                  : Colors.grey.shade100,
                          border: Border.all(
                            color: isCurrent
                                ? AppColors.primary700
                                : isCompleted
                                    ? AppColors.primary500
                                    : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          stepIcons[index],
                          size: 20.sp,
                          color: isCurrent
                              ? Colors.white
                              : isCompleted
                                  ? AppColors.primary500
                                  : Colors.grey.shade400,
                        ),
                      ).animate().scale(
                            delay: (100 * index).ms,
                            duration: 300.ms,
                            curve: Curves.easeOut,
                          ),
                      if (isCompleted)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(4.r),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 16.w,
                              height: 16.w,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ).animate().scale(
                                delay: (150 * index).ms,
                                duration: 300.ms,
                                curve: Curves.elasticOut,
                              ),
                        ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    stepTitles[index],
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: isCurrent ? AppColors.primary700 : Colors.grey.shade600,
                      fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ).animate().fadeIn(delay: (100 * index).ms),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}