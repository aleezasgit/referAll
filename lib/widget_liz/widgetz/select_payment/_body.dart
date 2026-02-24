// part of '_body.dart';


// import 'package:flutter/material.dart';

// class _Body extends StatelessWidget {
//   const _Body();

//   @override
//   Widget build(BuildContext context) {
//     final state = _ScreenState.s(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select Payment Method"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [

//             /// Expandable Stripe Card
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: const Text(
//                       "Stripe",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600),
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(state.isExpanded
//                           ? Icons.keyboard_arrow_up
//                           : Icons.keyboard_arrow_down),
//                       onPressed: state.toggleExpand,
//                     ),
//                   ),

//                   if (state.isExpanded)
//                     Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: FormBuilder(
//                         key: state.formKey,
//                         initialValue:
//                             _FormData.initialValues(),
//                         child: Column(
//                           children: [

//                             /// Name
//                             FormBuilderTextField(
//                               name: _FormKeys.name,
//                               decoration:
//                                   _inputDecoration("Name on Card"),
//                             ),

//                             const SizedBox(height: 12),

//                             /// Card Number
//                             FormBuilderTextField(
//                               name: _FormKeys.cardNumber,
//                               keyboardType:
//                                   TextInputType.number,
//                               decoration:
//                                   _inputDecoration("Card Number"),
//                             ),

//                             const SizedBox(height: 12),

//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: FormBuilderTextField(
//                                     name: _FormKeys.cvc,
//                                     keyboardType:
//                                         TextInputType.number,
//                                     decoration:
//                                         _inputDecoration("CVC"),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: FormBuilderTextField(
//                                     name: _FormKeys.zip,
//                                     keyboardType:
//                                         TextInputType.number,
//                                     decoration:
//                                         _inputDecoration("ZIP"),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),

//             const Spacer(),

//             /// Pay Button
//             GestureDetector(
//               onTap: () => state.submit(context),
//               child: Container(
//                 height: 55,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius:
//                       BorderRadius.circular(50),
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color(0xff6D5DF6),
//                       Color(0xff8E7CFF),
//                     ],
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Pay \$20.00",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       filled: true,
//       fillColor: Colors.grey.shade200,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(50),
//         borderSide: BorderSide.none,
//       ),
//       contentPadding:
//           const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//     );
//   }
// }