import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';

class AgentProfileHeader extends StatelessWidget {
  const AgentProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Space.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.c.primary.shade300!,
            AppTheme.c.white!,
          ],
        ),
      ),
      child: Column(
        children: [

          /// 🔹 PROFILE IMAGE WITH ONLINE DOT
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                
                radius: 55.r,
                backgroundImage:
                    const AssetImage("assets/pngs/OB_2.png"),
              ),

              /// Green Online Dot
              Positioned(
                bottom: -5,
                right: 6,
                child: Container(
                  width: 15.w,
                  height: 15.w,
                  decoration: BoxDecoration(
                    color: AppTheme.c.secondary.shade500,
                    shape: BoxShape.circle,
                   
                  ),
                ),
              ),
            ],
          ),

          Space.yf(12),

          /// 🔹 RATING BADGE
          Container(
            padding: Space.only(left: 11,right: 5,top: 4,bottom: 4),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(width: 1,color: AppTheme.c.lightGrey.main!)
              
              
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/svgs/star.svg",
                  width: 12,
                  height: 12,
                ),
                Space.xf(1.5),
                Text(
                  "4.5",
                  style: AppText.l2b?.w(6),
                ),
              ],
            ),
          ),

          Space.yf(8),

          /// 🔹 NAME
          Text(
            "Zackary Johnson",
            style: AppText.h5bm?.w(5),
          ),

          Space.yf(8),

          /// 🔹 BROKER + PHONE ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Broker Chip
              Container(
                padding:
                    Space.all(8,4),
                decoration: BoxDecoration(
                  color: AppTheme.c.primary.shade300,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/user.svg",
                      width: 12,
                      height: 12,
                    ),
                    Space.xf(4),
                    Text(
                      "Broker Name",
                      style: AppText.l2b?.w(6),
                    ),
                  ],
                ),
              ),

              Space.xf(8),

              /// Phone Chip
              Container(
                padding:
                  Space.all(8,4),
                decoration: BoxDecoration(
                  color: AppTheme.c.primary.shade300,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/call.svg",
                      width: 12,
                      height: 12,
                    ),
                    Space.xf(4),
                    Text(
                      "+101-59464646-22",
                      style: AppText.l2b?.w(6),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Space.yf(16),

          /// 🔹 MESSAGE BUTTON
          Container(
            width: double.infinity,
            padding: Space.vf(12),
            decoration: BoxDecoration(
              color:AppTheme.c.secondary.main,
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svgs/message-text.svg",
                  width: 16,
                  height: 16,
                ),
                Space.xf(2),
                Text(
                  "Message",
                  style: AppText.l1bm?.w(5),
                ),
              ],
            ),
          ),

          Space.yf(16),

          /// 🔹 SOCIAL ICONS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon("assets/svgs/Logos.svg"),
              Space.xf(8),
              _socialIcon("assets/svgs/insta.svg"),
              Space.xf(8),
              _socialIcon("assets/svgs/tiktok.svg"),
              Space.xf(8),
              _socialIcon("assets/svgs/youtube.svg"),
            ],
          ),
        ],
      ),
    );
  }

  ///  Social Icon Reusable
  Widget _socialIcon(String asset) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        shape: BoxShape.circle,
        border: Border.all(width: 1,
          color: AppTheme.c.lightGrey.main!,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          asset,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}