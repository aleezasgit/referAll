import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';

class ReviewCard extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final String review;
  final bool showBottomBorder;

  const ReviewCard({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    required this.review,
    required this.showBottomBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: Space.all(16),
    width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        border: showBottomBorder
            ? Border(
              
                bottom: BorderSide(
                  color: AppTheme.c.lightGrey.shade400!,
                ),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 Profile Image
          Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(image),
            ),
          ),

          Space.xf(16),

          /// 🔹 Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Name + Time
                Row(
                  children: [
                    Text(
                      name,
                      style: AppText.b1b?.w(6),
                    ),
                    Space.xf(6),
                    Text(
                      "• $time",
                      style: AppText.l2b?.w(6).cl(
                        AppTheme.c.text.main  !,
                      ),
                    ),
                  ],
                ),

                Space.yf(6),

                /// Review Text
                Text(
                  review,
                  style: AppText.b1bm?.w(5).cl(
                    AppTheme.c.text.main!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}