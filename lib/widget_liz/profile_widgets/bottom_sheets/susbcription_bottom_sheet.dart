
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

class SusbcriptionBottomSheet extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const SusbcriptionBottomSheet({
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
      builder: (_) => SusbcriptionBottomSheet(
        onCancel: onCancel,
        onDelete: onDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
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
                      "assets/svgs/crown.svg",
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),

                Space.yf(20),

                /// Title
                Text(
                  "Do you really want to cancel subscription ?",
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

//container
Space.yf(20),
          Padding(

            padding:Space.hf(16),
            child: Container(
              padding:Space.all(16),
              decoration: BoxDecoration(
                color: AppTheme.c.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Left Side
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Text(
              "Gold Plan",
              style: AppText.l1?.w(4).cl(AppTheme.c.text.main!)
            ),
            Space.yf(4),
             Row(
               children: [
                 Text(
                  "\$30.00/month",
                  style:
                  AppText.h5b?.w(7)
                             ),
               ],
             ),
                  Space.yf(4),
            Text(
              "15 Referrals",
              style:  AppText.l1?.w(6).cl(AppTheme.c.text.main!)
                     
            ),
                    ],
                  ),
            
                  const Spacer(),
            
                  /// Active Badge
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Container(
                        
                        padding: Space.all(8,1),
                        
                        decoration: BoxDecoration(
                                  color: AppTheme.c.primary.main,
                                  borderRadius: BorderRadius.circular(16.r),
                        ),
                        child:  Text(
                                  "Active",
                                  style: AppText.l1bm?.cl(AppTheme.c.white!)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
Space.yf(20),

          /// -------- BUTTON ROW (4 horizontal padding) --------
          Padding(
            padding: Space.hf(4),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: "No",
                    onPressed: onCancel,
                    buttonType: ButtonType.outlined,
                    borderColor: AppTheme.c.secondary.shade500,
                    backgroundColor: AppTheme.c.background.main,
                  ),
                ),

                Space.xf(10),

                Expanded(
                  child: AppButton(
                    label: "Yes, cancel",
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