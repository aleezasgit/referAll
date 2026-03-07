import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/profile_widgets/invitation_list.dart';
import 'package:pract/widget_liz/profile_widgets/notification_screen.dart';
import 'package:pract/widget_liz/profile_widgets/occupied_1.dart';
import 'package:pract/widget_liz/profile_widgets/occupied_invitation_tapbar.dart';


import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:pract/widgets/core/tab_bar/switch_tab_bar.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';
// import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';
part 'data.dart';

class ManageStateScreen extends StatelessWidget {
  const ManageStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
