import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/faqs_expanded.dart';
import 'package:pract/widget_liz/resources_stuff/announcement_tile_list.dart';

class AnnouncementFaqTabBar extends StatefulWidget {
  const AnnouncementFaqTabBar({super.key});

  @override
  State<AnnouncementFaqTabBar> createState() =>
      _AnnouncementFaqTabBar();
}

class _AnnouncementFaqTabBar
    extends State<AnnouncementFaqTabBar> {
  int selectedIndex = 0; // 0 = Announcements, 1 = FAQs

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// ----------------------
        /// CUSTOM TAB BAR
        /// ----------------------
        Container(
          padding: Space.all(4),
          decoration: BoxDecoration(
            color: AppTheme.c.white,
            borderRadius: BorderRadius.circular(48),
          ),
          child: Row(
            children: [

              /// Announcements Tab
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    padding: Space.vf(10),
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? AppTheme.c.black
                          : AppTheme.c.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Announcements",
                      style: AppText.l1b?.w(6).cl(
                        selectedIndex == 0
                            ? AppTheme.c.white!
                            : AppTheme.c.text.main!,
                      ),
                    ),
                  ),
                ),
              ),

              /// FAQs Tab
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                   padding: Space.vf(10),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? AppTheme.c.black
                          : AppTheme.c.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "FAQs",
                      style: AppText.l1b?.w(6).cl(
                        selectedIndex == 1
                            ? AppTheme.c.white!
                            : AppTheme.c.text.main!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      Space.yf(16),

        /// ----------------------
        /// CONTENT SWITCHING
        /// ----------------------
        if (selectedIndex == 0)
          AnnouncementList()
        else
         ExpandableCardFaqList(),
          
      ],
    );
  }
}