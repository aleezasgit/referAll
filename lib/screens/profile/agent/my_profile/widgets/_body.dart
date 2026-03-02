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
      body: AppBackground(
        includeTopPadding: true,
        child: Column(
              children: [

          

                Space.yf(20),

                /// Profile Card
                buildProfileCard(context),

                Space.yf(6),

                /// Tiles
                _ProfileTile(
                  title: "Profile Info",
                  iconPath: "assets/svgs/user.svg",
                ),

                Space.yf(6),

                _ProfileTile(
                  title: "Payment Plan",
                  iconPath: "assets/svgs/crown-2 (1).svg",
                ),

                Space.yf(6),

                _ProfileTile(
                  title: "Notifications",
                  iconPath: "assets/svgs/notification.svg",
                  notificationCount: 10,
                ),

                Space.yf(6),

                _ProfileTile(
                  title: "Contact Us",
                  iconPath: "assets/svgs/notification.svg",
                ),

                const Spacer(),

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
            // logout logic here
          },
          buttonType: ButtonType.primaryWithIconLeft,
          iconPath: "assets/svgs/logout.svg", // your svg
          backgroundColor: AppTheme.c.accent.red,
        
     
        ),

                Space.yf(10),
              ],
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

    return Container(
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
        ],
      ),
    );
  }



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
        color: AppTheme.c.background.main,
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
                  backgroundColor: AppTheme.c.background.main,
               
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
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

   
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
                    backgroundColor: AppTheme.c.background.main,
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