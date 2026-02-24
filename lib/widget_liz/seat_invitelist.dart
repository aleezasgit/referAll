import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/seat_invitecard.dart';

class SeatInviteList extends StatelessWidget {
  const SeatInviteList({super.key});

  /// 🔹 Dummy Data
  List<Map<String, dynamic>> get seats => [
        {"title": "Seat 2"},
        {"title": "Seat 3"},
        {"title": "Seat 4"},
        {"title": "Seat 5"},
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color:AppTheme.c.white
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: seats.length,
        separatorBuilder: (_, __) => Space.yf(6),
        itemBuilder: (context, index) {
          final seat = seats[index];

          return SeatInviteCard(
            title: seat["title"],
            onInviteTap: () {
              debugPrint("Invite tapped for ${seat["title"]}");
            },
          );
        },
      ),
    );
  }
}