import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const DeleteAccountBottomSheet({
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
      builder: (_) => DeleteAccountBottomSheet(
        onCancel: onCancel,
        onDelete: onDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      //height: 259.h,
      padding: Space.all(16),
    //     bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
    //     top: 24.h,
    //  ),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(20.r)
         
        ),
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Top Drag Indicator
          Container(
            width: 48.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppTheme.c.lightGrey.main,
              borderRadius: BorderRadius.circular(32.r),
            ),
          ),

          Space.yf(20),

          /// Delete Icon in Container
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.c.accent.red,
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/svgs/trash.svg", // your delete icon
                height: 24.h,
                width: 24.w,
              
              ),
            ),
          ),

          Space.yf(20),

          /// Title
          Text(
            "Do you really want to Delete Account?",
            textAlign: TextAlign.center,
            style: AppText.h5bm,
          ),

          Space.yf(8),

          /// Subtitle
          Text(
            "You will loose the agent details and all the active Referrals by the agent.You will loose the agent details and all the active Referrals by the agent.",
            textAlign: TextAlign.center,
            style: AppText.b1bm?.cl(AppTheme.c.text.main!),
          ),

          Space.yf(20),

          /// Buttons Row
          Row(
            children: [
              /// Cancel Button
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

              /// Delete Button
              Expanded(
                child: AppButton(
                  label: "Yes, Delete",
                  onPressed: onDelete,
                  backgroundColor: AppTheme.c.accent.red,
                ),
              ),
            ],
          ),

         
        ],
      ),
    );
  }
}