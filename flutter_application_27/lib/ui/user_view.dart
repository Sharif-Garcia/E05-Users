import 'package:flutter/material.dart';
import 'package:flutter_application_27/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserView extends ConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuarios'),
        actions: [
          IconButton(
            icon: Icon(_iconoPara(themeMode)),
            tooltip: 'Cambiar tema',
            onPressed: () {
              ref.read(themeModeProvider.notifier).alternar();
            },
          ),
        ],
      ),
      body: const Column(
        children: [CategoriaColores(), Divider(height: 1), MisUsuarios()],
      ),
    );
  }

  IconData _iconoPara(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.dark_mode_outlined,
      ThemeMode.dark => Icons.light_mode_outlined,
      ThemeMode.system => Icons.brightness_auto_outlined,
    };
  }
}

class MisUsuarios extends StatelessWidget {
  const MisUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: MisColores(),
            title: Text('Usuario #$index'),
          );
        },
      ),
    );
  }
}

class CategoriaColores extends StatelessWidget {
  const CategoriaColores({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [MisColores()]);
  }
}

class MisColores extends StatelessWidget {
  const MisColores({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(child: Icon(Icons.abc), radius: 20),
    );
  }
}
