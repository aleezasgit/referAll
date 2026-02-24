
import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/profile_sec.dart';

import 'package:pract/widget_liz/statusexpandable_card.dart';
import 'package:pract/widget_liz/widgetz/select_payment/review_list.dart';
import 'package:pract/widget_liz/widgetz/select_payment/review_rating.dart';
import 'package:pract/widget_liz/widgetz/select_payment/review_stat.dart';
import 'package:pract/widget_liz/widgetz/select_payment/reviews_card.dart';
import 'package:pract/widgets/agentinfo_card.dart';
import 'package:pract/widgets/agentmarketing_card.dart';
import 'package:pract/widgets/core/enums/request_status.dart';

class PracticingScreen extends StatelessWidget {
  const PracticingScreen({super.key});
  

  @override
  
  Widget build(BuildContext context)
   {   App.init(context);
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
//           CustomExpandableCard(
//         title: "What is the Referral platform ?",
//         description:
//         "Other real estate analysts have suggested that market fluctuations are becoming less impactful on property values, mainly because a significant portion of available properties has already been sold.",
//             ),
//             Space.yf(5),

            
           
        
            
//          Container(
//             child: ReferralList()),
//             Space.yf(5),

        
//           SeatInviteList(),

//           OccupiedSeatList(),
//           ProfileInfoExpandableCard(
//   email: "sarah.thompson@gmail.com",
//   phone: "+1 (415) 555-7821",
//   experience: "5 Years",
//   address: "San Francisco, CA",
// ),

// Space.yf(5),

// AgentDetailsExpandableCard(propertyType: "abc", licenseNumber: "30Ab", recentSales: "60+", averageRating:"4.5"),


// Space.yf(5),
// AgentDetailsExpandableCard(
//   propertyType: "Single Family, Commercials",
//   licenseNumber: "EL#12122",
//   recentSales: "22k",
//   averageRating: "4.5",
// ),

// Space.yf(16),

// AgentMarketingExpandableCard(
//   images: [
//     "assets/pngs/OB_2.png",
//     "assets/pngs/OB_2.png",
//     "assets/pngs/OB_2.png",
//     "assets/pngs/OB_1.png",
//     "assets/pngs/OB_2.png",
//     "assets/pngs/OB_1.png",
//   ],
// ),
// Space.yf(5),

// GestureDetector(
//   onTap: () {
//     showPayAmountBottomSheet(
//       context,
//       onPay: () {
//         Navigator.pop(context);
//         showPlanSuccessBottomSheet(context);
//       },
//     );
//   },
//   child: Container(
//     height: 52.h,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(50.r),
//       gradient: LinearGradient(
//         colors: [
//           AppTheme.c.primary.main!,
//           AppTheme.c.primary.shade100!,
//         ],
//       ),
//     ),
//     child: Center(
//       child: Text(
//         "Subscribe Plan",
//         style: AppText.b1b?.cl(AppTheme.c.white!),
//       ),
//     ),
//   ),
// ),
//  AgentProfileHeader(),
 StatusExpandableCard(
  name: "Zackary Johnson",
  role: "Seller",
  status: RequestStatus.pending,
  onViewDetails: () {
    print("View Details clicked");
  },
),
Space.yf(12),
 
 StatusExpandableCard(
  name: "Zackary Johnson",
  role: "Seller",
  status: RequestStatus.accepted,
  onViewDetails: () {
    print("View Details clicked");
  },
),

 ReviewList(),

ReviewRating(),
ReviewStatsSection(),






            
          ],
        ),
      ),
    );
  }
}
