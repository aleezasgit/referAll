
part of '../seats.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "Manage Your Seat",
      ),
      body: SingleChildScrollView(
        padding: Space.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
          bottom: 16.h,
        ),
        child: FormBuilder(
          key: state.formKey,
          initialValue: _FormData.initialValues(),
          child: Column(
            children: [

              SwitchTabBar(
                options: const ['Occupied', 'Invitations'],
                tabs: [
                  buildOccupiedList(context),
                  buildInvitationsList(context),
                ],
                initialValue:
                    state.selectedIndex == 0 ? 'Occupied' : 'Invitations',
                onIndexChanged: (index) {
                  state.changeTab(index);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/// ================= OCCUPIED TAB =================
Widget buildOccupiedList(BuildContext context) {
  final state = _ScreenState.s(context);

  return Column(
    children: [
      Space.yf(16),

      state.showOccupiedAlternative
          ? buildBrokerDetail(context)
          : EmptyInvitationCard(
              onViewInvitations: () {
                state.showBrokerDetail();
              },
            ),
    ],
  );
}

/// ================= INVITATIONS TAB =================
Widget buildInvitationsList(BuildContext context) {
  return Column(
    children: [
      Space.yf(16),
      InvitationList(),
    ],
  );
}

/// ================= VIEW2 CONTENT =================
Widget buildBrokerDetail(BuildContext context) {
  return Column(
    children: [

      /// PROFILE CONTAINER
      Container(
        width: double.infinity,
        padding: Space.all(16),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: const AssetImage("assets/pngs/OB_3.png"),
                ),
                Positioned(
                  bottom: 2,
                  right: 3,
                  child: Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      color: AppTheme.c.secondary.main,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            Space.yf(12),

            Text(
              "Shaveya Malik",
              style: AppText.h5bm,
            ),

            Space.yf(8),

            Text(
              "Wellness enthusiast 💪 Lover of clean living, mindful habits, and healthy vibes ✨🥗🧘",
              style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
              textAlign: TextAlign.center,
            ),

            Space.yf(16),

            SizedBox(
              width: 97.w,
              child: AppButton(
                label: "Message",
                onPressed: () {},
                backgroundColor: AppTheme.c.primary.main,
                buttonType: ButtonType.primaryWithIconLeft,
                iconPath: "assets/svgs/msg.svg",
              ),
            ),
          ],
        ),
      ),

      Space.yf(8),

      /// BROKER DETAILS CONTAINER
      Container(
        width: double.infinity,
        padding: Space.all(16),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                SvgPicture.asset(
                  "assets/svgs/seat_logo.svg",
                  width: 37.w,
                  height: 37.h,
                ),
                Space.xf(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Broker Details",
                      style: AppText.b1b?.w(6),
                    ),
                    Text(
                      "Seat 2",
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                )
              ],
            ),

            Space.yf(10),

            Container(
              width: double.infinity,
              height: 1.h,
              color: AppTheme.c.text.main!,
            ),

            Space.yf(10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("sarah.thompson@gmail.com",
                        style: AppText.l1bm?.w(6)),
                    Text(
                      "Email Address",
                      style: AppText.b2?.cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("+1 (415) 555-7821", style: AppText.l1bm?.w(6)),
                    Text(
                      "Phone Number",
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                )
              ],
            ),

            Space.yf(8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("15", style: AppText.l1bm?.w(6)),
                    Text(
                      "Total Agents",
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Sans Fransisco, CA",
                        style: AppText.l1bm?.w(6)),
                    Text(
                      "Address",
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                )
              ],
            ),

            Space.yf(8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("EL3434", style: AppText.l1bm?.w(6)),
                    Text(
                      "License #",
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "www.xyz.com",
                        style: AppText.l1bm
                            ?.w(6)
                            .cl(AppTheme.c.primary.main!)
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    Text(
                      "Website",
                      style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

