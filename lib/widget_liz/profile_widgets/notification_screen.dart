import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  // App.init(context);
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ----------------
          /// TODAY
          /// ----------------
          const Text(
            "Today",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              return NotificationTile(
                isInvitation: index == 2,
              );
            },
          ),

          const SizedBox(height: 24),

          /// ----------------
          /// YESTERDAY
          /// ----------------
          const Text(
            "Yesterday",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              return NotificationTile(
                isInvitation: index == 2,
              );
            },
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// NOTIFICATION TILE
////////////////////////////////////////////////////////////

class NotificationTile extends StatelessWidget {
  final bool isInvitation;

  const NotificationTile({
    super.key,
    required this.isInvitation,
  });

  @override
  Widget build(BuildContext context) {

    final iconPath = isInvitation
        ? "assets/svgs/invitationn.svg"
        : "assets/svgs/update_icon.svg";

    final title = isInvitation ? "Invitation Sent " : "New Update ";

    final info = isInvitation
        ? 'to "user123@gmail.com"'
        : "Admin uploaded new announcement for commercials";

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ICON
        SvgPicture.asset(
          iconPath,
          height: 40,
          width: 40,
        ),

        const SizedBox(width: 12),

        /// TEXT CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE + INFO
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: info,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "3hr ago",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}