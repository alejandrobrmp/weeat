import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:we_eat/models/pub.dart';
import 'package:we_eat/models/user.dart';
import 'package:we_eat/services/firebase_service.dart';
import 'package:we_eat/themes/apptheme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<FirebaseUser> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _future = FirebaseService().signIn();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: FutureBuilder<FirebaseUser>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Theme(
              data: loginTheme,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column( // Single Child
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(snapshot.data.displayName)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

