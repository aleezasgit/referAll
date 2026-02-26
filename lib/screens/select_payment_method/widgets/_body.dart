// part of '../select_payment_method.dart';

// class _Body extends StatelessWidget {
//   const _Body();

//   @override
//   Widget build(BuildContext context) {
//     final state = _ScreenState.s(context);
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Select Payment Method',
//         type: AppBarType.withText,
//         space: 60,
//       ),

//       body: Padding(
//         padding: Space.only(
//           top: 16.h,
//           bottom: MediaQuery.of(context).padding.bottom + 16.h,
//           left: 16.h,
//           right: 16.h,
//         ),
//         child: FormBuilder(
//           key: state.formKey,
//           initialValue: _FormData.initialValues(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Select Gateway', style: AppText.b1b),
//               Space.yf(6),
//               PaymentGatewayDropdown(
//                 name: _FormKeys.gateway,
//                 options: const [
//                   PaymentGatewayModel(
//                     name: "Stripe",
//                     imagePath: "assets/pngs/stripe.png",
//                   ),
//                   PaymentGatewayModel(
//                     name: "PayPal",
//                     imagePath: "assets/pngs/paypal-logo.png",
//                   ),
//                   PaymentGatewayModel(
//                     name: "Visa",
//                     imagePath: "assets/pngs/visa.png",
//                   ),
//                 ],
//               ),
//               Space.yf(14),
//               AppTextField(
//                 name: _FormKeys.nameOnCard,
//                 textInputType: TextInputType.name,
//                 hint: 'Name on Card',
//                 textInputAction: TextInputAction.next,
//               ),
//               Space.yf(6),
//               AppTextField(
//                 name: _FormKeys.cardNumber,
//                 textInputType: TextInputType.number,
//                 hint: 'Card Number',
//                 textInputAction: TextInputAction.next,
//               ),
//               Space.yf(6),
//               Row(
//                 children: [
//                   Expanded(
//                     child: AppTextField(
//                       name: _FormKeys.cvc,
//                       textInputType: TextInputType.number,
//                       hint: 'CVC',
//                       textInputAction: TextInputAction.next,
//                     ),
//                   ),
//                   Space.xf(6),
//                   Expanded(
//                     child: AppTextField(
//                       name: _FormKeys.zipCode,
//                       textInputType: TextInputType.number,
//                       hint: 'Zip Code',
//                       textInputAction: TextInputAction.done,
//                     ),
//                   ),
//                 ],
//               ),
//               Space.ym!,
//               AppButton(
//                 label: 'Pay \$20.00',
//                 onPressed: () {
//                   showPayAmountBottomSheet(
//                     context,
//                     onPay: () {
//                       Navigator.pop(context);
//                       showSubscriptionSuccessBottomSheet(context);
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
