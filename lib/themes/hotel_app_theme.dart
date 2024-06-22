import 'package:hotel_app/main.dart';
import 'package:flutter/material.dart';

class HotelAppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontName),
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontName),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontName),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontName),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontName),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontName),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    final Color primaryColor = HexColor('#00A1FF');
    final Color normalColor = HexColor('#011019');
    final Color secondaryColor = HexColor('#012940');
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      tertiary: normalColor,
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Color(0xff011019),
      scaffoldBackgroundColor: const Color(0xFF012940),
      buttonTheme: ButtonThemeData(
          buttonColor: primaryColor, textTheme: ButtonTextTheme.normal),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff011019)),
        foregroundColor: MaterialStateProperty.all<Color>(Color(0xff011019)),
      )),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
      colorScheme: colorScheme
          .copyWith(background: const Color(0xFF011019))
          .copyWith(error: const Color(0xFFB00020)),
    );
  }
}
