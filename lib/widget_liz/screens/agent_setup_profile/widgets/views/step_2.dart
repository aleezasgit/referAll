part of '../../agent_setup_profile.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

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
        Text('Brokerage Info', style: AppText.h5b),
        Space.yf(16),
        AppTextField(
          name: _FormKeys.brokerageName,
          textInputType: TextInputType.name,
          type: TextFieldType.withIcon,
          hint: 'Brokerage Name',
          textInputAction: TextInputAction.next,

          prefixIcon: PrefixIcon(iconPath: 'assets/svgs/user.svg'),
        ),
        Space.yf(6),
        // AppPhoneNumberField(
        //   countryFieldName: _FormKeys.brokeragePhoneCountryCode,
        //   numberFieldName: _FormKeys.brokeragePhoneNumber,
        //   hint: 'Brokerage Number',
        // ),
        Space.yf(16),
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
          prefixIcon: PrefixIcon(iconPath: 'assets/svgs/briefcase.svg'),
        ),
        Space.yf(16),
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
        Space.yf(100),
      ],
    );
  }
}
