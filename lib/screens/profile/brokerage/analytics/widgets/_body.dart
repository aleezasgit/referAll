part of '../analytics.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Analytics",
        type: AppBarType.withTextCenter,
      ),
      body: AppBackground(
        includeTopPadding: true,
        child: Column(
          children: [
            
            Space.yf(18),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

         

                    /// ---------------- ANALYTICS OVERVIEW ----------------
                    Container(
                      padding: Space.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.c.white,
                        borderRadius: UIProps.radiusL,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Analytics Overview', style: AppText.h5bm),

                          Space.yf(16),

                          Row(
                            children: [
                              Expanded(
                                child: buildAnalyticsCard(
                                  icon: 'assets/svg/star.svg',
                                  value: '4.5',
                                  title: 'Average Rating',
                                  showArrow: true,
                                ),
                              ),
                              Space.xf(4),
                              Expanded(
                                child: buildAnalyticsCard(
                                  icon: 'assets/svg/dollar.svg',
                                  value: '250',
                                  title: 'Total Sales',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Space.yf(6),

                    /// ---------------- REFERRAL OVERVIEW ----------------
                    Container(
                      padding: Space.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.c.white,
                        borderRadius: UIProps.radiusL,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Referral Overview', style: AppText.h5bm),

                          Space.yf(16),

                          Row(
                            children: [
                              Expanded(
                                child: buildPerforamanceContainer(
                                  'Referring Agents',
                                  '20',
                                  '+3.9',
                                ),
                              ),

                              Space.xf(4),

                              Expanded(
                                child: buildPerforamanceContainer(
                                  'Active Referrals',
                                  '25',
                                  '+4.3',
                                ),
                              ),

                              Space.xf(4),

                              Expanded(
                                child: buildPerforamanceContainer(
                                  'Closed Referrals',
                                  '8',
                                  '-9.4',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Space.yf(8),

                    /// FUTURE CHART
                    // ReferralChartContainer(),

                    Space.yf(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- ANALYTICS CARD ----------------
 Widget buildAnalyticsCard({
  required String icon,
  required String value,
  required String title,
  bool showArrow = false,
}) {
  return Container(
    padding: Space.all(12),
    decoration: BoxDecoration(
      color: AppTheme.c.background.main,
      borderRadius: UIProps.radiusM,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ICON
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.c.white,
          ),
          child: Center(
            child: SvgPicture.asset(icon, height: 16),
          ),
        ),

        Space.yf(12),

        /// VALUE
        Text(value, style: AppText.h4b),

        Space.yf(2),

        /// TITLE + ARROW
        Row(
          children: [
            Expanded(
              child: Text(title, style: AppText.l2),
            ),

            if (showArrow)
              SvgPicture.asset(
                'assets/svgs/arrow-right.svg',
                height: 14,
              ),
          ],
        ),
      ],
    ),
  );
}
  /// ---------------- PERFORMANCE CARD ----------------
  Widget buildPerforamanceContainer(
    String title,
    String value,
    String stats, {
    Color? backgroundColor,
    Color? chipBgColor,
  }) {
    final bool isPositive = stats.trim().startsWith('+');

    return Container(
      padding: Space.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.c.background.main,
        borderRadius: UIProps.radiusM,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppText.h5b?.w(7)),

          Space.yf(4),

          Text(title, style: AppText.l2bm!.cl(AppTheme.c.text.main!)),

          Space.yf(35),

          Container(
            padding: Space.all(8, 4),
            decoration: BoxDecoration(
              borderRadius: UIProps.radiusXL,
              color: chipBgColor ?? AppTheme.c.white,
            ),
            child: Text(
              "$stats%",
              style: AppText.l2b!.w(6).copyWith(
                    color: isPositive
                        ? AppTheme.c.accent.green
                        : AppTheme.c.error.shade800,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}