import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';

class AttachedMediaTile extends StatelessWidget {
  final String title;
  final String type;
  final String leadingSvg;
  final String trailingSvg;
  final VoidCallback? onTap;

  const AttachedMediaTile({
    super.key,
    required this.title,
    required this.type,
    required this.leadingSvg,
    required this.trailingSvg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [

            /// Green Icon Circle
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.c.secondary.main!,
              ),
              child: Center(
                child: SvgPicture.asset(
                  leadingSvg,
                  height: 24.h,
                  width: 24.w,
                 
                ),
              ),
            ),

         Space.xf(12),

            /// Title + Type
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppText.b1b?.w(6),),
                    
                  Space.yf(2),
                  Text(
                    type,
                    style: AppText.l1b?.cl(
                    AppTheme.c.text.main!,
                    ),
                  ),
                ],
              ),
            ),

            /// Arrow Icon
            SvgPicture.asset(
              trailingSvg,
              height: 18.h,
              width: 18.w,
             
            ),
          ],
        ),
      ),
    );
  }
}

class AttatchedMadiaCard extends StatelessWidget {
  const AttatchedMadiaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    AttachedMediaTile(
      title: "How to market yourself to get more referrals?",
      type: "mp4",
      leadingSvg: "assets/svgs/video-circle.svg",
      trailingSvg: "assets/svgs/arrow.svg",
    ),
    Space.yf(8),
    AttachedMediaTile(
      title: "How to market yourself to get more ReferALL?",
      type: "PDF",
      leadingSvg: "assets/svgs/document-text.svg",
      trailingSvg: "assets/svgs/arrow.svg",
    ),

  ],
);
  }
}