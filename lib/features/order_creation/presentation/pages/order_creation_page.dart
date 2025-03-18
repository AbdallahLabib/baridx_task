import 'package:baridx_task/core/common_widgets/app_size_boxes.dart';
import 'package:baridx_task/core/common_widgets/circular_step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/app_button.dart';
import '../../../../core/services/dependency_injection/dependency_init.dart';
import '../../../../core/services/dialog_service/dialog_service.dart';
import '../../../../core/services/dialog_service/dialogs/app_dialog.dart';
import '../../../../core/services/dialog_service/dialogs/dialog_model.dart';
import '../cubit/order_creation_cubit.dart';
import '../widgets/customer_info_step.dart';
import '../widgets/package_details_step.dart';
import '../widgets/payment_step.dart';
import '../widgets/review_step.dart';
import '../widgets/step_header.dart';

class OrderCreationPage extends StatelessWidget {
  const OrderCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderCreationCubit>(),
      child: BlocListener<OrderCreationCubit, OrderCreationState>(
        listenWhen: (previous, current) =>
            previous.isOrderCreated != current.isOrderCreated || previous.errorMessage != current.errorMessage,
        listener: (context, state) async {
          if (state.isOrderCreated) {
            await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (_) => AppDialog(
                dialogModel: DialogModel.confirm(
                    title: 'Success',
                    description: 'Your order has been submitted successfully!',
                    primaryText: 'OK',
                    primaryButtonColor: Colors.green,
                    onPrimaryTapped: () {
                      context.read<OrderCreationCubit>().reset();
                      Navigator.pop(context);
                    }),
              ),
            );
          }
          if (state.errorMessage.isNotEmpty) {
            getIt<DialogService>().showErrorMessage(
              errorMessage: state.errorMessage,
            );
          }
        },
        child: const OrderCreationView(),
      ),
    );
  }
}

class OrderCreationView extends StatelessWidget {
  const OrderCreationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCreationCubit, OrderCreationState>(
      builder: (context, state) {
        final cubit = context.read<OrderCreationCubit>();

        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              _buildStepHeader(context, state, cubit),
              CircularStepIndicator(
                currentStep: state.currentStep + 1,
                totalSteps: state.totalSteps,
                completedSteps: List.generate(
                  state.totalSteps,
                  (index) => state.completedSteps[index] ?? false,
                ),
                stepTitles: const [
                  'Customer',
                  'Package',
                  'Payment',
                  'Review',
                ],
                stepIcons: const [
                  Icons.person_outline,
                  Icons.local_shipping_outlined,
                  Icons.payment_outlined,
                  Icons.description_outlined,
                ],
              ).animate().fadeIn(duration: 600.ms),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: _buildCurrentStep(context, state),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.sp),
                child: Row(
                  children: [
                    if (state.currentStep > 0)
                      Expanded(
                        child: AppButton(
                          type: ButtonType.secondary,
                          text: 'Back',
                          onTap: () => cubit.previousStep(),
                        ).animate().fadeIn(duration: 400.ms).slideX(duration: 400.ms),
                      ),
                    if (state.currentStep > 0) SizedBox(width: 16.w),
                    Expanded(
                      child: AppButton(
                        text: state.currentStep == 3 ? 'Submit Order' : 'Next',
                        isLoading: state.isLoading,
                        onTap: cubit.isCurrentStepValid()
                            ? () => state.currentStep == 3 ? cubit.submitOrder() : cubit.nextStep()
                            : null,
                        type: cubit.isCurrentStepValid() ? ButtonType.active : ButtonType.disabled,
                      ).animate().fadeIn(duration: 400.ms).slideX(duration: 400.ms),
                    ),
                  ],
                ),
              ),
              30.heightBox,
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepHeader(BuildContext context, OrderCreationState state, OrderCreationCubit cubit) {
    String title;
    IconData icon;

    switch (state.currentStep) {
      case 0:
        title = 'Customer Information';
        icon = Icons.person_outline;
      case 1:
        title = 'Package Details';
        icon = Icons.local_shipping_outlined;
      case 2:
        title = 'Payment Information';
        icon = Icons.payment_outlined;
      case 3:
        title = 'Review Order';
        icon = Icons.description_outlined;
      default:
        title = 'Create Order';
        icon = Icons.add_box_outlined;
    }

    return StepHeader(
      title: title,
      icon: icon,
      onBackPressed: () {
        if (state.currentStep > 0) {
          cubit.previousStep();
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }

  Widget _buildCurrentStep(BuildContext context, OrderCreationState state) {
    switch (state.currentStep) {
      case 0:
        return const CustomerInfoStep();
      case 1:
        return const PackageDetailsStep();
      case 2:
        return const PaymentStep();
      case 3:
        return const ReviewStep();
      default:
        return const SizedBox.shrink();
    }
  }
}
