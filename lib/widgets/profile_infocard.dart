import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class ProfileInfoExpandableCard extends StatefulWidget {
  final String email;
  final String phone;
  final String experience;
  final String address;

  const ProfileInfoExpandableCard({
    super.key,
    required this.email,
    required this.phone,
    required this.experience,
    required this.address,
  });

  @override
  State<ProfileInfoExpandableCard> createState() =>
      _ProfileInfoExpandableCardState();
}

class _ProfileInfoExpandableCardState
    extends State<ProfileInfoExpandableCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16,12),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          /// 🔹 Header Row
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
                    "Profile Info",
                    style: AppText.b1b?.w(6),
                  ),
                ),

                /// Arrow SVG
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

          /// Divider
          if (isExpanded) ...[
            Space.yf(12),
            Divider(
              color: AppTheme.c.lightGrey.shade400,
              thickness: 1,
            ),
            Space.yf(8),
          ],

          /// 🔹 Expandable Content
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Column(
              children: [

                /// Row 1
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _infoItem(
                        value: widget.email,
                        label: "Email Address",
                      ),
                    ),
                   Space.xf(8),
                    Expanded(
                      child: _infoItem(
                        value: widget.phone,
                        label: "Phone Number",
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
                        value: widget.experience,
                        label: "Years of Experience",
                      ),
                    ),
                    Space.xf(8),
                    Expanded(
                      child: _infoItem(
                        value: widget.address,
                        label: "Address",
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

  /// 🔹 Reusable Info Item
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