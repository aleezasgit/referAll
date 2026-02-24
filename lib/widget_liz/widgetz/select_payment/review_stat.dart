import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';

class ReviewStatsSection extends StatelessWidget {
  const ReviewStatsSection({super.key});

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
    children:  [
      Text(
        "200",
        style: AppText.h5b?.w(7)
      ),
     Space.yf(8),
      Text(
        "Total Reviews",
        style: AppText.l1bm?.cl(AppTheme.c.text.main!)
        
      ),
    ],
  ),
);
  }
  }
