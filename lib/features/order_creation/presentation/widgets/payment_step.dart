import 'package:baridx_task/features/order_creation/data/models/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/common_widgets/custom_text_fields/phone_number_text_field.dart';
import '../../../../core/common_widgets/custom_dropdown.dart';
import '../cubit/order_creation_cubit.dart';
import 'credit_card_form.dart';

// Third step of the order creation process
// Handles payment method selection and related form fields
class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});

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
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 200.ms).slideX(duration: 200.ms),
                SizedBox(height: 20.h),
                // Payment method selection dropdown
                CustomDropdown<PaymentMethod>(
                  placeholder: 'Select Payment Method',
                  items: PaymentMethod.values.toList(),
                  isMultiSelect: false,
                  selectedItem: state.orderData?.paymentMethod,
                  onItemSelected: (value) => cubit.updatePaymentDetails(paymentMethod: value),
                  itemLabel: (item) => item.name,
                ).animate().fadeIn(delay: 200.ms, duration: 200.ms).slideX(duration: 200.ms),
                SizedBox(height: 16.h),
                // Conditional form based on payment method
                if (state.orderData?.paymentMethod == PaymentMethod.creditCard)
                  const CreditCardFormWidget()
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 200.ms)
                      .slideX(duration: 200.ms),
                if (state.orderData?.paymentMethod == PaymentMethod.payLater)
                  PhoneNumberTextField(
                    hintText: 'Phone Number for Pay Later',
                    initialValue: state.orderData?.payLaterPhoneNumber,
                    onChanged: (value) => cubit.updatePaymentDetails(
                      paymentMethod: PaymentMethod.payLater,
                      payLaterPhoneNumber: value,
                    ),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter phone number' : null,
                  ).animate().fadeIn(delay: 300.ms, duration: 200.ms).slideX(duration: 200.ms),
              ],
            ),
          ),
        );
      },
    );
  }
}
