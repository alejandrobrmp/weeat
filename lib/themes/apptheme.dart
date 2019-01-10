import 'package:flutter/material.dart';

// region MAIN
final ThemeData mainTheme = new ThemeData(
  fontFamily: 'Open Sans',
  canvasColor: Colors.orange[200],
  primaryColor: Colors.orange[300],
  // ExpansionTile use the divideColor for dividers when items are expanded (view/user-details)
  dividerColor: Colors.transparent,
  // textTheme: TextTheme(),
);

// endregion MAIN

// region MAIN DRAWER

final ThemeData drawerTheme = mainTheme.copyWith(
  canvasColor: Colors.white,
  dividerColor: Colors.grey,
);

// region TEXT

final TextStyle kMainDrawerNameTextStyle = new TextStyle(color: Colors.black, fontSize: 20);

final TextStyle kMainDrawerEmailTextStyle = new TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500, fontSize: 12);

// endregion TEXT

// endregion MAIN DRAWER

// region LOGIN SCREEN

final ThemeData loginTheme = mainTheme.copyWith();

// region TEXT

final TextStyle kLoginScreenTitleTextStyle = new TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

// endregion TEXT

// endregion LOGIN SCREEN

// region TUTORIAL SCREEN

final ThemeData tutorialTheme = mainTheme.copyWith();

// region TEXT

final TextStyle kTutorialScreenTitleTextStyle = new TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

final TextStyle kTutorialScreenBodyTextStyle = new TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

// endregion TEXT

// endregion TUTORIAL SCREEN

// region HOME SCREEN

final ThemeData homeTheme = mainTheme.copyWith();

// endregion HOME SCREEN

// region WIDGETS

// region SELECTABLE_BUTTON

final TextStyle kIconButtonSelectedTextStyle = new TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: mainTheme.accentColor
);

final TextStyle kIconButtonTextStyle = new TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black
);

// endregion SELECTABLE_BUTTON

// endregion WIDGETS
