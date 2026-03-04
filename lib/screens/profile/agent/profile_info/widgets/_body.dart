part of '../profile_info.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: CustomAppBar(
        title: "Profile Info",
      ),

      /// ================= BODY =================
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// PROFILE IMAGE
              Column(
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    backgroundImage:
                        const AssetImage('assets/pngs/Avatar.png'),
                  ),
                  Space.yf(8),
                  Text(
                    "Change Image",
                    style: AppText.b1b?.w(6),
                  ),
                ],
              ),

              Space.yf(24),

              

              /// EMAIL
              AppTextField(
                name: _FormKeys.email,
                hint: "Email Address",
                textInputType: TextInputType.emailAddress,
                prefixIcon:
                    PrefixIcon(iconPath: 'assets/svgs/email.svg'),
              ),

              Space.yf(6),

              /// NAME
              AppTextField(
                name: _FormKeys.name,
                hint: "e.g. Noam Laish",
                textInputType: TextInputType.name,
                prefixIcon:
                    PrefixIcon(iconPath: 'assets/svgs/user.svg'),
              ),

              Space.yf(6),

              /// PHONE
              AppTextField(
                name: _FormKeys.phone,
                hint: "353146464-3543-14",
                textInputType: TextInputType.phone,
                prefixIcon:
                    PrefixIcon(iconPath: 'assets/svgs/phone.svg'),
              ),

              Space.yf(6),

              /// LICENSE NUMBER
              AppTextField(
                name: _FormKeys.licenseNumber,
                hint: "License Number",
                prefixIcon:
                    PrefixIcon(iconPath: 'assets/svgs/card.svg'),
              ),

              Space.yf(6),

              /// ADDRESS
              AppTextField(
                name: _FormKeys.address,
                hint: "Address",
                prefixIcon: PrefixIcon(
                    iconPath: 'assets/svgs/Search Icon.svg'),
              ),

              Space.yf(6),

              /// WEBSITE
              AppTextField(
                name: _FormKeys.website,
                hint: "Website",
                textInputType: TextInputType.url,
                prefixIcon:
                    PrefixIcon(iconPath: 'assets/svgs/website.svg'),
              ),
            ],
          ),
        ),
      ),

      /// ================= FIXED SAVE BUTTON =================
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 12.h,
          bottom:
              MediaQuery.of(context).padding.bottom + 16.h,
        ),
        child: AppButton(
          label: "Save Changes",
          onPressed: () {
            final isValid =
                state.formKey.currentState?.saveAndValidate() ?? false;

            if (isValid) {
              final data =
                  state.formKey.currentState!.value;

              debugPrint("Profile Data: $data");

     
            }
          },
        ),
      ),
    );
  }
}


