import 'package:flutter/material.dart';
import 'package:we_eat/themes/apptheme.dart';
import 'package:we_eat/views/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: MainDrawer(),
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Theme(
          data: homeTheme,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column( // Single Child
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('HOME')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}