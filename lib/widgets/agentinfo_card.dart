import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class AgentDetailsExpandableCard extends StatefulWidget {
  final String propertyType;
  final String licenseNumber;
  final String recentSales;
  final String averageRating;

  const AgentDetailsExpandableCard({
    super.key,
    required this.propertyType,
    required this.licenseNumber,
    required this.recentSales,
    required this.averageRating,
  });

  @override
  State<AgentDetailsExpandableCard> createState() =>
      _AgentDetailsExpandableCardState();
}

class _AgentDetailsExpandableCardState
    extends State<AgentDetailsExpandableCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16, 12),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          /// Header
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Agent Details",
                    style: AppText.b1b?.w(6),
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    "assets/svgs/arrow-right.svg",
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
          ),

          if (isExpanded) ...[
            Space.yf(12),
            Divider(
              color: AppTheme.c.lightGrey.shade400,
              thickness: 1,
            ),
            Space.yf(8),
          ],

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Column(
              children: [
                /// Row 1
                Row(
                  children: [
                    Expanded(
                      child: _infoItem(
                        value: widget.propertyType,
                        label: "Specialties",
                      ),
                    ),
                    Space.xf(8),
                    Expanded(
                      child: _infoItem(
                        value: widget.licenseNumber,
                        label: "License Number",
                      ),
                    ),
                  ],
                ),
                Space.yf(8),

                /// Row 2
                Row(
                  children: [
                    Expanded(
                      child: _infoItem(
                        value: widget.recentSales,
                        label: "Recent Sales",
                      ),
                    ),
                    Space.xf(8),
                    Expanded(
                      child: _infoItem(
                        value: widget.averageRating,
                        label: "Average Rating",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            secondChild: const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _infoItem({
    required String value,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppText.l2b?.w(6),
        ),
        Space.yf(2),
        Text(
          label,
          style: AppText.l1?.w(4).cl(AppTheme.c.text.shade600!),
        ),
      ],
    );
  }
}