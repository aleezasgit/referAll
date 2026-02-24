import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class OccupiedSeatCard extends StatelessWidget {
  final String seatTitle;
  final String userName;
  final int referralsCount;
  final String imageUrl;
  final bool isLast;

  final VoidCallback onMessageTap;
  final VoidCallback onViewTap;
  final VoidCallback onViewReferralsTap;

  const OccupiedSeatCard({
    super.key,
    required this.seatTitle,
    required this.userName,
    required this.referralsCount,
    required this.imageUrl,
    required this.onMessageTap,
    required this.onViewTap,
    required this.onViewReferralsTap,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: Space.all(16, 12),
      margin: Space.vf(8),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [

          /// 🔹 TOP CONTAINER (Seat Info)
         
           
             Container(
            //  padding: Space.all(16, 12),
              decoration: BoxDecoration(
                
              ),
              child: Row(
                children: [
                  /// Icon
                  Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.c.secondary.main!,
                        width: 0.8,
                      ),
                      color: AppTheme.c.white,
                    ),
                    child: Padding(
                      padding: Space.all(4),
                      child: SvgPicture.asset(
                        "assets/svgs/3dcube.svg",
                      ),
                    ),
                  ),
            
                  Space.xf(10),
            
                  /// Seat Title
                  Expanded(
                    child: Text(
                      seatTitle,
                      style: AppText.b1b?.w(6),
                    ),
                  ),
            
                  /// Message Button
                  InkWell(
                    borderRadius: BorderRadius.circular(99.r),
                    onTap: onMessageTap,
                    child: Container(
                      padding: Space.all(8, 4),
                      decoration: BoxDecoration(
                        color: AppTheme.c.secondary.main,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Text(
                        "Message",
                        style: AppText.l2b?.w(6)
                            .cl(AppTheme.c.black!),
                      ),
                    ),
                  ),
            
                  Space.xf(6),
            
                  /// View Button
                  InkWell(
                    borderRadius: BorderRadius.circular(99.r),
                    onTap: onViewTap,
                    child: Container(
                      padding: Space.all(10, 4),
                      decoration: BoxDecoration(
                        color: AppTheme.c.primary.main,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Text(
                        "View",
                        style: AppText.l2?.w(6)
                            .cl(AppTheme.c.white!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
            
          
           Space.yf(10),
        Container(
          height: 1,
          width: double.infinity,
          color: AppTheme.c.lightGrey.shade400,

        ),
        Space.yf(8),
          /// 🔹 BOTTOM CONTAINER (User Info)
      
             Row(
               children: [
                         
                 /// Avatar
                 CircleAvatar(
                   radius: 24.r,
                   backgroundImage: AssetImage(imageUrl),
                 ),
                         
                 Space.xf(16),
                         
                 /// Name + referrals
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         userName,
                         style: AppText.b1b?.w(6),
                       ),
                         
                       Space.yf(2),
                         
                       Row(
                         children: [
                           Container(
                             width: 5,
                             height: 5,
                             decoration: BoxDecoration(
                               color: AppTheme.c.accent.green,
                               shape: BoxShape.circle,
                             ),
                           ),
                           Space.xf(6),
                           Text(
                             "$referralsCount Referrals",
                             style: AppText.l1?.w(4)
                                 .cl(AppTheme.c.text.main!),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                         
                 /// View Referrals Button
                 InkWell(
                   borderRadius: BorderRadius.circular(99),
                   onTap: onViewReferralsTap,
                   child: Container(
                     padding: Space.all(10, 4),
                     decoration: BoxDecoration(
                       color: AppTheme.c.primary.shade100,
                       borderRadius: BorderRadius.circular(99),
                       border: Border.all(width: 1,color: AppTheme.c.secondary.shade500!)
                     ),
                     child: Text(
                       "View Referrals",
                       style: AppText.l1b?.w(6)
                           .cl(AppTheme.c.text.shade800!),
                     ),
                   ),
                 ),
               ],
             ),
          
        ],
      ),
    );
  }
}