import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff166683),
      surfaceTint: Color(0xff166683),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc0e8ff),
      onPrimaryContainer: Color(0xff001e2b),
      secondary: Color(0xff4d616c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd0e6f3),
      onSecondaryContainer: Color(0xff091e27),
      tertiary: Color(0xff5e5a7d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe4dfff),
      onTertiaryContainer: Color(0xff1b1736),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff171c1f),
      onSurfaceVariant: Color(0xff40484c),
      outline: Color(0xff71787d),
      outlineVariant: Color(0xffc0c7cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff8dcff1),
      primaryFixed: Color(0xffc0e8ff),
      onPrimaryFixed: Color(0xff001e2b),
      primaryFixedDim: Color(0xff8dcff1),
      onPrimaryFixedVariant: Color(0xff004d66),
      secondaryFixed: Color(0xffd0e6f3),
      onSecondaryFixed: Color(0xff091e27),
      secondaryFixedDim: Color(0xffb4cad6),
      onSecondaryFixedVariant: Color(0xff364954),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff1b1736),
      tertiaryFixedDim: Color(0xffc8c2ea),
      onTertiaryFixedVariant: Color(0xff464364),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe4e9ec),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004960),
      surfaceTint: Color(0xff166683),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff357c9b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff324550),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff637783),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff423f60),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff757094),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff171c1f),
      onSurfaceVariant: Color(0xff3c4448),
      outline: Color(0xff596065),
      outlineVariant: Color(0xff747c81),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff8dcff1),
      primaryFixed: Color(0xff357c9b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff116381),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff637783),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4b5f6a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff757094),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5c587b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe4e9ec),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002634),
      surfaceTint: Color(0xff166683),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004960),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff10252e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff324550),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff211e3d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff423f60),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1e2529),
      outline: Color(0xff3c4448),
      outlineVariant: Color(0xff3c4448),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xffd6f0ff),
      primaryFixed: Color(0xff004960),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003142),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff324550),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1b2f39),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff423f60),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2c2948),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe4e9ec),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8dcff1),
      surfaceTint: Color(0xff8dcff1),
      onPrimary: Color(0xff003547),
      primaryContainer: Color(0xff004d66),
      onPrimaryContainer: Color(0xffc0e8ff),
      secondary: Color(0xffb4cad6),
      onSecondary: Color(0xff1f333d),
      secondaryContainer: Color(0xff364954),
      onSecondaryContainer: Color(0xffd0e6f3),
      tertiary: Color(0xffc8c2ea),
      onTertiary: Color(0xff302d4c),
      tertiaryContainer: Color(0xff464364),
      onTertiaryContainer: Color(0xffe4dfff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffdfe3e7),
      onSurfaceVariant: Color(0xffc0c7cd),
      outline: Color(0xff8a9297),
      outlineVariant: Color(0xff40484c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff166683),
      primaryFixed: Color(0xffc0e8ff),
      onPrimaryFixed: Color(0xff001e2b),
      primaryFixedDim: Color(0xff8dcff1),
      onPrimaryFixedVariant: Color(0xff004d66),
      secondaryFixed: Color(0xffd0e6f3),
      onSecondaryFixed: Color(0xff091e27),
      secondaryFixedDim: Color(0xffb4cad6),
      onSecondaryFixedVariant: Color(0xff364954),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff1b1736),
      tertiaryFixedDim: Color(0xffc8c2ea),
      onTertiaryFixedVariant: Color(0xff464364),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff303539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff91d3f5),
      surfaceTint: Color(0xff8dcff1),
      onPrimary: Color(0xff001923),
      primaryContainer: Color(0xff5599b8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb9cedb),
      onSecondary: Color(0xff041922),
      secondaryContainer: Color(0xff7f94a0),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffccc6ee),
      onTertiary: Color(0xff151231),
      tertiaryContainer: Color(0xff918cb2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1417),
      onSurface: Color(0xfff7fbff),
      onSurfaceVariant: Color(0xffc4ccd1),
      outline: Color(0xff9ca4a9),
      outlineVariant: Color(0xff7d8489),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff004e67),
      primaryFixed: Color(0xffc0e8ff),
      onPrimaryFixed: Color(0xff00131c),
      primaryFixedDim: Color(0xff8dcff1),
      onPrimaryFixedVariant: Color(0xff003b4f),
      secondaryFixed: Color(0xffd0e6f3),
      onSecondaryFixed: Color(0xff00131c),
      secondaryFixedDim: Color(0xffb4cad6),
      onSecondaryFixedVariant: Color(0xff253943),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff100d2b),
      tertiaryFixedDim: Color(0xffc8c2ea),
      onTertiaryFixedVariant: Color(0xff363252),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff303539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff7fbff),
      surfaceTint: Color(0xff8dcff1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff91d3f5),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff7fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb9cedb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffef9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffccc6ee),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff7fbff),
      outline: Color(0xffc4ccd1),
      outlineVariant: Color(0xffc4ccd1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff002e3e),
      primaryFixed: Color(0xffcaecff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff91d3f5),
      onPrimaryFixedVariant: Color(0xff001923),
      secondaryFixed: Color(0xffd5eaf7),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb9cedb),
      onSecondaryFixedVariant: Color(0xff041922),
      tertiaryFixed: Color(0xffe9e3ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffccc6ee),
      onTertiaryFixedVariant: Color(0xff151231),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff303539),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
