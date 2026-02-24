import 'package:flutter/material.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/widgets/switch_container.dart';

class SwitchTabBar extends StatefulWidget {
  final List<String> options;
  final List<Widget> tabs;
  final String? initialValue;
  final ValueChanged<int>? onIndexChanged;
  final double? spaceBetween;

  const SwitchTabBar({
    super.key,
    required this.options,
    required this.tabs,
    this.initialValue,
    this.onIndexChanged,
    this.spaceBetween,
  });

  @override
  State<SwitchTabBar> createState() => _SwitchTabBarState();
}

class _SwitchTabBarState extends State<SwitchTabBar> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final index = widget.options.indexOf(_selected);
    final Widget content = widget.tabs[index];

    return Column(
      children: [
        // tab buttons
        Padding(
          padding: Space.hf(24),
          child: SwitchContainer(
            name: "switch_tab",
            options: widget.options,
            initialValue: _selected,
            onChanged: (val) {
              setState(() {
                _selected = val;
                widget.onIndexChanged?.call(widget.options.indexOf(val));
              });
            },
          ),
        ),

        Space.yf(widget.spaceBetween ?? 12),

        content,
      ],
    );
  }
}
