import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281559360),
      surfaceTint: Color(4281559360),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290113981),
      onPrimaryContainer: Color(4278198539),
      secondary: Color(4284113695),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292799126),
      onSecondaryContainer: Color(4279836160),
      tertiary: Color(4280314445),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289327821),
      onTertiaryContainer: Color(4278198548),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294376434),
      onBackground: Color(4279770392),
      surface: Color(4294376434),
      onSurface: Color(4279770392),
      surfaceVariant: Color(4292732378),
      onSurfaceVariant: Color(4282468673),
      outline: Color(4285626736),
      outlineVariant: Color(4290890174),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inverseOnSurface: Color(4293849834),
      inversePrimary: Color(4288271522),
      primaryFixed: Color(4290113981),
      onPrimaryFixed: Color(4278198539),
      primaryFixedDim: Color(4288271522),
      onPrimaryFixedVariant: Color(4279849258),
      secondaryFixed: Color(4292799126),
      onSecondaryFixed: Color(4279836160),
      secondaryFixedDim: Color(4290956669),
      onSecondaryFixedVariant: Color(4282534663),
      tertiaryFixed: Color(4289327821),
      onTertiaryFixed: Color(4278198548),
      tertiaryFixedDim: Color(4287485362),
      onTertiaryFixedVariant: Color(4278210872),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294376434),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047213),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257953),
      surfaceContainerHighest: Color(4292863196),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279520551),
      surfaceTint: Color(4281559360),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283007061),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282271491),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285561395),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209844),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282024291),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294376434),
      onBackground: Color(4279770392),
      surface: Color(4294376434),
      onSurface: Color(4279770392),
      surfaceVariant: Color(4292732378),
      onSurfaceVariant: Color(4282205501),
      outline: Color(4284047705),
      outlineVariant: Color(4285889908),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inverseOnSurface: Color(4293849834),
      inversePrimary: Color(4288271522),
      primaryFixed: Color(4283007061),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281362238),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285561395),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283916573),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282024291),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280117323),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294376434),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047213),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257953),
      surfaceContainerHighest: Color(4292863196),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200591),
      surfaceTint: Color(4281559360),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279520551),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280231168),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282271491),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200346),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209844),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294376434),
      onBackground: Color(4279770392),
      surface: Color(4294376434),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292732378),
      onSurfaceVariant: Color(4280231455),
      outline: Color(4282205501),
      outlineVariant: Color(4282205501),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4290706374),
      primaryFixed: Color(4279520551),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203669),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282271491),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280889344),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209844),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203426),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294376434),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047213),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257953),
      surfaceContainerHighest: Color(4292863196),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288271522),
      surfaceTint: Color(4288271522),
      onPrimary: Color(4278204695),
      primaryContainer: Color(4279849258),
      onPrimaryContainer: Color(4290113981),
      secondary: Color(4290956669),
      onSecondary: Color(4281152512),
      secondaryContainer: Color(4282534663),
      onSecondaryContainer: Color(4292799126),
      tertiary: Color(4287485362),
      onTertiary: Color(4278204453),
      tertiaryContainer: Color(4278210872),
      onTertiaryContainer: Color(4289327821),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279244048),
      onBackground: Color(4292863196),
      surface: Color(4279244048),
      onSurface: Color(4292863196),
      surfaceVariant: Color(4282468673),
      onSurfaceVariant: Color(4290890174),
      outline: Color(4287337353),
      outlineVariant: Color(4282468673),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292863196),
      inverseOnSurface: Color(4281152044),
      inversePrimary: Color(4281559360),
      primaryFixed: Color(4290113981),
      onPrimaryFixed: Color(4278198539),
      primaryFixedDim: Color(4288271522),
      onPrimaryFixedVariant: Color(4279849258),
      secondaryFixed: Color(4292799126),
      onSecondaryFixed: Color(4279836160),
      secondaryFixedDim: Color(4290956669),
      onSecondaryFixedVariant: Color(4282534663),
      tertiaryFixed: Color(4289327821),
      onTertiaryFixed: Color(4278198548),
      tertiaryFixedDim: Color(4287485362),
      onTertiaryFixedVariant: Color(4278210872),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280691494),
      surfaceContainerHighest: Color(4281415217),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288600486),
      surfaceTint: Color(4288271522),
      onPrimary: Color(4278197000),
      primaryContainer: Color(4284849519),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291220096),
      onSecondary: Color(4279506944),
      secondaryContainer: Color(4287403852),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4287748790),
      onTertiary: Color(4278197008),
      tertiaryContainer: Color(4283997822),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279244048),
      onBackground: Color(4292863196),
      surface: Color(4279244048),
      onSurface: Color(4294507764),
      surfaceVariant: Color(4282468673),
      onSurfaceVariant: Color(4291153347),
      outline: Color(4288521627),
      outlineVariant: Color(4286481788),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292863196),
      inverseOnSurface: Color(4280691494),
      inversePrimary: Color(4279915052),
      primaryFixed: Color(4290113981),
      onPrimaryFixed: Color(4278195461),
      primaryFixedDim: Color(4288271522),
      onPrimaryFixedVariant: Color(4278271771),
      secondaryFixed: Color(4292799126),
      onSecondaryFixed: Color(4279177984),
      secondaryFixedDim: Color(4290956669),
      onSecondaryFixedVariant: Color(4281481728),
      tertiaryFixed: Color(4289327821),
      onTertiaryFixed: Color(4278195468),
      tertiaryFixedDim: Color(4287485362),
      onTertiaryFixedVariant: Color(4278206250),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280691494),
      surfaceContainerHighest: Color(4281415217),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293984237),
      surfaceTint: Color(4288271522),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288600486),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294574028),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291220096),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293853171),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287748790),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279244048),
      onBackground: Color(4292863196),
      surface: Color(4279244048),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468673),
      onSurfaceVariant: Color(4294311410),
      outline: Color(4291153347),
      outlineVariant: Color(4291153347),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292863196),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202900),
      primaryFixed: Color(4290377153),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288600486),
      onPrimaryFixedVariant: Color(4278197000),
      secondaryFixed: Color(4293062298),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291220096),
      onSecondaryFixedVariant: Color(4279506944),
      tertiaryFixed: Color(4289590993),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287748790),
      onTertiaryFixedVariant: Color(4278197008),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280691494),
      surfaceContainerHighest: Color(4281415217),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
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

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
