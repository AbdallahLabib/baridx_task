import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/common_widgets/custom_dropdown.dart';
import '../../../../core/common_widgets/custom_text_fields/number_text_field.dart';
import '../../../../core/common_widgets/custom_text_fields/string_text_field.dart';
import '../cubit/order_creation_cubit.dart';

// Second step of the order creation process
// Collects package information including type, weight, and delivery notes
class PackageDetailsStep extends StatelessWidget {
  const PackageDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCreationCubit>();
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<OrderCreationCubit, OrderCreationState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Step title with animation
                Text(
                  'Package Details',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 200.ms).slideX(duration: 200.ms),
                SizedBox(height: 20.h),
                // Package type selection dropdown
                CustomDropdown<String>(
                  placeholder: 'Package Type',
                  items: const ['Standard', 'Express', 'Premium'],
                  selectedItem: state.orderData?.packageType,
                  isMultiSelect: false,
                  onItemSelected: (value) => cubit.updatePackageDetails(packageType: value),
                  itemLabel: (item) => item,
                ).animate().fadeIn(delay: 200.ms, duration: 200.ms).slideX(duration: 200.ms),
                SizedBox(height: 16.h),
                // Package weight input with validation
                NumberTextField(
                  hintText: 'Weight (kg)',
                  initialValue: state.orderData?.weight?.toString(),
                  onChanged: (value) => cubit.updatePackageDetails(
                    weight: double.tryParse(value.toString()),
                  ),
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter package weight' : null,
                ).animate().fadeIn(delay: 300.ms, duration: 200.ms).slideX(duration: 200.ms),
                SizedBox(height: 16.h),
                // Optional delivery notes input
                StringTextField(
                  hintText: 'Delivery Notes (Optional)',
                  initialValue: state.orderData?.deliveryNotes,
                  maxLines: 3,
                  onChanged: (value) => cubit.updatePackageDetails(deliveryNotes: value),
                ).animate().fadeIn(delay: 400.ms, duration: 200.ms).slideX(duration: 200.ms),
              ],
            ),
          ),
        );
      },
    );
  }
}
