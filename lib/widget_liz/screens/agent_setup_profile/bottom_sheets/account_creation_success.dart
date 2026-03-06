part of '../agent_setup_profile.dart';

void showSetUpSuccessBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return Container(
        margin: Space.all(
          8,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 8.h),
        padding: Space.all(16).copyWith(top: 8.h),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Handle bar
            Center(
              child: Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppTheme.c.background.shade400,
                  borderRadius: BorderRadius.circular(32.r),
                ),
              ),
            ),

            Space.yf(20),

            /// Success Icon
            CircleIcon(iconPath: "assets/svgs/check.svg"),

            Space.yf(20),

            Text(
              " Account Created Successfully !",
              style: AppText.h5bm,
              textAlign: TextAlign.center,
            ),

            Space.yf(8),

            Text(
              "Now you can use your account freely and manage all the features.",
              style: AppText.b1bm?.cl(AppTheme.c.text.main!),
              textAlign: TextAlign.center,
            ),

            Space.yf(20),

            /// Done Button
            // AppButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //     AppRoutes.agentWelcome.push(context);
            //   },
            //   label: 'Done',
            // ),
          ],
        ),
      );
    },
  );
}
