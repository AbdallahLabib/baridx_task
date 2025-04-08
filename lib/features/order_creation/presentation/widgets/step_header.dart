import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Header component for each step in the order creation process
// Displays the step title and icon with animated transitions
class StepHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onBackPressed;

  const StepHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      // Applies elevation effect with shadow
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Animated step icon
            Icon(icon, color: Colors.black, size: 24.sp)
                .animate()
                .fadeIn(delay: 200.ms, duration: 300.ms)
                .scale(begin: const Offset(0.5, 0.5), end: const Offset(1, 1)),
            // Animated step title
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ).animate().fadeIn(delay: 300.ms, duration: 300.ms).slideX(begin: 0.3, end: 0),
          ],
        ),
      ),
    );
  }
}
