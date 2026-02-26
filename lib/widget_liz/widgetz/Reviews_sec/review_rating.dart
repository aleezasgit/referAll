import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
   padding:Space.all(16,18),
  decoration: BoxDecoration(
    color: AppTheme.c.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(
      color: AppTheme.c.lightGrey.shade400!,
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SvgPicture.asset(
            "assets/svgs/star.svg",
            height: 14,
            width: 14,
          ),
          Space.xf(2.5),
          Text(
            "4.7",
            style: AppText.h5b?.w(7)
          ),
        ],
      ),
    Space.yf(8),
 Text(
        "Average Rating",
        style:  AppText.l1bm?.cl(AppTheme.c.text.main!)
      ),
    ],
  ),
);
  }
  }
