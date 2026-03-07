
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/core/app_background.dart';
import 'package:pract/widgets/core/app_bar/app_bar.dart';
import 'package:pract/widgets/core/headers/user_header.dart';
import 'package:provider/provider.dart';


part 'widgets/_body.dart';
part '_state.dart';
part 'data.dart';
// part 'widgets/_referral_chart.dart';

class BAnalyticsScreen extends StatelessWidget {
  const BAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
