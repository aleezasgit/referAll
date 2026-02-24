import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomExpandableCard extends StatefulWidget {
  final String title;
  final String description;

  const CustomExpandableCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<CustomExpandableCard> createState() =>
      _CustomExpandableCardState();
}

class _CustomExpandableCardState
    extends State<CustomExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2), // light grey background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 Header Row
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                ///  SVG Arrow
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0.0,
                  duration:
                      const Duration(milliseconds: 250),
                  child: SvgPicture.asset(
                    "assets/images/arrow-right.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),

          ///  Divider
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(),
            secondChild: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Divider(thickness: 1),
                const SizedBox(height: 12),

                /// Description
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
