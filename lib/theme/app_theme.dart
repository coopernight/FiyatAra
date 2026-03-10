import 'package:flutter/material.dart';

class AppTheme {
  // Ana renkler
  static const Color primary = Color(0xFFFF6B35);
  static const Color primaryDark = Color(0xFFE55A27);
  static const Color secondary = Color(0xFF2D3436);
  static const Color accent = Color(0xFF00B894);
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color error = Color(0xFFE74C3C);

  // Site renkleri
  static const Map<String, Color> siteColors = {
    'trendyol': Color(0xFFFF6B00),
    'hepsiburada': Color(0xFFFF6000),
    'n11': Color(0xFF8B1A1A),
    'amazon': Color(0xFFFF9900),
    'vatan': Color(0xFF003DA5),
    'incehesap': Color(0xFF00A651),
    'teknobiyotik': Color(0xFF7B2D8B),
    'teknosa': Color(0xFFE30613),
    'mediamarkt': Color(0xFFCC0000),
    'boyner': Color(0xFF1A1A1A),
    'beymen': Color(0xFF000000),
    'pttavm': Color(0xFFFFCD00),
  };

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: textPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        cardTheme: CardTheme(
          color: cardBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primary, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintStyle: const TextStyle(color: textSecondary, fontSize: 14),
        ),
      );
}

class SiteInfo {
  static const Map<String, Map<String, dynamic>> sites = {
    'trendyol': {
      'name': 'Trendyol',
      'color': Color(0xFFFF6B00),
      'bgColor': Color(0xFFFFF3E0),
      'icon': '🧡',
    },
    'hepsiburada': {
      'name': 'Hepsiburada',
      'color': Color(0xFFFF6000),
      'bgColor': Color(0xFFFFF3E0),
      'icon': '🟠',
    },
    'n11': {
      'name': 'N11',
      'color': Color(0xFF8B1A1A),
      'bgColor': Color(0xFFFFEBEE),
      'icon': '🔴',
    },
    'amazon': {
      'name': 'Amazon TR',
      'color': Color(0xFFFF9900),
      'bgColor': Color(0xFFFFF8E1),
      'icon': '📦',
    },
    'vatan': {
      'name': 'Vatan',
      'color': Color(0xFF003DA5),
      'bgColor': Color(0xFFE8EEF9),
      'icon': '🔵',
    },
    'incehesap': {
      'name': 'İncehesap',
      'color': Color(0xFF00A651),
      'bgColor': Color(0xFFE8F5E9),
      'icon': '🟢',
    },
    'teknobiyotik': {
      'name': 'Teknobiyotik',
      'color': Color(0xFF7B2D8B),
      'bgColor': Color(0xFFF3E5F5),
      'icon': '🟣',
    },
    'teknosa': {
      'name': 'Teknosa',
      'color': Color(0xFFE30613),
      'bgColor': Color(0xFFFFEBEE),
      'icon': '🔴',
    },
    'mediamarkt': {
      'name': 'Media Markt',
      'color': Color(0xFFCC0000),
      'bgColor': Color(0xFFFFEBEE),
      'icon': '⭕',
    },
    'boyner': {
      'name': 'Boyner',
      'color': Color(0xFF1A1A1A),
      'bgColor': Color(0xFFF5F5F5),
      'icon': '⚫',
    },
    'beymen': {
      'name': 'Beymen',
      'color': Color(0xFF000000),
      'bgColor': Color(0xFFF5F5F5),
      'icon': '🖤',
    },
    'pttavm': {
      'name': 'PTT AVM',
      'color': Color(0xFF996600),
      'bgColor': Color(0xFFFFF9C4),
      'icon': '🟡',
    },
  };
}
