import 'package:flutter/material.dart';
import 'package:we_eat/const/strings.dart';
import 'package:we_eat/themes/apptheme.dart';
import 'package:we_eat/widgets/scrollable_text.dart';
import 'package:we_eat/widgets/stepper.dart' as Widgets;

class TutorialScreen extends StatelessWidget {
  Widgets.StepperController c;

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
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Widgets.Stepper(
                  canExit: false,
                  canGoBack: true,
                  onExit: () => debugPrint('Trying exit'),
                  onFinish: () => debugPrint('Trying finish'),
                  titleContent: Text('Tutorial'),
                  steps: <Widget>[
                    _getFirstStep(orientation),
                    _getFirstStep(orientation),
                    _getFirstStep(orientation),
                    _getFirstStep(orientation),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFirstStep(Orientation orientation) {
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
        Image(
          image: AssetImage('assets/images/appicon.png'),
          color: Colors.orange[700],
          height: 200,
          width: 200,
        )
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
    ]);

    return Padding(
      padding: EdgeInsets.all(orientation == Orientation.portrait ? 40 : 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: layout,
      ),
    );
  }
}
