import 'package:baridx_task/features/order_creation/data/models/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/order_creation_cubit.dart';

class CreditCardFormWidget extends StatefulWidget {
  const CreditCardFormWidget({super.key});

  @override
  State<CreditCardFormWidget> createState() => _CreditCardFormWidgetState();
}

class _CreditCardFormWidgetState extends State<CreditCardFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCreationCubit, OrderCreationState>(
      builder: (context, state) {
        final cubit = context.read<OrderCreationCubit>();
        final orderData = state.orderData;

        return Column(
          children: [
            CreditCardWidget(
              cardNumber: orderData?.cardNumber ?? '',
              expiryDate: orderData?.expiryDate ?? '',
              cardHolderName: orderData?.cardHolderName ?? '',
              cvvCode: orderData?.cvvCode ?? '',
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (_) {},
            ),
            Theme(
              data: ThemeData(
                inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
              ),
              child: CreditCardForm(
                formKey: formKey,
                cardNumber: orderData?.cardNumber ?? '',
                expiryDate: orderData?.expiryDate ?? '',
                cardHolderName: orderData?.cardHolderName ?? '',
                cvvCode: orderData?.cvvCode ?? '',
                onCreditCardModelChange: (creditCardModel) {
                  cubit.updatePaymentDetails(
                    paymentMethod: PaymentMethod.creditCard,
                    cardNumber: creditCardModel.cardNumber,
                    expiryDate: creditCardModel.expiryDate,
                    cardHolderName: creditCardModel.cardHolderName,
                    cvvCode: creditCardModel.cvvCode,
                  );
                },
                // themeColor: Theme.of(context).primaryColor,
                obscureCvv: true,
                obscureNumber: true,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                enableCvv: true,
                cvvValidationMessage: 'Please input a valid CVV',
                dateValidationMessage: 'Please input a valid date',
                numberValidationMessage: 'Please input a valid number',
              ),
            ),
          ],
        );
      },
    );
  }
}
