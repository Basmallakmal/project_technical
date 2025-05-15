import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'colors.dart';
export '../multilanguage/language_value.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme mediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c44),
      surfaceTint: Color(0xff006874),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff187884),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223a3e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff597176),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2a3553),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff616c8d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff0c1213),
      onSurfaceVariant: Color(0xff2f3839),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f70),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff82d3e0),
      primaryFixed: Color(0xff187884),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005e68),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff597176),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff41595d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff616c8d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff495473),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe3e9ea),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd3d4),
    );
  }

  ThemeData mainTheme() {
    return theme(mediumContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );
}

TextTheme createTextTheme(BuildContext context) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.poppinsTextTheme(baseTextTheme);

  TextTheme displayTextTheme = GoogleFonts.poppinsTextTheme(baseTextTheme);

  TextTheme textTheme = displayTextTheme.copyWith(
    displayLarge: bodyTextTheme.displayLarge!.copyWith(fontSize: 57),
    displayMedium: bodyTextTheme.displayMedium!.copyWith(fontSize: 45),
    displaySmall: bodyTextTheme.displaySmall!.copyWith(fontSize: 36),
    headlineLarge: bodyTextTheme.headlineLarge!.copyWith(fontSize: 32),
    headlineMedium: bodyTextTheme.headlineMedium!.copyWith(fontSize: 28),
    headlineSmall: bodyTextTheme.headlineSmall!.copyWith(fontSize: 24),
    titleLarge: bodyTextTheme.titleLarge!.copyWith(fontSize: 22),
    titleMedium: bodyTextTheme.titleMedium!.copyWith(fontSize: 16),
    titleSmall: bodyTextTheme.titleSmall!.copyWith(fontSize: 14),
    bodyLarge: bodyTextTheme.bodyLarge!.copyWith(fontSize: 16),
    bodyMedium: bodyTextTheme.bodyMedium!.copyWith(fontSize: 14),
    bodySmall: bodyTextTheme.bodySmall!.copyWith(fontSize: 12),
    labelLarge: bodyTextTheme.labelLarge!.copyWith(fontSize: 14),
    labelMedium: bodyTextTheme.labelMedium!.copyWith(fontSize: 12),
    labelSmall: bodyTextTheme.labelSmall!.copyWith(fontSize: 11),
  );
  return textTheme;
}
