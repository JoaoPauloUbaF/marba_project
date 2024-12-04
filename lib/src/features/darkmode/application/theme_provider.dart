import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeNotifier extends StateNotifier<ThemeMode> {
  DarkModeNotifier() : super(ThemeMode.light);

  void toggle() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  bool isDarkMode() {
    return state == ThemeMode.dark;
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, ThemeMode>(
  (ref) => DarkModeNotifier(),
);
