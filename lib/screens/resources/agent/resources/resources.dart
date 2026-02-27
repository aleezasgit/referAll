import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/router/routes.dart';
import 'package:pract/widget_liz/faqs_expanded.dart';
import 'package:pract/widget_liz/recent_referalcard.dart';
import 'package:pract/widget_liz/resources_stuff/announcement_tile_list.dart';
import 'package:pract/widget_liz/resources_stuff/marketing_assets.dart';
import 'package:pract/widget_liz/resources_stuff/new_updates_list.dart';
import 'package:pract/widget_liz/resources_stuff/tapbar.dart';
import 'package:pract/widgets/core/app_background.dart';
import 'package:pract/widgets/core/headers/app_header.dart';
import 'package:pract/widgets/core/headers/user_header.dart';
import 'package:pract/widgets/core/tab_bar/switch_tab_bar.dart';
import 'package:pract/widgets/design/textfields/search_textfield/search_field.dart';
import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';
part 'data.dart';
part 'widgets/horizontal_list.dart';
class ResourcefirstHome extends StatelessWidget {
  const ResourcefirstHome({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
