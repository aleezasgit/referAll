import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';

part 'enums.dart';

class AppContainerTextField extends StatefulWidget {
  final String name;
  final String? hint;
  final String? label;

  final int? maxLength;
  final int maxLines;
  final bool enabled;
  final bool readOnly;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  /// Custom suffix widget (icons, buttons etc.)
  final Widget? suffix;
  final ContainerTextFieldType type;

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final bool onTapOutside;

  const AppContainerTextField({
    super.key,
    required this.name,
    this.hint,
    this.label,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffix,
    this.validator,
    this.onChanged,
    this.onTap,
    this.type = ContainerTextFieldType.primary,
    this.onTapOutside = true,
  });

  @override
  State<AppContainerTextField> createState() => _AppContainerTextFieldState();
}

class _AppContainerTextFieldState extends State<AppContainerTextField> {
  late FocusNode _focusNode;
  String _text = '';

  int get _currentLength => _text.length;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppText.b1b!.w(6)),
          Space.yf(6),
        ],

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: widget.type == ContainerTextFieldType.multiline
                ? AppTheme.c.lightGrey.shade100
                : (_focusNode.hasFocus
                      ? AppTheme.c.primary.shade100
                      : AppTheme.c.white),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? AppTheme.c.primary.main!
                  : AppTheme.c.lightGrey.main!,
            ),
          ),
          child: widget.type == ContainerTextFieldType.multiline
              ? Stack(
                  children: [
                    /// TEXT FIELD
                    FormBuilderTextField(
                      name: widget.name,
                      focusNode: _focusNode,
                      enabled: widget.enabled,
                      readOnly: widget.readOnly,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      textCapitalization: widget.textCapitalization,
                      maxLines: widget.maxLines,
                      maxLength: widget.maxLength,
                      cursorColor: AppTheme.c.primary.main!,
                      style: AppText.b1!.cl(AppTheme.c.text.shade800!),
                      validator: widget.validator,
                      onTap: widget.onTap,
                      onChanged: (value) {
                        setState(() {
                          _text = value ?? '';
                        });
                        widget.onChanged?.call(value);
                      },
                      onTapOutside: widget.onTapOutside
                          ? (_) => FocusScope.of(context).unfocus()
                          : null,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle: AppText.b1!.cl(AppTheme.c.text.main!),
                        border: InputBorder.none,
                        counterText: '',
                        contentPadding: EdgeInsets.only(bottom: 30.h),
                      ),
                    ),

                    /// BOTTOM LEFT COUNTER
                    if (widget.maxLength != null)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Text(
                          '$_currentLength/${widget.maxLength}',
                          style: AppText.b1!.cl(
                            _currentLength >= widget.maxLength!
                                ? AppTheme.c.error.main!
                                : AppTheme.c.text.main!,
                          ),
                        ),
                      ),

                    /// BOTTOM RIGHT DOUBLE SLASH
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/svgs/lines.svg',
                        width: 8.w,
                        height: 9.h,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: widget.name,
                        focusNode: _focusNode,
                        enabled: widget.enabled,
                        readOnly: widget.readOnly,
                        keyboardType: widget.keyboardType,
                        textInputAction: widget.textInputAction,
                        textCapitalization: widget.textCapitalization,
                        maxLines: widget.maxLines,
                        maxLength: widget.maxLength,
                        cursorColor: AppTheme.c.primary.main!,
                        style: AppText.b1!.cl(AppTheme.c.text.shade800!),
                        validator: widget.validator,
                        onTap: widget.onTap,
                        onChanged: widget.onChanged,
                        onTapOutside: widget.onTapOutside
                            ? (_) => FocusScope.of(context).unfocus()
                            : null,
                        decoration: InputDecoration(
                          hintText: widget.hint,
                          hintStyle: AppText.b1!.cl(AppTheme.c.text.main!),
                          border: InputBorder.none,
                          counterText: '',
                        ),
                      ),
                    ),
                    if (widget.type == ContainerTextFieldType.withSuffix &&
                        widget.suffix != null) ...[
                      Space.xf(8),
                      widget.suffix!,
                    ],
                  ],
                ),
        ),
      ],
    );
  }
}
