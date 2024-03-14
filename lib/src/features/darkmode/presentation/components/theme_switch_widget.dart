import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';

class ThemeSwitchWidget extends ConsumerWidget {
  const ThemeSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(darkModeProvider);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Switch(
        value: ref.watch(darkModeProvider.notifier).isDarkMode(),
        onChanged: (val) {
          ref.read(darkModeProvider.notifier).toggle();
        },
        thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const Icon(Icons.nightlight_sharp);
          }
          return const Icon(Icons.wb_sunny_sharp);
        }),
      ),
    );
  }
}
