import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';


class CircleIcon extends StatelessWidget {
  final String iconPath;
  const CircleIcon({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.r,
      backgroundColor: AppTheme.c.secondary.main,
      child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
    );
  }
}
