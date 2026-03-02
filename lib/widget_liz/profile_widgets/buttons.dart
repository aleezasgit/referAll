import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/profile_widgets/bottom_sheets/delete_bottom_sheet.dart';
import 'package:pract/widget_liz/profile_widgets/bottom_sheets/logout_bottom_sheet.dart';
import 'package:pract/widget_liz/profile_widgets/bottom_sheets/susbcription_bottom_sheet.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

class AccountActionsSection extends StatelessWidget {
  const AccountActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      children: [

        /// Delete Account Button
        AppButton(
          label: "Delete Account",
          onPressed: () {
            DeleteAccountBottomSheet.show(
              context,
              onCancel: () => Navigator.pop(context),
              onDelete: () {
                Navigator.pop(context);
                // delete logic here
              },
            );
          },
          buttonType: ButtonType.outlinedWithIconLeft,
          iconPath: "assets/svgs/logout.svg", 
          iconColor: AppTheme.c.text.main,
          borderColor: AppTheme.c.primary.main,
          backgroundColor: AppTheme.c.white,
          height: 56.h,
        ),

        Space.yf(16),

        /// Logout Button
        AppButton(
          label: "Logout",
          onPressed: () {
        
                  LogoutBottomSheet.show(
              context,
              onCancel: () => Navigator.pop(context),
              onDelete: () {
                Navigator.pop(context);
              },
                  );
            // logout logic here
          },
          buttonType: ButtonType.primaryWithIconLeft,
          iconPath: "assets/svgs/logout.svg", // your svg
          backgroundColor: AppTheme.c.error.main,
          iconColor: AppTheme.c.white,
          height: 56.h,
        ),

        AppButton(
          label: "Subscription",
          onPressed: () {
           SusbcriptionBottomSheet.show(
              context,
              onCancel: () => Navigator.pop(context),
              onDelete: () {
                Navigator.pop(context);
                // delete logic here
              },
            );
          },
          buttonType: ButtonType.outlinedWithIconLeft,
          iconPath: "assets/svgs/logout.svg", 
          iconColor: AppTheme.c.text.main,
          borderColor: AppTheme.c.primary.main,
          backgroundColor: AppTheme.c.white,
          height: 56.h,
        ),

      ],
    );
  }
}