import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/profile_sec.dart';
import 'package:pract/widgets/agentinfo_card.dart';
import 'package:pract/widgets/agentmarketing_card.dart';
import 'package:pract/widgets/profile_infocard.dart';


class AgentProfileScreen extends StatelessWidget {
  const AgentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
     
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Text("Agent Profile"),
        ),
     ),

      body: SafeArea(
        child: Container(
                      decoration: BoxDecoration(
              color: AppTheme.c.background.main),
          child: SingleChildScrollView(
            padding: Space.all(16,10),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
               
               AgentProfileHeader(),
            Space.yf(6),
                AgentDetailsExpandableCard(
              propertyType: "Single Family, Commercials",
              licenseNumber: "EL#12122",
              recentSales: "22k",
              averageRating: "4.5",
            ),
            
               
                Space.yf(6),
            
                AgentDetailsExpandableCard(propertyType: "abc", licenseNumber: "30Ab", recentSales: "60+", averageRating:"4.5"),
            
            
            
               Space.yf(6),
                AgentMarketingExpandableCard(
              images: [
                "assets/pngs/OB_2.png",
                "assets/pngs/OB_2.png",
                "assets/pngs/OB_2.png",
                "assets/pngs/OB_1.png",
                "assets/pngs/OB_2.png",
                "assets/pngs/OB_1.png",
              ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}