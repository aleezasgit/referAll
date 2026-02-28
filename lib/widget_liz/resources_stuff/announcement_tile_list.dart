import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';

class AnnouncementTile extends StatelessWidget {
  final String imagePath;
  final String timeAgo;
  final String title;
  final VoidCallback onTap;

  const AnnouncementTile({
    super.key,
    required this.imagePath,
    required this.timeAgo,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 96,
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Left Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                height: 72,
                width: 72,
                fit: BoxFit.cover,
              ),
            ),

            Space.xf(16),

            /// Right Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Time
                  Text(
                    timeAgo,
                    style: AppText.l1b?.cl(AppTheme.c.text.main!),
                  ),

                  Space.yf(8),

                  /// Title
                  Text(
                    title,
                    style: AppText.b1b?.w(6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementList extends StatelessWidget {
  AnnouncementList({super.key});

  final List<Map<String, String>> dummyAnnouncements = [
    {
      "image": "assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png",
      "time": "2 mon ago",
      "title": "9 Things to Consider Before Buying Your First NFT",
    },
    {
      "image": "assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png",
      "time": "1 mon ago",
      "title": "The Rise of Sustainable Architecture in Real Estate",
    },
    {
      "image": "assets/pngs/OB_1.png",
      "time": "3 weeks ago",
      "title": "How Remote Work is Reshaping Urban Living",
    },
  
  ];

  @override
  Widget build(BuildContext context) {
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
}