import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final String description;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<ExpandableCard> createState() =>
      _CustomExpandableCardState();
}

class _CustomExpandableCardState
    extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: Space.all(12),
      decoration: BoxDecoration(
        color: AppTheme.c.white, 
        borderRadius: BorderRadius.circular(16),
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
            borderRadius: BorderRadius.circular(16),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                
                Expanded(
                  
                  child: Text(
                    widget.title,
                    style: AppText.b1b?.w(6)
                  ),
                ),

                
                AnimatedRotation(
                  turns: isExpanded ? 0.0 : 0.25,
                  duration:
                      Duration(milliseconds: 250),
                  child: SvgPicture.asset(
                    "assets/svgs/arrow-right.svg",
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
          ),

         
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
           Space.yf(12),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: AppTheme.c.lightGrey.shade400,
                  ),
                ),
               Space.yf(12),

                /// 🔹 Description
                Text(
                  widget.description,
                  style: AppText.l1?.w(4).cl(AppTheme.c.text.main!)
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableCardFaqList extends StatelessWidget {
  ExpandableCardFaqList({super.key});

  /// 🔹 Dummy Data
  final List<Map<String, String>> faqList = [
    {
      "title": "What is Pract?",
      "description":
          "Pract is a learning platform that helps users improve their skills through guided practice."
    },
    {
      "title": "How does it work?",
      "description":
          "You can enroll in sessions, track progress, and get personalized recommendations."
    },
    {
      "title": "Is it free?",
      "description":
          "Some features are free while premium content requires subscription."
    },
    {
      "title": "Can I cancel anytime?",
      "description":
          "Yes, you can cancel your subscription anytime from settings."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust based on your UI
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: faqList.length,
        separatorBuilder: (context, index) =>
            Space.yf(6),
        itemBuilder: (context, index) {
          final item = faqList[index];

          return SizedBox(
            width: 250, // card width
            child: ExpandableCard(
              title: item["title"]!,
              description: item["description"]!,
            ),
          );
        },
      ),
    );
  }
}