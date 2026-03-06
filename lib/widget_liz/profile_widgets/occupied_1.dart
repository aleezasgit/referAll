import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

/// =================================
/// EMPTY INVITATION CARD
/// =================================
class EmptyInvitationCard extends StatelessWidget {
  final VoidCallback onViewInvitations;

  const EmptyInvitationCard({
    super.key,
    required this.onViewInvitations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Space.only(top: 32, bottom: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// ICON
          Center(
            child: SvgPicture.asset(
              "assets/svgs/occupied_logo.svg", // change to your svg
              height: 40.h,
              width: 40.w,
            ),
          ),

          Space.yf(26),

          /// TITLE
          Text(
            "No Occupied Seat Yet !",
            textAlign: TextAlign.center,
            style: AppText.h5b?.w(5),
          ),

          Space.yf(8),

          /// DESCRIPTION
          Text(
            "Please check the invitation tab to see\ninvitations from the brokers",
            textAlign: TextAlign.center,
            style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
          ),

          Space.yf(16),

          /// BUTTON
       SizedBox(
  width: 107.w,
  child: AppButton(
    label: "View Invitations",
    onPressed: onViewInvitations,
    backgroundColor: AppTheme.c.secondary.main,
    textColor: AppTheme.c.black,
  ),
)
        ]
      ),
    );
  }
}