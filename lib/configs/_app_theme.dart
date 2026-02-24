part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    // PRIMARY group
    primary: ColorShades(
      main: const Color(0xFF6B53DD), // primary
      shade100: const Color(0xFFF0EEFC),
      shade200: const Color(0xFFE9E5FA),
      shade300: const Color(0xFFD1CAF4),
      shade500: const Color(0xFF604BC7),
      shade600: const Color(0xFF5642B1),
      shade700: const Color(0xFF503EA6),
      shade800: const Color(0xFF251D4D),
    ),

    // SECONDARY group
    secondary: ColorShades(
      main: const Color(0xFFD5FE3E), // secondary
      shade100: const Color(0xFFFBFFEC),
      shade200: const Color(0xFFF9FFE2),
      shade300: const Color(0xFFF2FFC3),
      shade500: const Color(0xFFC0E538),
      shade600: const Color(0xFFAACB32),
      shade700: const Color(0xFFA0BF2F),
      shade800: const Color(0xFF60721C),
    ),

    // ACCENT group
    accent: AccentColors(
      yellowLight: const Color(0xFFFEFAEB),
      yellow: const Color(0xFFF2CE3A),
      green: const Color(0xFF0A6A2B),
      greenLight: const Color(0xFFE7F0EA),
      red: const Color(0xFFF65555),
    ),

    // BACKGROUND group
    background: ColorShades(
      shade100: const Color(0xFFFEFEFE), //
      shade200: const Color(0xFFFCFCFD), //
      shade400: const Color(0xFFDEDDE0), //
      shade500: const Color(0xFFC5C5C6), //

      main: const Color(0xFFF6F6F7), // background
    ),

    // TEXT group
    text: ColorShades(
      main: const Color(0xFF737B98), // grey
      shade100: const Color(0xFFF1F2F5), //
      shade200: const Color(0xFFEAEBF0), //
      shade300: const Color(0xFFD4D6DF), //
      shade600: const Color(0xFF686F89), //
      shade700: const Color(0xFF454A5B), //
      shade800: const Color(0xFF212529), //
    ),

    // LIGHT GREY group
    lightGrey: ColorShades(
      main: const Color(0xFFE7E6E6), // lightGrey
      shade300: const Color(0xFFF8F5FE), //
      shade200: const Color(0xFFFBFAFF), //
      shade100: const Color(0xFFFDFCFF), //
      shade400: const Color(0xFFD9D9D9), //
      shade500: const Color(0xFF8697AC), //
      shade600: const Color(0xFFE7ECF0), //
    ),

    //Error Group
    error: ColorShades(
      main: Color(0xFFF65555),
      shade100: Color(0xFFFEE6E6),
      shade800: Color(0xFF96132C),
    ),

    // SINGLE COLORS (no shades)
    white: const Color(0xFFFFFFFF), //
    black: const Color(0xFF1B1A1F), //
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static void init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }
}
