import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/profile_widgets/contact_tile.dart';

import 'package:pract/widgets/core/app_bar/app_bar.dart';
// import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
