import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_apps/views/places_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 102, 6, 247),
  brightness: Brightness.dark,
  surface: Color.fromARGB(255, 56, 49, 66),
);
final theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.surface,
  // textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
  //   titleSmall: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  //   titleMedium: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  //   titleLarge: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold),
  // ),
);

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Great Place",
      theme: theme,
      home: PlacesScreen(),
    );
  }
}
