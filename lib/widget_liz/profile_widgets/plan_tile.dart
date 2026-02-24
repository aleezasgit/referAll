import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/core/enums/request_status.dart';

class PlanTile extends StatelessWidget {
  final String title;
  final String price;
  final String seats;
  final PlanTag tag;
  final bool isSelected;
  final VoidCallback onTap;

  const PlanTile({
    super.key,
    required this.title,
    required this.price,
    required this.seats,
    required this.tag,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isSelected
                ? AppTheme.c.primary.main!
                : AppTheme.c.primary.main!,
            width: 1.5,
          ),
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.c.primary.main!,
                    AppTheme.c.primary.main!
                  ],
                )
              : null,
          color: isSelected ? null : AppTheme.c.primary.main!
        ),
        child: Row(
          children: [
            /// Radio Indicator
            _buildRadio(),

            Space.xf(16),

            /// Plan Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title + Badge
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppText.b1b,
                      ),
                      const Spacer(),
                      if (tag != PlanTag.none)
                        _buildTag(),
                    ],
                  ),

                  Space.yf(6),

                  /// Price
                  Text(
                    price,
                    style: AppText.h3b,
                  ),

                  Space.yf(4),

                  /// Seats
                  Text(
                    seats,
                    style: AppText.b2?.cl(AppTheme.c.text.main!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= RADIO =================
  Widget _buildRadio() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppTheme.c.primary.main!
              : AppTheme.c.secondary.main!,
          width: 2,
        ),
        color: isSelected
            ? AppTheme.c.primary.main
            : Colors.transparent,
      ),
      child: isSelected
          ? Center(
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: AppTheme.c.white,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }

  /// ================= TAG =================
  Widget _buildTag() {
    Color bg;
    Color textColor;

    switch (tag) {
      case PlanTag.recommended:
        bg = AppTheme.c.primary.main!;
        textColor = AppTheme.c.purple!;
        break;

      case PlanTag.mostUsed:
        bg = AppTheme.c.primary.main!;
        textColor = AppTheme.c.primary.main!;
        break;

      case PlanTag.premium:
        bg = AppTheme.c.primary.main!;
        textColor = AppTheme.c.primary.main!;
        break;

      default:
        bg = Colors.transparent;
        textColor = Colors.transparent;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _getTagText(),
        style: AppText.h3?.cl(textColor),
      ),
    );
  }

  String _getTagText() {
    switch (tag) {
      case PlanTag.recommended:
        return "Recommended";
      case PlanTag.mostUsed:
        return "Most Used";
      case PlanTag.premium:
        return "Premium";
      default:
        return "";
    }
  }
}


// Column(
//   children: [
//     PlanTile(
//       title: "Basic Plan",
//       price: "\$20.00/month",
//       seats: "10 Referral Agent Seats",
//       tag: PlanTag.recommended,
//       isSelected: selectedIndex == 0,
//       onTap: () => setState(() => selectedIndex = 0),
//     ),

//     Space.yf(16),

//     PlanTile(
//       title: "Gold Plan",
//       price: "\$30.00/month",
//       seats: "15 Referral Agent Seats",
//       tag: PlanTag.mostUsed,
//       isSelected: selectedIndex == 1,
//       onTap: () => setState(() => selectedIndex = 1),
//     ),

//     Space.yf(16),

//     PlanTile(
//       title: "Platinum Plan",
//       price: "\$50.00/month",
//       seats: "20 Referral Agent Seats",
//       tag: PlanTag.premium,
//       isSelected: selectedIndex == 2,
//       onTap: () => setState(() => selectedIndex = 2),
//     ),
//   ],
// );