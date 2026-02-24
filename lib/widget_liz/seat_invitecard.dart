import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class SeatInviteCard extends StatelessWidget {
  final String title;
  final VoidCallback onInviteTap;

  const SeatInviteCard({
    super.key,
    required this.title,
    required this.onInviteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16,12),
      height: 60,
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          /// Left Icon Container
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
                // width: 24,
              //   height: 24,
                 
              ),
            ),
          ),

          Space.xf(10),

          /// Title
          Expanded(
            child: Text(
              title,
              style: AppText.b1b?.w(6),
            ),
          ),

          /// Invite Button
          InkWell(
            borderRadius: BorderRadius.circular(99.r),
            onTap: onInviteTap,
            child: Container(
              padding: Space.all(8,4),
              
              decoration: BoxDecoration(
                color: AppTheme.c.primary.main,
                borderRadius: BorderRadius.circular(99.r),
              ),
              child: Row(
                children: [
                 Container(
                  height: 16,
                  width: 16,
                  child: SvgPicture.asset("assets/svgs/add.svg")),
                  Space.xf(4),
                  Text(
                    "Invite",
                    style: AppText.l2?.w(6)!
                        .cl(AppTheme.c.white!),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}