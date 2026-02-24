import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/core/enums/request_status.dart';

class StatusExpandableCard extends StatefulWidget {
  final String name;
  final String role;
  final RequestStatus status;
  final VoidCallback? onViewDetails;

  const StatusExpandableCard({
    super.key,
    required this.name,
    required this.role,
    required this.status,
    this.onViewDetails,
  });

  @override
  State<StatusExpandableCard> createState() =>
      _StatusExpandableCardState();
}

class _StatusExpandableCardState
    extends State<StatusExpandableCard> {
  bool isExpanded = false;

  Color _getStatusColor() {
    switch (widget.status) {
      case RequestStatus.pending:
        return AppTheme.c.primary.main ?? Colors.purple;
      case RequestStatus.accepted:
        return AppTheme.c.accent.green ?? Colors.green;
      case RequestStatus.cancelled:
        return AppTheme.c.accent.red ?? Colors.red;
    }
  }

  String _getStatusLabel() {
    switch (widget.status) {
      case RequestStatus.pending:
        return "Pending";
      case RequestStatus.accepted:
        return "Accepted";
      case RequestStatus.cancelled:
        return "Cancelled";
    }
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final statusColor = _getStatusColor();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: Space.all(16, 12),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          /// HEADER
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage:
                      AssetImage('assets/pngs/OB_3.png'),
                ),
                Space.xf(8),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: (AppText.l1b ??
                                const TextStyle())
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Space.yf(2),
                      Text(
                        widget.role,
                        style: (AppText.l2 ??
                                const TextStyle())
                            .copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppTheme.c.text.main ??
                              Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                /// STATUS BADGE
                Container(
                  padding: Space.all(8, 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(20),
                    border:
                        Border.all(color: statusColor),
                  ),
                  child: Text(
                    _getStatusLabel(),
                    style: (AppText.l2b ??
                            const TextStyle())
                        .copyWith(
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                ),

                Space.xf(8),

                AnimatedRotation(
                  turns: isExpanded ? 0 : 0.25,
                  duration:
                      const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    'assets/svgs/arrow-right.svg',
                    height: 18,
                    width: 18,
                  ),
                ),
              ],
            ),
          ),

          /// EXPANDED CONTENT
          AnimatedCrossFade(
            duration:
                const Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(),
            secondChild: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Space.yf(10),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: AppTheme.c.lightGrey.shade400,
                  ),
                ),
                             Space.yf(8),


                Text(
                  "Client Info",
                  style: AppText.l1b?.w(6),
                ),
              
 Space.yf(8),
                _sectionContainer(
                  children: const [
                    _InfoRow("Name", "Sarah Thompson"),
                    _InfoRow("Phone Number",
                        "+1 (415) 555-7821"),
                    _InfoRow("Email Address",
                        "sarah.thompson@gmail.com"),
                    _InfoRow("Location",
                        "San Francisco, CA"),
                  ],
                ),

                 Space.yf(16),

                Text(
                  "Property Details",
                  style: AppText.l1b?.w(6),
                ),
                Space.yf(8),

                _sectionContainer(
                  children: const [
                    _InfoRow("Property Type",
                        "Single Family"),
                    _InfoRow("Budget Range",
                        "\$1,200,000 - \$1,400,000"),
                    _InfoRow("Timeline & Urgency",
                        "3–6 months"),
                  ],
                ),

                Space.yf(16),

                /// REFERRAL FEE
               Container(
  width: double.infinity,
  height: 34,
  padding: Space.vf(8) ,
  decoration: BoxDecoration(
    color: AppTheme.c.white,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "25%",
          style: AppText.l1b ?.w(6),),
        
        Space.xf(6),
        Text(
          "Referral Fee Percentage",
          style: AppText.l2 ?.w(4),
        ),
      ],
    ),
  ),
),

       Space.yf(16),
                /// VIEW DETAILS
                SizedBox(
                  width: double.infinity,
                  height: 41,
                  child: Material(
                    color: AppTheme.c.primary.main ??
                        const Color(0xFF6C63FF),
                    borderRadius:
                        BorderRadius.circular(48),
                    child: InkWell(
                      onTap:
                          widget.onViewDetails,
                     // borderRadius:
                       //   BorderRadius.circular(30),
                      child:  Padding(
                        padding:
                            Space.vf(10),
                        child: Center(
                          child: Text(
                            "View Details",
                            style: AppText.b1b?.w(6).cl(AppTheme.c.white!)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionContainer(
      {required List<Widget> children}) {
    return Container(
      padding: Space.all(10),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius:
            BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const _InfoRow(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppText.l2?.w(4)
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppText.l1b?.w(6)
            ),
          ),
        ],
      ),
    );
  }
}