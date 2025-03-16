import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/themes/colors/app_colors.dart';

class CustomStepIndicator extends StatefulWidget {
  final int currentStep;
  final int totalSteps;
  final List<bool> completedSteps;

  const CustomStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.completedSteps,
  });

  @override
  State<CustomStepIndicator> createState() => _CustomStepIndicatorState();
}

class _CustomStepIndicatorState extends State<CustomStepIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0, end: widget.currentStep / widget.totalSteps)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(CustomStepIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStep != widget.currentStep) {
      _animation = Tween<double>(
        begin: oldWidget.currentStep / widget.totalSteps, // Start from current position
        end: widget.currentStep / widget.totalSteps, // Animate to new position
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      //from: 0 is to reset the animation to start fresh .. This ensures the animation plays every time the step changes
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Align(
                alignment: Alignment.centerLeft, // Align to the left
                child: Container(
                  width: MediaQuery.of(context).size.width * _animation.value,
                  decoration: const BoxDecoration(color: AppColors.primary500),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.currentStep}/${widget.totalSteps}',
              key: ValueKey(widget.currentStep),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
              ),
            ),
            if (widget.completedSteps[widget.currentStep - 1])
              Container(
                margin: EdgeInsets.only(left: 8.w),
                padding: EdgeInsets.all(2.r),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 16.r,
                  color: Colors.white,
                ),
              ).animate().scale(duration: 300.ms),
          ],
        ),
      ],
    );
  }
}
