import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/router/routes.dart';
import 'package:pract/widget_liz/profile_widgets/bottom_sheets/delete_bottom_sheet.dart';
import 'package:pract/widget_liz/profile_widgets/bottom_sheets/logout_bottom_sheet.dart';
import 'package:pract/widget_liz/recent_referalcard.dart';
import 'package:pract/widgets/core/app_background.dart';
import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:pract/widgets/core/headers/app_header.dart';
import 'package:pract/widgets/design/buttons/app_button/app_button.dart';
import 'package:pract/widgets/design/textfields/search_textfield/search_field.dart';
import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';
part 'data.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
