part of '../notification.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "Notification",
      ),

      body: SingleChildScrollView(
        padding: Space.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 16.h,
        ),
        child: FormBuilder(
          key: state.formKey,
          initialValue: _FormData.initialValues(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

           
             buildNotification(context),

             Space.yf(12),

         

            ],
          ),
        ),
      ),
    );
  }
}





  
  Widget buildNotification(BuildContext context) {
    App.init(context);
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// ----------------
          /// TODAY
          /// ----------------
         Text(
            "Today",
            style: AppText.h5bm,
          ),
          Space.yf(12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return NotificationTile(
                isInvitation: index == 2,
              );
            },
          ),

     Space.yf(12),

          /// ----------------
          /// YESTERDAY
          /// ----------------
          Text(
            "Yesterday",
            style:AppText.h5bm
          ),

       Space.yf(12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return NotificationTile(
                isInvitation: index == 2,
              );
            },
          ),
        ],
      ),
    );
  }




