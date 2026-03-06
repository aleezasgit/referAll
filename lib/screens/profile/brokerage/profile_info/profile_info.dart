import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/router/routes.dart';
import 'package:pract/widget_liz/screens/agent_setup_profile/agent_setup_profile.dart';
import 'package:pract/statics/app_statics.dart';
import 'package:pract/widgets/core/app_background.dart';
import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:pract/widgets/core/headers/app_header.dart';
import 'package:pract/widgets/core/tab_bar/switch_tab_bar.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';
import 'package:pract/widgets/design/checkboxes/app_checkbox/app_checkbox.dart';
import 'package:pract/widgets/design/textfields/app_textfield/app_textfield.dart';
import 'package:pract/widgets/design/textfields/phone_numberfield.dart';
import 'package:pract/widgets/prefix_icon.dart';
import 'package:pract/widgets/upload_media.dart';
// import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';

class BProfileInfoScreen extends StatelessWidget {
  const BProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
