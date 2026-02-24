import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';

class ReferralUserCard extends StatelessWidget {
  final String name;
  final int referralsCount;
  final String imageUrl;
  final VoidCallback onViewReferralsTap;
  final bool isLast;

  const ReferralUserCard({
    super.key,
    required this.name,
    required this.referralsCount,
    required this.imageUrl,
    required this.onViewReferralsTap,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.vf(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: AppTheme.c.lightGrey.shade400!,
                  width: 1,
                ),
              ),
      ),
      child: Row(
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
                  name,
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
            borderRadius: UIProps.radiusXL,
            onTap: onViewReferralsTap,
            child: Container(
              padding: Space.all(8, 4),
              width: 81,
              decoration: BoxDecoration(
                color: AppTheme.c.primary.shade100,
                borderRadius: BorderRadius.circular(99),
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
    );
  }
}