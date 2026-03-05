import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';

/// ----------------------
/// BROKER REQUEST CARD
/// ----------------------
class BrokerRequestCard extends StatefulWidget {
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
  State<BrokerRequestCard> createState() => _BrokerRequestCardState();
}

class _BrokerRequestCardState extends State<BrokerRequestCard> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(widget.name, style: AppText.b1b?.w(6)),
                    Space.yf(2),
                    Text(
                      widget.time,
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
              ),

              Container(
                padding: Space.all(8, 4),
                decoration: BoxDecoration(
                  color: AppTheme.c.error.shade100,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/clockred.svg",
                      height: 12,
                      width: 12,
                    ),
                    Space.xf(6),
                    Text(
                      "20:15",
                      style: AppText.l2b?.w(6),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Space.yf(16),

          /// 🔹 HEADER ROW (CUSTOM EXPAND)
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "Broker Details",
                  style: AppText.b1b?.w(6),
                ),

                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: SvgPicture.asset(
                    "assets/svgs/arrow-right.svg",
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 ANIMATED CONTENT
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Space.yf(12),

                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppTheme.c.lightGrey.shade400,
                ),

                Space.yf(12),

                Row(
                  children: [
                    Expanded(
                      child: _DetailItem(
                        title: widget.email,
                        subtitle: "Email Address",
                      ),
                    ),
                    Expanded(
                      child: _DetailItem(
                        title: widget.phone,
                        subtitle: "Phone Number",
                      ),
                    ),
                  ],
                ),

                Space.yf(18),

                Row(
                  children: [
                    Expanded(
                      child: _DetailItem(
                        title: widget.agents,
                        subtitle: "Total Agents",
                      ),
                    ),
                    Expanded(
                      child: _DetailItem(
                        title: widget.address,
                        subtitle: "Address",
                      ),
                    ),
                  ],
                ),

                Space.yf(16),

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

                    Space.xf(8),

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
        Text(title, style: AppText.b1b?.w(6)),
        Space.yf(2),
        Text(
          subtitle,
          style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
        ),
      ],
    );
  }
}

/// ----------------------
/// BROKER REQUEST LIST
/// ----------------------
class InvitationList extends StatelessWidget {
  InvitationList({super.key});

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
      separatorBuilder: (_, __) => Space.yf(6),
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