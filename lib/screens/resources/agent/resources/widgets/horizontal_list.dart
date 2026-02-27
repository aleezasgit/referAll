part of '../resources.dart';


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
  width: 186.w,
  height: 228.h,   
  padding: Space.all(12),
  decoration: BoxDecoration(
    color: AppTheme.c.white,
    borderRadius: BorderRadius.circular(24.r),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Image.asset(
          imagePath,
          height: 96.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),

      Space.yf(16),

      Row(
        children: [
          Image.asset("assets/pngs/Avatar.png",height: 20.h,width: 20.w,),

          Space.xf(8),

          Text("2 min ago", style: AppText.l1b),

          const Spacer(),

         SvgPicture.asset('assets/svgs/dots-vertical.svg',height: 16.h,width: 16.w,),

        ],
      ),

      Space.yf(6),

      Text(
        title,
        style: AppText.l1b?.w(6),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
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
            height: 16.h,
            width: 16.w,
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


class NewUpdatesHorizontalList extends StatelessWidget {
  const NewUpdatesHorizontalList({super.key});

 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: Space.only(left: 12),

        itemCount: _newupdatesdata.length,
        separatorBuilder: (_, __) => Space.xf(6),
        itemBuilder: (context, index) {
          final item = _newupdatesdata[index];

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