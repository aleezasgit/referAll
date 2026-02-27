import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.c.primary.main!, width: 1.5.w),
            image: DecorationImage(
              image: AssetImage('assets/pngs/OB_2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Space.xf(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: AppText.b2bm!.cl(AppTheme.c.text.main!),
              ),
              Text('Hello, Coach Anderson', style: AppText.b1bm!.w(6)),
            ],
          ),
        ),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppTheme.c.primary.shade100!, 
          child: SvgPicture.asset(
            'assets/svgs/notification-bing.svg',
            width: 22.w,
            height: 22.h,
          ),
        ),
      ],
    );
  }
}
