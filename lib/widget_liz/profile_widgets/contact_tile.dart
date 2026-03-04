// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pract/configs/configs.dart';

// class ContactTile extends StatelessWidget {
//   final String iconPath;
//   final String title;
//   final String subtitle;
//   final Color iconBgColor;
//   final VoidCallback? onTap;

//   const ContactTile({
//     super.key,
//     required this.iconPath,
//     required this.title,
//     required this.subtitle,
//     required this.iconBgColor,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//      // borderRadius: BorderRadius.circular(20),
//       onTap: onTap,
//       child: Container(
//         padding:Space.all(16),
//         decoration: BoxDecoration(
//           color: AppTheme.c.white,
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: Row(
//           children: [

//             Container(
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                 color: iconBgColor,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: SvgPicture.asset(
//                   iconPath,
//                   height: 24,
//                   width: 24,
//                 ),
//               ),
//             ),

//             Space.xf(12),

//             /// TITLE + SUBTITLE
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: AppText.b1b?.w(6),
//                   ),
//                   Space.yf(2),
//                   Text(
//                     subtitle,
//                     style: AppText.l1b?.cl(AppTheme.c.text.main!),
//                   ),
//                 ],
//               ),
//             ),

         
//             SvgPicture.asset(
//               "assets/svgs/arrow.svg",
//               height: 18,
//               width: 18,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // to use(copy paste)
// //   ContactTile(
// //   iconPath: "assets/svgs/global.svg",
// //   title: "Website",
// //   subtitle: "www.Referral.com",
// //   iconBgColor: AppTheme.c.black!,
// // ),
// // Space.yf(6),
// // ContactTile(
// //   iconPath: "assets/svgs/sms.svg",
// //   title: "Email address",
// //   subtitle: "user@gmail.com",
// //   iconBgColor:AppTheme.c.primary.main! ,
// // ),
// // Space.yf(6),
// // ContactTile(
// //   iconPath: "assets/svgs/sms (1).svg",
// //   title: "Phone Number",
// //   subtitle: "+101-54458484-452",
// //   iconBgColor:AppTheme.c.secondary.main!,
// // ),
// // Space.yf(6),
// // ContactTile(
// //   iconPath: "assets/svgs/Group.svg",
// //   title: "Contact Support",
// //   subtitle: "@ReferralSupport",
// //   iconBgColor: AppTheme.c.secondary.main!,
// // ),