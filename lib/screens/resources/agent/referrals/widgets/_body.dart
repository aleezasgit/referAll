part of '../referrals.dart';






class _Body extends StatelessWidget {
  const _Body();
  
 // get _ScreenState => null;

  @override
  Widget build(BuildContext context) {
   // _ScreenState.s(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.c.background.main,

      appBar: const CustomAppBar(
        type: AppBarType.withTextCenter,
        title: "Referrals",
      //   itemColor: Colors.white, // because image background
      //   iconColor: Colors.white,
      //
       ),

      body: Column(
        children: [

          /// 🔹 Top Image Section
          SizedBox(
            height: 209.h,
            width: double.infinity,
            child: Image.asset(
              "assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png", 
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Body Section
          Expanded(
            child: Container(
              width: double.infinity,
              padding: Space.all(16,24),
              decoration: BoxDecoration(
                color: AppTheme.c.background.main,
              
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Logo + Time
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/logoo.svg",
                          height: 20.h,
                          width: 20.w,
                        ),
                        Space.xf(8),
                        Text(
                          "2 min ago",
                          style: AppText.l1bm!
                              .cl(AppTheme.c.text.main!),
                        ),
                        const Spacer(),
                        SvgPicture.asset("assets/svgs/dots-vertical.svg",
                        height: 16.h,
                        width: 16.w,),
                      ],
                    ),

                    Space.yf(8),

                    /// Title
                    Text(
                      "How to market yourself to get more referrals on this platform?",
                      style: AppText.h5b,
                    ),


                    Space.yf(24),

                    /// Description Paragraph
                    Text(
                      "The next surge in the real estate market might not occur until late 2024 or early 2025, according to a co-founder of a prominent real estate firm.",
                      style: AppText.b1bm?.cl(AppTheme.c.text.main!)
                    ),

                    Space.yf(12),

                    Text(
                      "Other real estate analysts have suggested that market fluctuations are becoming less impactful on property values, mainly because a significant portion of available properties has already been sold.",
                      style: AppText.b1bm?.cl(AppTheme.c.text.main!)
                    ),

                    Space.yf(24),

                   
                    Text(
                      "Attached Media",
                      style: AppText.h5b?.w(7),
                    ),

                    Space.yf(12),

                   
                    buildAttachedMediaTile(context),
           
                  
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildAttachedMediaTile(BuildContext context) {
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    AttachedMediaTile(
      title: "How to market yourself to get more referrals?",
      type: "mp4",
      leadingSvg: "assets/svgs/video-circle.svg",
      trailingSvg: "assets/svgs/arrow.svg",
    ),
    Space.yf(8),
    AttachedMediaTile(
      title: "How to market yourself to get more ReferALL?",
      type: "PDF",
      leadingSvg: "assets/svgs/document-text.svg",
      trailingSvg: "assets/svgs/arrow.svg",
    ),

  ],
);
  }
