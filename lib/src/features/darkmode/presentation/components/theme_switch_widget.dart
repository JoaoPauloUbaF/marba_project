import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';

class ThemeSwitchWidget extends ConsumerWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(darkModeProvider);
    return Switch(
      value: ref.watch(darkModeProvider.notifier).isDarkMode(),
      onChanged: (val) {
        ref.read(darkModeProvider.notifier).toggle();
      },
      activeColor: Theme.of(context).colorScheme.onPrimary,
      thumbIcon:
          WidgetStateProperty.resolveWith<Icon?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const Icon(Icons.nightlight_sharp, color: Colors.white);
        }
        return const Icon(Icons.wb_sunny_sharp, color: Colors.yellow);
      }),
    );
  }
}
