import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/occupied_card.dart';

class OccupiedSeatList extends StatelessWidget {
  const OccupiedSeatList({super.key});

  List<Map<String, dynamic>> get dummyData => [
  {
    "seatTitle": "Seat 2",
    "userName": "Anderson Harry",
    "referrals": 5,
    "image": "assets/pngs/OB_1.png",
  },
  {
    "seatTitle": "Seat 3",
    "userName": "Johnson Emily",
    "referrals": 3,
    "image": "assets/pngs/OB_1.png",
  },
  {
    "seatTitle": "Seat 4",
    "userName": "Michael Brown",
    "referrals": 7,
    "image": "assets/pngs/OB_1.png",
  },
  {
    "seatTitle": "Seat 5",
    "userName": "Sophia Martinez",
    "referrals": 2,
    "image": "assets/pngs/OB_1.png",
  },

];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24)
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dummyData.length,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (context, index) {
          final data = dummyData[index];
      
          return OccupiedSeatCard(
            seatTitle: data["seatTitle"],
            userName: data["userName"],
            referralsCount: data["referrals"],
            imageUrl: data["image"],
            isLast: index == dummyData.length - 1,
            onMessageTap: () {},
            onViewTap: () {},
            onViewReferralsTap: () {},
          );
        },
      ),
    );
  }
}