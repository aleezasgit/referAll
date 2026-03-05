part of '../../agent_setup_profile.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space.yf(16),
        AppHeadings(
          title: 'Complete Your Profile',
          subtitle:
              'Complete your profile so clients can learn more about your expertise and experience.',
        ),
        Space.yf(24),
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
            iconPath: 'assets/svgs/link2.svg',
            iconSize: 24.sp,
          ),
        ),
        Space.yf(16),
        Text('Marketing Material', style: AppText.h5b),
        Space.yf(16),
        UploadMediaField(
          name: "media",
          onPickFile: () async {
            // your file picker logic
            return "sample_file.pdf";
          },
        ),
        Space.yf(100),
      ],
    );
  }
}
