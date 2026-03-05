import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/router/routes.dart';
import 'package:pract/widgets/circle_icon.dart';
import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:pract/widgets/core/headers/app_header.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';
import 'package:pract/widgets/design/textfields/app_textfield/app_textfield.dart';
import 'package:pract/widgets/design/textfields/phone_numberfield.dart';
import 'package:pract/widgets/prefix_icon.dart';
import 'package:pract/widgets/upload_media.dart';
import 'package:provider/provider.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';
part 'widgets/_body.dart';
part '_state.dart';

part 'widgets/views/step_1.dart';
part 'widgets/views/step_2.dart';
part 'widgets/views/step_3.dart';
part 'widgets/services_selector.dart';
part 'bottom_sheets/account_creation_success.dart';

class AgentProfileSetupScreen extends StatelessWidget {
  const AgentProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
