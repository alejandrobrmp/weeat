import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_eat/const/shared_preferences_references.dart';
import 'package:we_eat/services/firebase_service.dart';
import 'package:we_eat/themes/apptheme.dart';
import 'package:we_eat/views/home_screen.dart';
import 'package:we_eat/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_eat/views/tutorial_screen.dart';

void main() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool tutorialCompleted = preferences.getBool(SharedPreferencesReferences.BOOL_INITIAL_TUTORIAL);
  startApp(HomeScreen());
//  if (tutorialCompleted == null || !tutorialCompleted) {
//    startApp(TutorialScreen());
//  } else {
//    FirebaseUser user = await FirebaseService().currentFirebaseUser();
//
//    if (user != null) {
//      startApp(HomeScreen());
//    } else {
//      startApp(LoginScreen());
//    }
//  }
}

void startApp(Widget home) => runApp(WeEatApp(home: home,));

class WeEatApp extends StatelessWidget {

  Widget home;

  WeEatApp({this.home});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'We eat',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Theme(
          data: mainTheme,
          child: ScrollConfiguration(behavior: DontOverscroll(), child: child),
        );
      },
      routes: <String, WidgetBuilder> {
        '/tutorial': (BuildContext context) => TutorialScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/home': (BuildContext context) => HomeScreen()
      },
      home: home
    );
  }
}

class DontOverscroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
