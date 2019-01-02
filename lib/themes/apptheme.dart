import 'package:flutter/material.dart';

// THEMES


// MAIN
final ThemeData mainTheme = new ThemeData(
  fontFamily: 'Open Sans',
  canvasColor: Colors.orange[200],
  primaryColor: Colors.orange[300],
  // ExpansionTile use the divideColor for dividers when items are expanded (view/user-details)
  dividerColor: Colors.transparent,
  // textTheme: TextTheme(),
);

// LOGIN SCREEN

final ThemeData loginTheme = mainTheme.copyWith();

// TEXT

final TextStyle kLoginScreenTitleTextStyle = new TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

// TUTORIAL SCREEN

final ThemeData tutorialTheme = mainTheme.copyWith();

// TEXT

final TextStyle kTutorialScreenTitleTextStyle = new TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

final TextStyle kTutorialScreenBodyTextStyle = new TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

// HOME SCREEN

final ThemeData homeTheme = mainTheme.copyWith();
