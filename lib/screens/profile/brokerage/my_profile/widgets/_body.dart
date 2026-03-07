part of '../my_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "My Profile",
        type: AppBarType.withTextCenter,
      ),
      body: SingleChildScrollView(
        child: AppBackground(
          includeTopPadding: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Space.yf(20),

              /// Profile Card
              buildProfileCard(context),

              Space.yf(6),

              /// Tiles
              _ProfileTile(
                title: "Profile Info",
                iconPath: "assets/svgs/user.svg",
                onTap: () {
                  AppRoutes.profileInfo.push(context);
                },
              ),

              Space.yf(6),

              _ProfileTile(
                title: "Payment Plan",
                iconPath: "assets/svgs/crown-2 (1).svg",
                onTap: () {
                  print("Payment Plan Tapped");
                },
              ),

              Space.yf(6),

              _ProfileTile(
                title: "Notifications",
                iconPath: "assets/svgs/notification.svg",
                notificationCount: 10,
                onTap: () {
                  AppRoutes.NotificationScreen.push(context);
                },
              ),

              Space.yf(6),

              _ProfileTile(
                title: "Contact Us",
                iconPath: "assets/svgs/notification.svg",
                onTap: () {
                  AppRoutes.contactUs.push(context);
                },
              ),

              Space.yf(27), 

              /// Delete Button
              AppButton(
                label: "Delete Account",
                onPressed: () {
                  DeleteAccountBottomSheet.show(
                    context,
                    onCancel: () => Navigator.pop(context),
                    onDelete: () {
                      Navigator.pop(context);
                    },
                  );
                },
                buttonType: ButtonType.outlinedWithIconLeft,
                iconPath: "assets/svgs/trashblack.svg",
                borderColor: AppTheme.c.secondary.main,
                backgroundColor: AppTheme.c.background.main,
              ),

              Space.yf(12),

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
                },
                buttonType: ButtonType.primaryWithIconLeft,
                iconPath: "assets/svgs/logout.svg",
                backgroundColor: AppTheme.c.accent.red,
              ),

              Space.yf(20), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}


class _ProfileTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final int? notificationCount;
  final VoidCallback? onTap;

  const _ProfileTile({
    required this.title,
    required this.iconPath,
    this.notificationCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNotification =
        notificationCount != null && notificationCount! > 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(16,12),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
      
            /// Left Icon
            SvgPicture.asset(
              iconPath,
              height: 16.h,
              width: 16.w,
            ),
      
            Space.xf(12),
      
            /// Title
            Expanded(
              child: Text(
                title,
                style: AppText.b1b?.w(6),
              ),
            ),
      
            /// Notification Badge (Only if exists)
            if (isNotification)
              Container(
                padding: Space.all(8,4),
            
                decoration: BoxDecoration(
                  color: AppTheme.c.accent.red,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Text(
                  "${notificationCount}+",
                  style: AppText.l2b?.w(6).cl(AppTheme.c.white!),
                ),
              ),
      
            Space.xf(10),
      
            /// Arrow Icon
            SvgPicture.asset(
              "assets/svgs/Frame 2147229042.svg",
              height: 18.h,
              width: 18.w,
            ),
          ],
        ),
      ),
    );
  }
}



  Widget buildProfileCard(BuildContext context) {
    return Container(
     
      width: double.infinity,
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [

          /// Profile Image with Status Dot
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                
                radius: 40.r,
                backgroundImage: AssetImage("assets/pngs/OB_3.png"),
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
            "user123@gmail.com",
            style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
          ),
          Space.yf(8),

          Row(
  children: [

    SeatActionCard(
      title: "Manage Your Seat",
      iconPath: "assets/svgs/3dcube.svg",
      onTap: () {
        AppRoutes.manageStateScreen.push(context);
      },
    ),

    Space.xf(6),

    SeatActionCard(
      title: "Analytics",
      iconPath: "assets/svgs/chart.svg",
      onTap: () {
           AppRoutes.banalyticsScreen.push(context);
      },
    ),

  ],
)
        ],
      ),
    );
  }




class SeatActionCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const SeatActionCard({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: Space.all(12),
          decoration: BoxDecoration(
            color: AppTheme.c.background.main,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [

              /// ICON CIRCLE
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.c.white,
                  border: Border.all(
                    color: AppTheme.c.lightGrey.main!,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),

              Space.yf(16),

              /// TITLE
              Text(
                title,
                style: AppText.l1b?.w(6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}