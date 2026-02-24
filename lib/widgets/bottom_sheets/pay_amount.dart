import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';

void showPayAmountBottomSheet(
  BuildContext context, {
  required VoidCallback onPay,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: AppTheme.c.background.main,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.r),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 16.h,
        ),
        child: Container(
          padding: Space.all(16),
          decoration: BoxDecoration(
            color: AppTheme.c.background.main,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Handle bar
              Center(
                child: Container(
                  width: 48.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.background.shade400,
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(width: 1),
                  ),
                ),
              ),

              Space.yf(20),

              /// Title
              Center(
                child: Text(
                  "Pay Amount",
                  style: AppText.h5bm,
                ),
              ),

              Space.yf(20),

              /// Account Info
              _infoCard(
                title: "Account Info",
                subtitle: "Card Details - 33100-56959595-454",
              ),

              Space.yf(8),

              /// Plan Details
              Container(
                padding: Space.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.c.white,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Plan Details",
                      style: AppText.h5bm?.w(5),
                    ),
                    Space.yf(4),
                    Text(
                      "Platinum Plan",
                      style: AppText.l1bm?.w(5),
                    ),

                    Space.yf(8),

                    /// Gradient Plan Container
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
                                  style: AppText.l1?.w(4).cl(
                                    AppTheme.c.text.main!,
                                  ),
                                ),
                                Space.yf(4),
                                Text(
                                  "\$50.00/month",
                                  style: AppText.b1b?.w(6),
                                ),
                                Space.yf(4),
                                Text(
                                  "20 Referral Agent Seats",
                                  style: AppText.l1?.w(4).cl(
                                    AppTheme.c.text.main!,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: Space.all(8,1),
                            
                            decoration: BoxDecoration(
                              color: AppTheme.c.secondary.shade300,
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Premium",
                              style: AppText.l1bm?.cl(
                                AppTheme.c.secondary.shade800!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Space.yf(20),

              /// Pay Button
              GestureDetector(
                onTap: onPay,
                child: Container(
                 // padding: Space.all(129,16),
                 height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                  
                      
                       color:  AppTheme.c.primary.main!,
                        
                      
                    ),
                  
                  child: Center(
                    child: Text(
                      "Pay \$50.00",
                      style: AppText.h5b?.w(7).cl(AppTheme.c.white!),
                    ),
                  ),
                )
                ),
              
            ],
          ),
        ),
      );
    },
  );
}

Widget _infoCard({
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: Space.all(12),
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppTheme.c.white,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppText.h5bm?.w(5),
        ),
        Space.yf(4),
        Text(
          subtitle,
          style: AppText.l1bm?.cl(AppTheme.c.text.main!),
        ),
      ],
    ),
  );
}