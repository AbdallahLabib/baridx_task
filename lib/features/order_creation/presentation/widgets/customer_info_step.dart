import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/common_widgets/custom_text_fields/phone_number_text_field.dart';
import '../../../../core/common_widgets/custom_text_fields/string_text_field.dart';
import '../cubit/order_creation_cubit.dart';

class CustomerInfoStep extends StatefulWidget {
  const CustomerInfoStep({super.key});

  @override
  State<CustomerInfoStep> createState() => _CustomerInfoStepState();
}

class _CustomerInfoStepState extends State<CustomerInfoStep> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCreationCubit>();

    final formKey = GlobalKey<FormState>();

    return BlocBuilder<OrderCreationCubit, OrderCreationState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Customer Information',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ).animate().fadeIn(delay: 100.ms, duration: 200.ms).slideX(duration: 200.ms),
              SizedBox(height: 20.h),
              StringTextField(
                hintText: 'Name',
                initialValue: state.orderData?.name,
                onChanged: (value) => cubit.updateCustomerInfo(name: value),
              ).animate().fadeIn(delay: 200.ms, duration: 200.ms).slideX(duration: 200.ms),
              SizedBox(height: 16.h),
              PhoneNumberTextField(
                hintText: 'Phone Number',
                initialValue: state.orderData?.phoneNumber,
                onChanged: (value) => cubit.updateCustomerInfo(phoneNumber: value),
              ).animate().fadeIn(delay: 300.ms, duration: 200.ms).slideX(duration: 200.ms),
              SizedBox(height: 16.h),
              StringTextField(
                hintText: 'Address',
                initialValue: state.orderData?.address,
                maxLines: 3,
                onChanged: (value) => cubit.updateCustomerInfo(address: value),
              ).animate().fadeIn(delay: 400.ms, duration: 200.ms).slideX(duration: 200.ms),
            ],
          ),
        );
      },
    );
  }
}
