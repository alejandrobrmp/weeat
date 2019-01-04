import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:we_eat/services/firebase_service.dart';
import 'package:we_eat/themes/apptheme.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  FirebaseUser currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseService().signIn().then((user) => debugPrint('Logg'));
    FirebaseService().onAuthstateChanged().listen((FirebaseUser user) {
      setState(() {
        currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: drawerTheme,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getUserBlock(),
            Divider(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getUserBlock() {
    final Container image = Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange[300]),
      child: _getImage(),
    );

    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/300/?random'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(.8), BlendMode.dstATop),
              ),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.white,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[image, _getUserInfo()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getImage() {
    if (currentUser != null) {
      return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(currentUser.photoUrl), fit: BoxFit.fill)),
      );
    } else {
      return Icon(Icons.person);
    }
  }

  Widget _getUserInfo() {
    if (currentUser != null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              currentUser.displayName,
              style: kMainDrawerNameTextStyle,
            ),
            Text(
              currentUser.email,
              style: kMainDrawerEmailTextStyle,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

//  Widget _getUserBlock() {
//    BoxDecoration boxDecoration = BoxDecoration(
//      gradient: LinearGradient(
//        colors: <Color>[
//          Colors.lightBlue[200],
//          Colors.blueGrey,
//        ],
//        begin: Alignment(.5, 0),
//        end: Alignment(.5, 1),
//      ),
//      boxShadow: <BoxShadow>[
//        BoxShadow(
//          color: Colors.black,
//          blurRadius: 5,
//          spreadRadius: 1,
//        ),
//      ],
//    );
//
//    Widget child = Container();
//
//    if (currentUser != null) {
//      boxDecoration = BoxDecoration(
//        image: DecorationImage(image: NetworkImage(currentUser.photoUrl), fit: BoxFit.cover),
//        boxShadow: <BoxShadow>[
//          BoxShadow(
//            color: Colors.black,
//            blurRadius: 5,
//            spreadRadius: 1,
//          ),
//        ],
//      );
//
//      child = Container(
//        padding: EdgeInsets.only(bottom: 10),
//        decoration: BoxDecoration(
//          gradient: LinearGradient(
//            colors: <Color>[
//              Colors.transparent,
//              Colors.black,
//            ],
//            begin: Alignment(.5, 0),
//            end: Alignment(.5, 1),
//          ),
//        ),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[
//            Text(
//              currentUser.displayName,
//              style: kMainDrawerNameTextStyle,
//            ),
//          ],
//        ),
//      );
//    }
//
//    return Container(
//      height: 220,
//      decoration: boxDecoration,
//      child: child,
//    );
//  }
}
