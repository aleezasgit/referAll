part of '../../agent_setup_profile.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    // final state = _ScreenState.s(context, true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Space.yf(16),
        AppHeadings(
          title: 'Complete Your Profile',
          subtitle:
              'Complete your profile so clients can learn more about your expertise and experience.',
        ),
        Space.yf(24),
        Row(children: [Text('Profile Info', style: AppText.h5b)]),
        Space.yf(24),
        CircleAvatar(
          radius: 50.r,
          backgroundImage: AssetImage('assets/pngs/pp.png'),
        ),
        Space.yf(8),
        Text(
          'Change Image',
          style: AppText.b1b!
              .w(6)
              .copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppTheme.c.text.shade800,
              ),
        ),
        Space.yf(24),
        AppTextField(
          name: _FormKeys.email,
          textInputType: TextInputType.emailAddress,
          type: TextFieldType.withIcon,
          hint: 'Email Address',
          textInputAction: TextInputAction.next,
          // validator: FormBuilderValidators.compose([
          //   FormBuilderValidators.required(errorText: 'Email is required'),
          //   FormBuilderValidators.email(errorText: 'Enter a valid email'),
          // ]),
          prefixIcon: PrefixIcon(iconPath: 'assets/svgs/sms.svg'),
        ),
        Space.yf(6),
        AppTextField(
          name: _FormKeys.name,
          textInputType: TextInputType.name,
          type: TextFieldType.withIcon,
          hint: 'e.g , Noam Laish',
          textInputAction: TextInputAction.next,

          prefixIcon: PrefixIcon(iconPath: 'assets/svgs/user.svg'),
        ),
        Space.yf(6),
        // AppPhoneNumberField(
        //   countryFieldName: _FormKeys.phoneCountryCode,
        //   numberFieldName: _FormKeys.phoneNumber,
        // ),
        Space.yf(6),
        AppTextField(
          name: _FormKeys.address,
          textInputType: TextInputType.streetAddress,
          type: TextFieldType.withIcon,
          hint: 'Address',
          textInputAction: TextInputAction.next,
          prefixIcon: PrefixIcon(iconPath: 'assets/svgs/location_pin.svg'),
        ),
        Space.yf(6),
        AppTextField(
          name: _FormKeys.selfDescription,
          textInputType: TextInputType.text,
          hint: 'Write about yourself',
          textInputAction: TextInputAction.done,
          maxLines: 4,
          minLines: 4,
          borderRadius: 24.r,
        ),
        Space.yf(100),
      ],
    );
  }
}
