import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pract/configs/configs.dart';

part 'enums.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isDisabled;
  final Color? backgroundColor;
  final double? height;
  final Color? textColor;
  final TextStyle? textStyle;
  final ButtonType? buttonType;
  final String? iconPath;
  final Color? borderColor;
  final double? iconSize;
  final VoidCallback? onDoubleTap;
  final Color? iconColor;
  final double? horizontalPadding;
  final double? spaceBetweenIconAndText;
  final bool hasShadow;
  final double? verticalPadding;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.height,
    this.backgroundColor,
    this.textStyle,
    this.buttonType = ButtonType.primary,
    this.isDisabled = false,
    super.key,
    this.textColor,
    this.iconPath,
    this.borderColor,
    this.iconSize,
    this.onDoubleTap,
    this.iconColor,
    this.horizontalPadding,
    this.spaceBetweenIconAndText,
    this.hasShadow = false,
    this.verticalPadding,
  });

  bool get _isOutlined =>
      buttonType == ButtonType.outlined ||
      buttonType == ButtonType.outlinedWithIconLeft ||
      buttonType == ButtonType.outlinedWithIconRight;

  bool get _hasIconLeft =>
      buttonType == ButtonType.primaryWithIconLeft ||
      buttonType == ButtonType.outlinedWithIconLeft;

  bool get _hasIconRight =>
      buttonType == ButtonType.primaryWithIconRight ||
      buttonType == ButtonType.outlinedWithIconRight;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: isDisabled ? () {} : onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: UIProps.buttonRadius,
          color: isDisabled
              ? AppTheme.c.lightGrey.main!
              : _isOutlined
              ? backgroundColor ?? AppTheme.c.white!
              : backgroundColor ?? AppTheme.c.primary.main!,
          border: _isOutlined
              ? Border.all(
                  color: isDisabled
                      ? Color(0xFFE5E9F7)
                      : borderColor ?? AppTheme.c.lightGrey.main!,
                  width: 1.w,
                )
              : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Color(0x0F0D0D12),
                    blurRadius: 2,
                    offset: Offset(0.w, 1),
                  ),
                ]
              : null,
        ),
        padding: Space.vf(verticalPadding ?? 16.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon on the left
            if (_hasIconLeft)
              Row(
                children: [
                  iconColor != null
                      ? SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 20.w,
                          height: iconSize ?? 20.h,
                          colorFilter: ColorFilter.mode(
                            isDisabled
                                ? AppTheme.c.lightGrey.main!
                                : iconColor!,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 20.w,
                          height: iconSize ?? 20.h,
                        ),
                  SizedBox(width: spaceBetweenIconAndText ?? 8.w),
                ],
              ),

            // Label text
            Text(
              label,
              style: isDisabled
                  ? textStyle?.copyWith(color: AppTheme.c.text.main!) ??
                        AppText.h5b!.cl(AppTheme.c.text.main!)
                  : textStyle ??
                        AppText.h5b!
                            .cl(
                              textColor ??
                                  (_isOutlined
                                      ? AppTheme.c.text.shade800!
                                      : AppTheme.c.white!),
                            )
                            .copyWith(height: 1.5),
            ),

            // Icon on the right
            if (_hasIconRight)
              Row(
                children: [
                  SizedBox(width: spaceBetweenIconAndText ?? 8.w),
                  iconColor != null
                      ? SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 20.w,
                          height: iconSize ?? 20.h,
                          colorFilter: ColorFilter.mode(
                            isDisabled
                                ? AppTheme.c.lightGrey.main!
                                : iconColor!,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 20.w,
                          height: iconSize ?? 20.h,
                        ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
