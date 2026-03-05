// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pract/configs/configs.dart';

// class NotificationSection extends StatelessWidget {
//   const NotificationSection({super.key});

//   @override
  
//   Widget build(BuildContext context) {
//     App.init(context);
//     return Container(
//       padding: Space.all(16),
//       decoration: BoxDecoration(
//         color: AppTheme.c.white,
//         borderRadius: BorderRadius.circular(24.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           /// ----------------
//           /// TODAY
//           /// ----------------
//          Text(
//             "Today",
//             style: AppText.h5bm,
//           ),
//           Space.yf(12),

//           ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 3,
//             separatorBuilder: (_, __) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               return NotificationTile(
//                 isInvitation: index == 2,
//               );
//             },
//           ),

//      Space.yf(12),

//           /// ----------------
//           /// YESTERDAY
//           /// ----------------
//           Text(
//             "Yesterday",
//             style:AppText.h5bm
//           ),

//        Space.yf(12),

//           ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 3,
//             separatorBuilder: (_, __) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               return NotificationTile(
//                 isInvitation: index == 2,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// ////////////////////////////////////////////////////////////
// /// NOTIFICATION TILE
// ////////////////////////////////////////////////////////////

// class NotificationTile extends StatelessWidget {
//   final bool isInvitation;

//   const NotificationTile({
//     super.key,
//     required this.isInvitation,
//   });

//   @override
//   Widget build(BuildContext context) {

//     final iconPath = isInvitation
//         ? "assets/svgs/invitationn.svg"
//         : "assets/svgs/logoo.svg";

//     final title = isInvitation ? "Invitation Sent " : "New Update ";

//     final info = isInvitation
//         ? 'to "user123@gmail.com"'
//         : "Admin uploaded new announcement for commercials";

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         /// ICON
//         SvgPicture.asset(
//           iconPath,
//           height: 40,
//           width: 40,
//         ),

//     Space.xf(8),

//         /// ets/svgs/update_icon.svgTEXT CONTENT
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               /// TITLE + INFO
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: title,
//                       style: AppText.b1b?.w(6)
//                     ),
//                     TextSpan(
//                       text: info,
//                       style: AppText.b1b?.w(4).cl(AppTheme.c.text.main!)
//                     ),
//                   ],
//                 ),
//               ),

//         Space.yf(4),

//                Text(
//                 "3hr ago",
//                 style:AppText.l1bm,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';

class NotificationTile extends StatelessWidget {
  final bool isInvitation;

  const NotificationTile({
    super.key,
    required this.isInvitation,
  });

  @override
  Widget build(BuildContext context) {

    final iconPath = isInvitation
        ? "assets/svgs/invitationn.svg"
        : "assets/svgs/logoo.svg";

    final title = isInvitation ? "Invitation Sent " : "New Update ";

    final info = isInvitation
        ? 'to "user123@gmail.com"'
        : "Admin uploaded new announcement for commercials";

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ICON
        SvgPicture.asset(
          iconPath,
          height: 40,
          width: 40,
        ),

    Space.xf(8),

        /// ets/svgs/update_icon.svgTEXT CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE + INFO
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: AppText.b1b?.w(6)
                    ),
                    TextSpan(
                      text: info,
                      style: AppText.b1b?.w(4).cl(AppTheme.c.text.main!)
                    ),
                  ],
                ),
              ),

        Space.yf(4),

               Text(
                "3hr ago",
                style:AppText.l1bm,
              ),
            ],
          ),
        )
      ],
    );
  }
}