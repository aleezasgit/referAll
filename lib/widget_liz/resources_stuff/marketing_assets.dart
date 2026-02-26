import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';

class CustomResourceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgPath;
  final VoidCallback? onTap;

  const CustomResourceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: Space.all(12),
          
          decoration: BoxDecoration(
            color: AppTheme.c.white,
            borderRadius: BorderRadius.circular(18.r),
         
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
         //   mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Icon Circle
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.c.background.main,
                  border: Border.all(
                    color: AppTheme.c.lightGrey.main!,
                    width: 1.w
                  )
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgPath,
                    height: 20.h,
                    width: 20.w,
                  
                  ),
                ),
              ),

            Space.yf(16),

              /// Title
              Text(
                title,
                style: AppText.l1b?.w(6)
              ),

              Space.yf(2),

              /// Subtitle
              Text(
                subtitle,
                style: AppText.l1bm?.cl(AppTheme.c.text.main!,)
                   
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MarketingAssets extends StatelessWidget {
  const MarketingAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
  children: [

    /// Row 1
    Row(
      children: [
        const CustomResourceCard(
          title: '"I Accept ReferALL"',
          subtitle: '5 Items',
          svgPath: 'assets/svgs/link.svg',
        ),
        Space.xf(6),
        const CustomResourceCard(
          title: 'Social Media Captions',
          subtitle: '5 Items',
          svgPath: 'assets/svgs/notification-status.svg',
        ),
      ],
    ),
Space.yf(6),
    /// Row 2
    Row(
      children:  [
        CustomResourceCard(
          title: 'Email Signatures',
          subtitle: '5 Items',
          svgPath: 'assets/svgs/sms-edit.svg',
        ),
        Space.xf(6),
        CustomResourceCard(
          title: 'Referral Network Badges',
          subtitle: '5 Items',
          svgPath: 'assets/svgs/image.svg',
        ),
      ],
    ),
  ],
);
  }
}