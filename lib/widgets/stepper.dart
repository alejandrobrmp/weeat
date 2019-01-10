import 'package:flutter/material.dart';
import 'package:we_eat/const/strings.dart';

class StepperController {
  Function(int) onStepChange;
  Function(bool) onSetCanNext;

  void setCanNext(bool value) {
    if (onSetCanNext != null) {
      onSetCanNext(value);
    }
  }

  StepperController({this.onStepChange, this.onSetCanNext});

}
PageController a;

enum StepperType {
  None,
  Custom,
  Default
}

class Stepper extends StatefulWidget {
  StepperType titleType;
  StepperType bottomType;

  Widget titleContent;
  Widget bottomContent;

  int initialStep;
  StepperController controller;
  List<Widget> steps;
  Function onFinish;
  bool canGoBack;
  bool canExit;
  Function onExit;
  double elevation;

  Stepper({
    this.titleType = StepperType.Default,
    this.titleContent,
    this.bottomType = StepperType.Default,
    this.bottomContent,
    this.initialStep = 0,
    this.onFinish,
    this.canGoBack = true,
    this.canExit = true,
    this.onExit,
    this.controller, // TODO: Default
    this.steps,
    this.elevation = 5
  }) {
    if (controller == null) {
      controller = StepperController();
    }
  }

  @override
  _StepperState createState() => _StepperState(currentStep: initialStep);

  // TODO: Static screen (scaffold)
}

class _StepperState extends State<Stepper> {
  int currentStep;

  bool canNext = true;
  PageController pageController;

  _StepperState({this.currentStep});

  @override
  void initState() {
    super.initState();

    widget.controller.onStepChange = (int step) {
      setState(() {});
    };

    if (widget.bottomType == StepperType.Default) {
      widget.controller.onSetCanNext = (bool value) {
        setState(() {
          canNext = value;
        });
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _getTitle(),
        Flexible(child: _getContent()),
        _getBottomContent()
      ],
    );
  }

  Widget _getTitle() {
    bool isFirstStep = currentStep == 0;
    bool backButtonEnabled = isFirstStep ? widget.canExit : true;
    Container backArrow = !widget.canGoBack ? Container(width: 20, height: 50,) : Container(
      height: 50,
      width: 50,
      child: Center(
        child: IconButton(icon: Icon(Icons.arrow_back), onPressed: !backButtonEnabled ? null : () {
          if (isFirstStep) {
            if (widget.onExit != null) {
              widget.onExit();
            }
          } else {
            _changeStep(this.currentStep - 1);
          }
        }),
      ),
    );

    Widget defaultTitle = Material(
      elevation: widget.elevation,
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            backArrow,
            Text('${Strings.stepperDefaultTitleText} ${this.currentStep.toString()}'),
          ],
        ),
      ),
    );

    switch (widget.titleType) {
      case StepperType.Default:
        return defaultTitle;
      case StepperType.Custom:
        return widget.titleContent;
      case StepperType.None:
        return Container();
    }
  }

  Widget _getContent() {
    return PageView.builder(
      itemCount: widget.steps.length,
      itemBuilder: (context, index) {
        return widget.steps[index];
      },
      controller: pageController = PageController(
        initialPage: widget.initialStep
      ),
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _getBottomContent() {
    Widget defaultBottomContent = Material(
      elevation: widget.elevation,
      child: Container(
        child: RaisedButton(
          child: Text(widget.steps.length - 1 == currentStep ? Strings.stepperNextButtonFinalText : Strings.stepperNextButtonNextText),
          onPressed: !canNext ? null : () {
            if (widget.steps.length - 1 == currentStep) {
              if (widget.onFinish != null) {
                widget.onFinish();
              }
            } else {
              _changeStep(this.currentStep + 1);
            }
          },
        ),
      ),
    );

    switch (widget.bottomType) {
      case StepperType.Default:
        return defaultBottomContent;
      case StepperType.Custom:
        return widget.titleContent;
      case StepperType.None:
        return Container();
    }
  }

  void _changeStep(int step) {
    this.currentStep = step;
    this.pageController.animateToPage(currentStep, duration: Duration(milliseconds: 300), curve: Curves.easeInOut).then((_) {
      if (widget.controller.onStepChange != null) {
        widget.controller.onStepChange(this.currentStep);
      }
    });
  }

}
