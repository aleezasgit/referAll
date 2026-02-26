import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

/// ----------------------
/// NEW UPDATES CARD
/// ----------------------
class NewUpdatesCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String type;
  final String time;

  

  const NewUpdatesCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.type,
    required this.time,
   
   
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
  width: 186,
  height: 228,   
  padding: Space.all(12),
  decoration: BoxDecoration(
    color: AppTheme.c.white,
    borderRadius: BorderRadius.circular(24),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          imagePath,
          height: 96,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),

      Space.yf(16),

      Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/pngs/Avatar.png"),
          ),

          Space.xf(8),

          Text("2 min ago", style: AppText.l1b),

          const Spacer(),

         Container(
          width: 16,
          height: 16,
          child: SvgPicture.asset('assets/svgs/dots-vertical.svg'),
         )
        ],
      ),

      Space.yf(6),

      Text(
        title,
        style: AppText.l1b?.w(6),
      ),

      Space.yf(12),

      Row(
        children: [
          Text(
            type,
            style: AppText.l1b?.w(6).cl(AppTheme.c.primary.main!),
          ),

          const Spacer(),

          SvgPicture.asset(
            "assets/svgs/clock.svg", 
            height: 16,
            width: 16,
          ),

          Space.xf(4),

          Text(
            time,
            style: AppText.l1bm,
          ),
        ],
      ),
    ],
  ),
);
  }
}

/// ----------------------
/// HORIZONTAL LIST WIDGET
/// ----------------------
class NewUpdatesHorizontalList extends StatelessWidget {
  NewUpdatesHorizontalList({super.key});

  final List<Map<String, String>> dummyData = [
    {
      "image": "assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png",
      "title": "Business Innovations: Shaping the Future of Commerce",
      "type": "Single Family",
      "time": "10 min",
     
    },
    {
      "image": "assets/pngs/OB_1.png",
      "title": "Business Innovations: Shaping the Future of Commerce",
      "type": "Single Family",
      "time": "10 min",
     
   
    },
    {
      "image": "assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png",
      "title": "Business Innovations: Shaping the Future of Commerce",
      "type": "Single Family",
      "time": "10 min",
     
    },
    {
      "image": "assets/pngs/OB_1.png",
      "title": "Business Innovations: Shaping the Future of Commerce",
      "type": "Single Family",
      "time": "10 min",
     
   
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        //padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: dummyData.length,
        separatorBuilder: (_, __) => Space.xf(6),
        itemBuilder: (context, index) {
          final item = dummyData[index];

          return NewUpdatesCard(
            imagePath: item["image"]!,
            title: item["title"]!,
            type: item["type"]!,
            time: item["time"]!,
         
          );
        },
      ),
    );
  }
}