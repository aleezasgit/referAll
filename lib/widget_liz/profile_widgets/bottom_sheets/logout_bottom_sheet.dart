import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

class LogoutBottomSheet extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const LogoutBottomSheet({
    super.key,
    required this.onCancel,
    required this.onDelete,
  });

  static void show(
    BuildContext context, {
    required VoidCallback onCancel,
    required VoidCallback onDelete,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => LogoutBottomSheet(
        onCancel: onCancel,
        onDelete: onDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      margin: Space.all(8),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// -------- TOP CONTENT (16 padding) --------
          Padding(
            padding: Space.hf(16),
            child: Column(
              children: [

                /// Drag Indicator
                Container(
                  width: 48.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.lightGrey.main,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),

                Space.yf(20),

                /// Icon
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.c.accent.red,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svgs/logout.svg",
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),

                Space.yf(20),

                /// Title
                Text(
                  "Do you really want to Logout?",
                  textAlign: TextAlign.center,
                  style: AppText.h5bm,
                ),

                Space.yf(8),

                /// Subtitle
                Text(
                  "You will loose the agent details and all the active Referrals by the agent.",
                  textAlign: TextAlign.center,
                  style: AppText.b1bm?.cl(AppTheme.c.text.main!),
                ),

                Space.yf(20),
              ],
            ),
          ),

          /// -------- BUTTON ROW (4 horizontal padding) --------
          Padding(
            padding: Space.hf(4),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: "Cancel",
                    onPressed: onCancel,
                    buttonType: ButtonType.outlined,
                    borderColor: AppTheme.c.secondary.shade500,
                    backgroundColor: AppTheme.c.white,
                  ),
                ),

                Space.xf(10),

                Expanded(
                  child: AppButton(
                    label: "Yes, Logout",
                    onPressed: onDelete,
                    backgroundColor: AppTheme.c.accent.red,
                  ),
                ),
              ],
            ),
          ),

          Space.yf(16),
        ],
      ),
    );
  }
}