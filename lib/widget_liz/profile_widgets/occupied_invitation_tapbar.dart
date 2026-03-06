import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/profile_widgets/invitation_list.dart';
import 'package:pract/widget_liz/profile_widgets/occupied_1.dart';
import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:pract/widgets/core/tab_bar/switch_tab_bar.dart';

class SeatsScreen extends StatefulWidget {
  const SeatsScreen({super.key});

  @override
  State<SeatsScreen> createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  int selectedIndex = 0;

  /// Track if "View Invitations" was clicked
  bool showOccupiedAlternative = false;

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;

      if (index != 0) {
        showOccupiedAlternative = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Seats",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Space.yf(16),
        
              SwitchTabBar(
                options: const ['Occupied', 'Invitations'],
                tabs: [
                  buildOccupiedList(context),
                  buildInvitationsList(context),
                ],
                initialValue: selectedIndex == 0 ? 'Occupied' : 'Invitations',
                onIndexChanged: (index) {
                  changeTab(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= OCCUPIED TAB =================
  Widget buildOccupiedList(BuildContext context) {
    return Column(
      children: [
        Space.yf(16),

        showOccupiedAlternative
            ? buildBrokerDetail(context)
            : EmptyInvitationCard(
                onViewInvitations: () {
                  setState(() {
                    showOccupiedAlternative = true;
                  });
                },
              ),
      ],
    );
  }

  /// ================= INVITATIONS TAB =================
  Widget buildInvitationsList(BuildContext context) {
    return Column(
      children: [
        Space.yf(16),
        InvitationList(),
      ],
    );
  }

  /// ================= VIEW2 CONTENT =================
  Widget buildBrokerDetail(BuildContext context) {
    return Column(
      children: [

        /// ================= PROFILE CONTAINER =================
        Container(
          width: double.infinity,
          padding: Space.all(16),
          decoration: BoxDecoration(
            color: AppTheme.c.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: const AssetImage("assets/pngs/OB_3.png"),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 3,
                    child: Container(
                      height: 15.h,
                      width: 15.w,
                      decoration: BoxDecoration(
                        color: AppTheme.c.secondary.main,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),

              Space.yf(12),

              Text(
                "Shaveya Malik",
                style: AppText.h5bm,
              ),

              Space.yf(8),

              Text(
                "Wellness enthusiast 💪 Lover of clean living, mindful habits, and healthy vibes ✨🥗🧘",
                style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        /// SPACE BETWEEN CONTAINERS
        Space.yf(8),

        /// ================= BROKER DETAILS CONTAINER =================
        Container(
          width: double.infinity,
          padding: Space.all(16),
          decoration: BoxDecoration(
            color: AppTheme.c.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE ROW
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/seat_logo.svg",
                    width: 37.w,
                    height: 37.h,
                  ),
                  Space.xf(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Broker Details",
                        style: AppText.b1b?.w(6),
                      ),
                      Text(
                        "Seat 2",
                        style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                      ),
                    ],
                  )
                ],
              ),

              Space.yf(10),

              Container(
                width: double.infinity,
                height: 1.h,
                decoration: BoxDecoration(
                  color: AppTheme.c.text.main!,
                ),
              ),

              Space.yf(10),

              /// EMAIL + PHONE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("sarah.thompson@gmail.com",
                          style: AppText.l1bm?.w(6)),
                      Space.yf(2),
                      Text(
                        "Email Address",
                        style: AppText.b2?.cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("+1 (415) 555-7821", style: AppText.l1bm?.w(6)),
                      Space.yf(2),
                      Text(
                        "Phone Number",
                        style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                      ),
                    ],
                  )
                ],
              ),

              Space.yf(8),

              /// TOTAL AGENTS + ADDRESS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("15", style: AppText.l1bm?.w(6)),
                      Space.yf(2),
                      Text(
                        "Total Agents",
                        style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Sans Fransisco, CA",
                          style: AppText.l1bm?.w(6)),
                      Space.yf(2),
                      Text(
                        "Address",
                        style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                      ),
                    ],
                  )
                ],
              ),

              Space.yf(8),

              /// LICENSE + WEBSITE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("EL3434", style: AppText.l1bm?.w(6)),
                      Space.yf(2),
                      Text(
                        "License #",
                        style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "www.xyz.com",
                          style: AppText.l1bm
                              ?.w(6)
                              .cl(AppTheme.c.primary.main!)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                      Space.yf(2),
                      Text(
                        "Website",
                        style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}