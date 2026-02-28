import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widget_liz/resources_stuff/attatched_madia_card.dart';
import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';


class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
