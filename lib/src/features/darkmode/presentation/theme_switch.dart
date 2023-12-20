import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(darkModeProvider);
    return Positioned(
      top: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Switch.adaptive(
          value: ref.watch(darkModeProvider.notifier).isDarkMode(),
          onChanged: (val) {
            ref.read(darkModeProvider.notifier).toggle();
          },
        ),
      ),
    );
  }
}
