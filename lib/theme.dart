import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() => ThemeData(
      primarySwatch: Colors.deepPurple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.grey.shade100,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.purple[900],
          letterSpacing: 0.5,
          ),
      ),
      cardTheme: ThemeData.light().cardTheme.copyWith(
            elevation: 5,
            color: Colors.white,
          ),
    );
