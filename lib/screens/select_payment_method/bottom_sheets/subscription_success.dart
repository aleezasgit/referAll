// part of '../select_payment_method.dart';

// void showSubscriptionSuccessBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     useSafeArea: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) {
//       return Container(
//         margin: Space.all(
//           8,
//         ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 8.h),
//         padding: Space.all(16).copyWith(top: 8.h),
//         decoration: BoxDecoration(
//           color: AppTheme.c.background.main,
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             /// Handle bar
//             Center(
//               child: Container(
//                 width: 48.w,
//                 height: 4.h,
//                 decoration: BoxDecoration(
//                   color: AppTheme.c.background.shade400,
//                   borderRadius: BorderRadius.circular(32.r),
//                 ),
//               ),
//             ),

//             Space.yf(20),

//             /// Success Icon
//             CircleIcon(iconPath: "assets/svgs/check.svg"),

//             Space.yf(20),

//             Text(
//               "Plan Subscribed Successfully",
//               style: AppText.h5bm,
//               textAlign: TextAlign.center,
//             ),

//             Space.yf(8),

//             Text(
//               "You can view your subscribed plan in settings and can change there",
//               style: AppText.b1bm?.cl(AppTheme.c.text.main!),
//               textAlign: TextAlign.center,
//             ),

//             Space.yf(20),

//             /// Plan Card
//             Container(
//               padding: Space.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.r),
//                 border: Border.all(color: AppTheme.c.secondary.shade600!),
//                 gradient: UIProps.primaryGradient,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Platinum Plan",
//                           style: AppText.l1?.cl(AppTheme.c.text.main!),
//                         ),
//                         Space.yf(4),
//                         Text("\$50.00/month", style: AppText.b1b!.w(6)),
//                         Space.yf(4),
//                         Text(
//                           "20 Referral Agent Seats",
//                           style: AppText.l1!.cl(AppTheme.c.text.main!),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: Space.all(8, 1),
//                     decoration: BoxDecoration(
//                       color: AppTheme.c.secondary.shade300,

//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Text(
//                       "Subscribe",
//                       style: AppText.l1bm
//                           ?.cl(AppTheme.c.secondary.shade800!)
//                           .copyWith(height: 1.5),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Space.yf(20),

//             /// Done Button
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//                 AppRoutes.tutorial.push(context);
//               },
//               child: Container(
//                 height: 52.h,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.r),
//                   color: AppTheme.c.primary.main,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Done",
//                     style: AppText.h5b?.w(7).cl(AppTheme.c.white!),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
