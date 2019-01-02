import 'package:flutter/material.dart';
import 'package:we_eat/const/strings.dart';
import 'package:we_eat/themes/apptheme.dart';
import 'package:we_eat/widgets/scrollable-text.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Theme(
          data: tutorialTheme,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    return Column(
                      // Single Child
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: getLayout(orientation),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getLayout(Orientation orientation) {
    List<Widget> layout = List<Widget>();

    layout.addAll(<Widget>[
      Text(
        Strings.loginScreenTitleText,
        textAlign: TextAlign.center,
        style: kTutorialScreenTitleTextStyle,
      )
    ]);

    if (orientation == Orientation.portrait) {
      layout.addAll(<Widget>[
        Image(image: AssetImage('assets/images/appicon.png'), color: Colors.orange[700], height: 200, width: 200,)
      ]);
    }

    layout.addAll(<Widget>[
      ScrollableTextFlexible(
        text: Text(
          Strings.loginScreenBodyText,
          textAlign: TextAlign.justify,
          style: kTutorialScreenBodyTextStyle,
        ),
      ),
      RaisedButton(
        child: Text('BUTTON'),
        onPressed: () => debugPrint('sadasd'),
      )
    ]);

    return layout;
  }

}
