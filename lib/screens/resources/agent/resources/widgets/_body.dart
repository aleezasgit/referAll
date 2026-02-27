part of '../resources.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);
    final state = _ScreenState.s(context, true);

    return Scaffold(
      body: AppBackground(
        horizontalPadding: 0,
        includeTopPadding: true,
        child: Column(
          children: [
            UserHeader(),
            Space.yf(36),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      padding: Space.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Updates",
                            style: AppText.h5b?.w(7),
                          ),
                          _badge("10+ Articles"),
                        ],
                      ),
                    ),

                   Space.yf(16),

                    NewUpdatesHorizontalList(),

                  Space.yf(24),

                    
                    Container(  padding: Space.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Marketing Assets",
                            style: AppText.h5b?.w(7),
                          ),
                          _badge("10+ Updates"),
                        ],
                      ),
                    ),

                    Space.yf(16),

                    Container(
                        padding: Space.all(16),
                        child: MarketingAssets()),

                    Space.yf(24),

                    /// =========================
                    /// Other Resources
                    /// =========================
                    Container(
                        padding: Space.all(16),
                      child: Text(
                        "Other Resources",
                        style: AppText.h5b?.w(7),
                      ),
                    ),

                    Space.yf(12),

                    Container(
                        padding: Space.all(16),
                        
                        child:SwitchTabBar(options: ['Announcements', 'FAQs'],
                        tabs: 
                        [
                        buildAnnouncementList(context),
                        buildFaqList(context),],
                        initialValue: state.selectedIndex == 0? 'Announcements': 'FAQs',
                        onIndexChanged: (index) {state.changeTab(index);},),
                    ),
             
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// =========================
  /// Small Red Badge
  /// =========================
  Widget _badge(String text) {
    return Container(
      padding: Space.all(8,4),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppText.l2b?.w(6).cl(AppTheme.c.accent.red!)
     
        
      ),
    );
  }
}

Widget buildAnnouncementList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      //padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: Announcements.length,
      separatorBuilder: (_, __) => Space.yf(6),
      itemBuilder: (context, index) {
        final item = Announcements[index];

        return AnnouncementTile(
          imagePath: item["image"]!,
          timeAgo: item["time"]!,
          title: item["title"]!,
          onTap: () {
            debugPrint("Tapped on ${item["title"]}");
          },
        );
      },
    );
  }
  Widget buildFaqList(BuildContext context) {
    return SizedBox(
      height: 150.h, // Adjust based on your UI
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: faqList.length,
        separatorBuilder: (context, index) =>
            Space.yf(6),
        itemBuilder: (context, index) {
          final item = faqList[index];

          return SizedBox(
            width: 250.w, // card width
            child: ExpandableCard(
              title: item["title"]!,
              description: item["description"]!,
            ),
          );
        },
      ),
    );
  }


