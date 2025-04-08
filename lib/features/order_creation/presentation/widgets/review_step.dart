import 'package:baridx_task/core/common_widgets/app_size_boxes.dart';
import 'package:baridx_task/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/order_creation_cubit.dart';

// Final step of the order creation process
// Displays a comprehensive summary of all entered information
class ReviewStep extends StatefulWidget {
  const ReviewStep({super.key});

  @override
  State<ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends State<ReviewStep> {
  // Tracks the expanded/collapsed state of each section
  final Map<String, bool> _expandedSections = {
    'Customer Information': true,
    'Package Details': true,
    'Payment Information': true,
  };

  // Toggles the expanded/collapsed state of a section
  void _toggleSection(String title) {
    setState(() {
      _expandedSections[title] = !(_expandedSections[title] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCreationCubit, OrderCreationState>(
      builder: (context, state) {
        final order = state.orderData;
        if (order == null) return const SizedBox.shrink();

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order summary title
              Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
              20.heightBox,
              // Customer information section
              _buildSection(
                'Customer Information',
                [
                  _buildInfoRow('Name', order.name ?? ''),
                  _buildInfoRow('Phone', order.phoneNumber ?? ''),
                  _buildInfoRow('Address', order.address ?? ''),
                ],
                Icons.person_outline,
              ),
              16.heightBox,
              // Package details section
              _buildSection(
                'Package Details',
                [
                  _buildInfoRow('Type', order.packageType ?? ''),
                  _buildInfoRow('Weight', '${order.weight ?? 0} kg'),
                  if (order.deliveryNotes?.isNotEmpty ?? false) _buildInfoRow('Notes', order.deliveryNotes!),
                ],
                Icons.local_shipping_outlined,
              ),
              16.heightBox,
              // Payment information section
              _buildSection(
                'Payment Information',
                [
                  _buildInfoRow('Method', order.paymentMethod?.name ?? ''),
                  if (order.paymentMethod == 'Credit Card') ...[
                    _buildInfoRow(
                        'Card Number', '•••• ${order.cardNumber?.substring(order.cardNumber!.length - 4) ?? ''}'),
                    _buildInfoRow('Card Holder', order.cardHolderName ?? ''),
                  ] else if (order.paymentMethod == 'Pay Later') ...[
                    _buildInfoRow('Phone Number', order.payLaterPhoneNumber ?? ''),
                  ],
                ],
                Icons.payment_outlined,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, List<Widget> children, IconData icon, {Color? color}) {
    final isExpanded = _expandedSections[title] ?? false;

    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _toggleSection(title),
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  Icon(icon, color: Colors.black, size: 24.sp),
                  8.widthBox,
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: color ?? Colors.black,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: isExpanded ? 0 : -0.25,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Column(children: [12.heightBox, ...children]),
            secondChild: const SizedBox.shrink(),
            crossFadeState: isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          8.widthBox,
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
