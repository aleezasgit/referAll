import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/recent_referalcard.dart';

class ReferralList extends StatelessWidget {
  const ReferralList({super.key});

  /// 🔹 Dummy Data using Map<String, dynamic>
  static final List<Map<String, dynamic>> _referralData = [
    {
      "name": "Anderson Harry",
      "referrals": 5,
      "image": "assets/pngs/OB_1.png",
    },
    {
      "name": "Sophia Williams",
      "referrals": 8,
      "image": "assets/pngs/OB_1.png",
    },
    {
      "name": "Michael Johnson",
      "referrals": 12,
      "image": "assets/pngs/OB_1.png",
    },
    {
      "name": "Emma Brown",
      "referrals": 3,
      "image": "assets/pngs/OB_1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: List.generate(_referralData.length, (index) {
          final user = _referralData[index];
          final bool isLast = index == _referralData.length - 1;

          return ReferralUserCard(
            name: user["name"],
            referralsCount: user["referrals"],
            imageUrl: user["image"],
            isLast: isLast,
            onViewReferralsTap: () {
              debugPrint("Tapped ${user["name"]}");
            },
          );
        }),
      ),
    );
  }
}