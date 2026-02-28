part of '../accept_referrals.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      appBar: CustomAppBar(

        title:"I Accepted Referrals",
        type: AppBarType.withTextCenter,
        
      ),
      body: Padding(
        padding: Space.all(16),
        child: SingleChildScrollView(
          
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              buildAnnoucement(context)
            ],
          ),
        ),
      ),
    );
  }
}



 Widget buildAnnoucement(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      //padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: dummyAnnouncements.length,
      separatorBuilder: (_, __) => Space.yf(6),
      itemBuilder: (context, index) {
        final item = dummyAnnouncements[index];

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
