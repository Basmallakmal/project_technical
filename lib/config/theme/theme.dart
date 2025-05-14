import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

export 'colors.dart';

final ThemeData kappTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData(useMaterial3: false);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kappGreen,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}