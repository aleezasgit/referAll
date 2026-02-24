import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';

class AgentMarketingExpandableCard extends StatefulWidget {
  final List<String> images;

  const AgentMarketingExpandableCard({
    super.key,
    required this.images,
  });

  @override
  State<AgentMarketingExpandableCard> createState() =>
      _AgentMarketingExpandableCardState();
}

class _AgentMarketingExpandableCardState
    extends State<AgentMarketingExpandableCard>
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
                    "Agent's Marketing Material",
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
            Space.yf(8),
            
          ],

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.images.length,
                separatorBuilder: (_, __) => Space.xf(4),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.images[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            secondChild: const SizedBox(),
          ),
        ],
      ),
    );
  }
}