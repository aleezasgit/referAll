import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

/// ----------------------
/// BROKER REQUEST CARD
/// ----------------------
class BrokerRequestCard extends StatelessWidget {
  final String name;
  final String time;
  final String email;
  final String phone;
  final String agents;
  final String address;

  const BrokerRequestCard({
    super.key,
    required this.name,
    required this.time,
    required this.email,
    required this.phone,
    required this.agents,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [

          /// TOP SECTION
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundImage: const AssetImage("assets/pngs/OB_3.png"),
              ),

              Space.xf(12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppText.b1b?.w(6)),
                    Space.yf(4),
                    Text(time, style: AppText.l2?.cl(AppTheme.c.text.main!)),
                  ],
                ),
              ),

              Container(
                padding: Space.all(8, 4),
                decoration: BoxDecoration(
                  color: AppTheme.c.accent.red,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Text(
                  "20:15",
                  style: AppText.l2b?.cl(AppTheme.c.white!),
                ),
              ),
            ],
          ),

          Space.yf(12),

          /// EXPANDABLE DETAILS
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              title: Text("Broker Details", style: AppText.b1b),
              children: [

                Divider(color: AppTheme.c.lightGrey.main),

                Space.yf(12),

                Row(
                  children: [
                    Expanded(
                      child: _DetailItem(
                        title: email,
                        subtitle: "Email Address",
                      ),
                    ),
                    Expanded(
                      child: _DetailItem(
                        title: phone,
                        subtitle: "Phone Number",
                      ),
                    ),
                  ],
                ),

                Space.yf(12),

                Row(
                  children: [
                    Expanded(
                      child: _DetailItem(
                        title: agents,
                        subtitle: "Total Agents",
                      ),
                    ),
                    Expanded(
                      child: _DetailItem(
                        title: address,
                        subtitle: "Address",
                      ),
                    ),
                  ],
                ),

                Space.yf(20),

                Row(
                  children: [

                    Expanded(
                      child: AppButton(
                        label: "Decline",
                        onPressed: () {},
                        backgroundColor: AppTheme.c.accent.red,
                        buttonType: ButtonType.primaryWithIconLeft,
                        iconPath: "assets/svgs/close.svg",
                      ),
                    ),

                    Space.xf(12),

                    Expanded(
                      child: AppButton(
                        label: "Accept",
                        onPressed: () {},
                        backgroundColor: AppTheme.c.primary.main,
                        buttonType: ButtonType.primaryWithIconLeft,
                        iconPath: "assets/svgs/check.svg",
                      ),
                    ),
                  ],
                ),

                Space.yf(10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ----------------------
/// DETAIL ITEM
/// ----------------------
class _DetailItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _DetailItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppText.b1b),
        Space.yf(4),
        Text(
          subtitle,
          style: AppText.l2?.cl(AppTheme.c.text.main!),
        ),
      ],
    );
  }
}

/// ----------------------
/// BROKER REQUEST LIST
/// ----------------------
class BrokerRequestVerticalList extends StatelessWidget {
  BrokerRequestVerticalList({super.key});

  final List<Map<String, String>> dummyData = [
    {
      "name": "Anderson Harry",
      "time": "2 min ago",
      "email": "sarah.thompson@gmail.com",
      "phone": "+1 (415) 555-7821",
      "agents": "15",
      "address": "San Francisco, CA",
    },
    {
      "name": "David Smith",
      "time": "10 min ago",
      "email": "david.smith@gmail.com",
      "phone": "+1 (212) 555-1234",
      "agents": "9",
      "address": "New York, NY",
    },
    {
      "name": "Emma Watson",
      "time": "15 min ago",
      "email": "emma.watson@gmail.com",
      "phone": "+1 (646) 555-9911",
      "agents": "12",
      "address": "Los Angeles, CA",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: Space.all(16),
      itemCount: dummyData.length,
      separatorBuilder: (_, __) => Space.yf(12),
      itemBuilder: (context, index) {

        final item = dummyData[index];

        return BrokerRequestCard(
          name: item["name"]!,
          time: item["time"]!,
          email: item["email"]!,
          phone: item["phone"]!,
          agents: item["agents"]!,
          address: item["address"]!,
        );
      },
    );
  }
}