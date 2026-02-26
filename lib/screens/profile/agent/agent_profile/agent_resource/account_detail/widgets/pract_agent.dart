import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/resources_stuff/attatched_madia_card.dart';
import 'package:pract/widget_liz/resources_stuff/marketing_assets.dart';


class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.c.background.main,
      appBar: AppBar(
        title: Text("Article Details"),
        //isTransparent: true, // if you added this property
      ),
      body: Column(
        children: [

          /// 🔹 Top Image
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: Image.asset(
              "assets/pngs/OB_1.png", // change to your image
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Content Section
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppTheme.c.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Author + Time Row
                    Row(
                      children: [
                        Container(
                          height: 32.h,
                          width: 32.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppTheme.c.primary.main,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "R",
                            style: AppText.b1?.copyWith(
                              color: AppTheme.c.white,
                            ),
                          ),
                        ),
                        Space.xf(8),
                        Text(
                          "2 min ago",
                          style: AppText.b2?.copyWith(
                            color: AppTheme.c.text.main,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.more_horiz,
                            color: AppTheme.c.text.main),
                      ],
                    ),

                    Space.yf(16),

                    /// Title
                    Text(
                      "Innovations in Business: The Future of Commerce",
                      style: AppText.h3?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Space.yf(8),

                    /// Category
                    Text(
                      "Single Family",
                      style: AppText.b2?.copyWith(
                        color: AppTheme.c.primary.main,
                      ),
                    ),

                    Space.yf(16),

                    /// Description
                    Text(
                      "The next surge in the real estate market might not occur until late 2024 or early 2025, according to a co-founder of a prominent real estate firm.\n\n"
                      "Other real estate analysts have suggested that market fluctuations are becoming less impactful on property values, mainly because a significant portion of available properties has already been sold.",
                      style: AppText.b2?.copyWith(
                        color: AppTheme.c.text.main,
                        height: 1.6,
                      ),
                    ),

                    Space.yf(24),

                    /// Attached Media Title
                    Text(
                      "Attached Media",
                      style: AppText.b1bm,
                    ),

                    Space.yf(16),

                    /// 🔹 Call Your Existing Tiles
                   AttatchedMadiaCard(),
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