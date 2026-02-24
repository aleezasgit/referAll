import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';

void showPlanSuccessBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: AppTheme.c.background.main,
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 16.h,
        ),
        child: Container(
          padding: Space.all(16),
          decoration: BoxDecoration(
            color: AppTheme.c.background.main,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
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
                    color: AppTheme.c.background.shade400 ??
                        AppTheme.c.background.main,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
              ),

              Space.yf(20),

              /// Success Icon
              Container(
               // padding: Space.all(13), 
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.c.secondary.main,
                ),
                child: Center(
                  child: Container(
                   // padding: Space.all(13),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: AppTheme.c.secondary.shade600!),
                      shape: BoxShape.circle,
                      color: AppTheme.c.white,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svgs/material-symbols_check.svg",
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
              ),

              Space.yf(24),

              Text(
                "Plan Subscribed Successfully",
                style: AppText.h5bm,
                textAlign: TextAlign.center,
              ),

              Space.yf(8),

              Text(
                "You can view your subscribed plan in settings and can change there",
                style: AppText.b1bm?.cl(
                  AppTheme.c.text.main ?? Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              Space.yf(24),

              /// Plan Card
              Container(
                padding: Space.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppTheme.c.secondary.shade600!,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppTheme.c.secondary.shade200!,
                    AppTheme.c.white!,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Platinum Plan",
                            style: AppText.l1
                                ?.w(4)
      
                          ),
                          Space.yf(4),
                          Text(
                            "\$50.00/month",
                            style: AppText.b1b,
                          ),
                          Space.yf(4),
                          Text(
                            "20 Referral Agent Seats",
                            style: AppText.l1
                                ?.w(4)
                                
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: Space.all(8, 1),
                      decoration: BoxDecoration(
                        color: AppTheme.c.secondary.shade300,
                           
                        borderRadius:
                            BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Subscribe",
                        style: AppText.l1bm?.cl(
                          AppTheme.c.secondary.shade800!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Space.yf(20),

              /// Done Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: AppTheme.c.primary.main,
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: AppText.h5b?.w(7).cl(AppTheme.c.white!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}