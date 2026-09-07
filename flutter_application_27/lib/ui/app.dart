import 'package:flutter/material.dart';
import 'package:flutter_application_27/providers/theme_provider.dart';
import 'package:flutter_application_27/theme/theme_app.dart';
import 'package:flutter_application_27/ui/user_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      title: 'Material App',
      home: const UserView(), // reemplaza por tu pantalla inicial
    );
  }
}
