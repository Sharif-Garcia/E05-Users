import 'package:flutter/material.dart';
import 'package:flutter_application_27/theme/color_tokens.dart';

class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);
  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.seed,
          brightness: brightness,
        ).copyWith(
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          surface: colors.surface,
          onSurface: colors.onSurface,
          error: colors.error,
        );

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colors.onBackground,
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: colors.surface,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),

      chipTheme: ChipThemeData(
        elevation: 0,
        showCheckmark: false,
        side: BorderSide.none,
        backgroundColor: colors.surfaceVariant,
      ),

      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        iconColor: colors.primary,
        textColor: colors.onSurface,
      ),

      dividerTheme: DividerThemeData(color: colors.border),
    );
  }
}
