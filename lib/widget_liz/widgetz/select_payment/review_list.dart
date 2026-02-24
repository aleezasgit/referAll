import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/widgetz/select_payment/reviews_card.dart';

class ReviewList extends StatelessWidget {
  ReviewList({super.key});

  final List<Map<String, String>> reviews = [
    {
      "image": "assets/pngs/splash_bg.png",
      "name": "Ayesha Khan",
      "time": "2 days ago",
      "review":
          "I'm so grateful for her expertise in helping me find the perfect home. She made the process stress-free.",
    },
    {
      "image": "assets/pngs/splash_bg.png",
      "name": "Ali Raza",
      "time": "1 week ago",
      "review":
          "Smooth process and excellent communication throughout.",
    },
    {
      "image": "assets/pngs/splash_bg.png",
      "name": "Hira Ahmed",
      "time": "3 weeks ago",
      "review":
          "Helped me find the perfect property within my budget.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
         padding: Space.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24)
            ),
      child: Column(
        children: List.generate(reviews.length, (index) {
          final review = reviews[index];
      
          return ReviewCard(
            image: review["image"]!,
            name: review["name"]!,
            time: review["time"]!,
            review: review["review"]!,
            showBottomBorder: index != reviews.length - 1,
          );
        }),
      ),
    );
  }
}