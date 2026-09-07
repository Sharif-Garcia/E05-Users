import 'package:flutter/material.dart';

/// Paleta cruda del sistema. No se usa directamente en widgets:
/// se usa siempre a través de los tokens semánticos de [AppColors].
class _Palette {
  static const seed = Color.fromARGB(255, 135, 61, 254);

  static const purple50 = Color(0xFFF3EEFF);
  static const purple500 = Color(0xFF873DFE);
  static const purple900 = Color(0xFF2E0F73);

  static const neutral0 = Color(0xFFFFFFFF);
  static const neutral50 = Color(0xFFF7F7F9);
  static const neutral200 = Color(0xFFE2E2E6);
  static const neutral500 = Color(0xFF8C8C94);
  static const neutral800 = Color(0xFF232326);
  static const neutral900 = Color(0xFF141416);

  static const error500 = Color(0xFFDC3545);
  static const success500 = Color(0xFF2E9E5B);
}

/// Tokens semánticos: lo que la UI realmente consume.
/// Cada nombre describe un ROL (qué representa), no un color literal.
class AppColors {
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color primary;
  final Color onPrimary;
  final Color onBackground;
  final Color onSurface;
  final Color border;
  final Color error;
  final Color success;

  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.primary,
    required this.onPrimary,
    required this.onBackground,
    required this.onSurface,
    required this.border,
    required this.error,
    required this.success,
  });

  static const light = AppColors(
    background: _Palette.neutral50,
    surface: _Palette.neutral0,
    surfaceVariant: _Palette.purple50,
    primary: _Palette.purple500,
    onPrimary: _Palette.neutral0,
    onBackground: _Palette.neutral900,
    onSurface: _Palette.neutral900,
    border: _Palette.neutral200,
    error: _Palette.error500,
    success: _Palette.success500,
  );

  static const dark = AppColors(
    background: _Palette.neutral900,
    surface: _Palette.neutral800,
    surfaceVariant: _Palette.purple900,
    primary: _Palette.purple500,
    onPrimary: _Palette.neutral0,
    onBackground: _Palette.neutral0,
    onSurface: _Palette.neutral0,
    border: _Palette.neutral500,
    error: _Palette.error500,
    success: _Palette.success500,
  );

  /// Semilla usada por ColorScheme.fromSeed en app_theme.dart
  static const seed = _Palette.seed;
}
