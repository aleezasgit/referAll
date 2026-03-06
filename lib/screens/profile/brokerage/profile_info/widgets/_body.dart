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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Profile Info', style: AppText.h5b),
              Space.yf(24),
              /// PROFILE IMAGE (CENTERED)
              Center(
                child: Column(
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
              AppPhoneNumberField(
                name: _FormKeys.phone,
                hint: "353146464-3543-14",
                textInputType: TextInputType.phone,
                prefixIcon:
                    PrefixIcon(iconPath: 'assets/svgs/phone.svg'),
                countryFieldName: 'usa',
                numberFieldName: '2304948',
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

              /// ABOUT YOURSELF
              AppTextField(
                name: _FormKeys.selfDescription,
                textInputType: TextInputType.text,
                hint: 'Write about yourself',
                textInputAction: TextInputAction.done,
                maxLines: 4,
                minLines: 4,
                borderRadius: 24.r,
              ),

              Space.yf(24),

              /// PROFESSIONAL DETAILS
              Text('Professional Details', style: AppText.h5b),

              Space.yf(16),

              AppTextField(
                name: _FormKeys.licenseNumber,
                textInputType: TextInputType.text,
                type: TextFieldType.withIcon,
                hint: 'License Number',
                textInputAction: TextInputAction.next,
                prefixIcon: PrefixIcon(iconPath: 'assets/svgs/card.svg'),
              ),

              Space.yf(6),

              AppTextField(
                name: _FormKeys.yearsOfExperience,
                textInputType: TextInputType.number,
                type: TextFieldType.withIcon,
                hint: 'Years of Experience',
                textInputAction: TextInputAction.done,
                prefixIcon: PrefixIcon(
                    iconPath: 'assets/svgs/briefcase.svg'),
              ),

              Space.yf(16),

              /// SPECIALTIES
              Text('Specialties', style: AppText.h5b),

              Space.yf(16),

              SpecialitiesSelector(
                name: _FormKeys.specialities,
                options: const [
                  "Industrial",
                  "Single Family",
                  "Commercial",
                  "Corporate Hub",
                ],
              ),

              Space.yf(24),

              /// SOCIAL LINKS
              Text('Social Links  & Others', style: AppText.h5b),

              Space.yf(16),

              AppTextField(
                name: _FormKeys.facebookLink,
                textInputType: TextInputType.url,
                type: TextFieldType.withIcon,
                hint: 'Facebook URL',
                textInputAction: TextInputAction.next,
                prefixIcon: PrefixIcon(
                  iconPath: 'assets/svgs/facebook.svg',
                  iconSize: 24.sp,
                ),
              ),

              Space.yf(6),

              AppTextField(
                name: _FormKeys.instagramLink,
                textInputType: TextInputType.url,
                type: TextFieldType.withIcon,
                hint: 'Instagram URL',
                textInputAction: TextInputAction.next,
                prefixIcon: PrefixIcon(
                  iconPath: 'assets/svgs/insta.svg',
                  iconSize: 24.sp,
                ),
              ),

              Space.yf(6),

              AppTextField(
                name: _FormKeys.tikTokLink,
                textInputType: TextInputType.url,
                type: TextFieldType.withIcon,
                hint: 'TikTok URL',
                textInputAction: TextInputAction.next,
                prefixIcon: PrefixIcon(
                  iconPath: 'assets/svgs/tiktok.svg',
                  iconSize: 24.sp,
                ),
              ),

              Space.yf(6),

              AppTextField(
                name: _FormKeys.youtubeLink,
                textInputType: TextInputType.url,
                type: TextFieldType.withIcon,
                hint: 'YouTube URL',
                textInputAction: TextInputAction.next,
                prefixIcon: PrefixIcon(
                  iconPath: 'assets/svgs/youtube.svg',
                  iconSize: 24.sp,
                ),
              ),

              Space.yf(6),

              AppTextField(
                name: _FormKeys.customLink,
                textInputType: TextInputType.url,
                type: TextFieldType.withIcon,
                hint: 'Custom Link',
                textInputAction: TextInputAction.next,
                prefixIcon: PrefixIcon(
                  iconPath: 'assets/svgs/link.svg',
                  iconSize: 24.sp,
                ),
              ),

              Space.yf(24),

              /// MARKETING MATERIAL
              Text('Social proofs', style: AppText.h5b),

              Space.yf(16),

              UploadMediaField(
                name: "media",
                onPickFile: () async {
                  return "sample_file.pdf";
                },
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
          bottom: MediaQuery.of(context).padding.bottom + 16.h,
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