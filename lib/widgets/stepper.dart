import 'package:flutter/material.dart';
import 'package:we_eat/const/strings.dart';

class StepperController {
  final int initialStep;
  int currentStep;

  Function(int) onStepChange;
  Function(bool) onSetCanNext;

  void setCanNext(bool value) {
    if (onSetCanNext != null) {
      onSetCanNext(value);
    }
  }

  StepperController({this.initialStep = 0, this.onStepChange, this.onSetCanNext}) { this.currentStep = this.initialStep; }
}

enum StepperType { None, Default }

class Stepper extends StatefulWidget {
  StepperType titleType;
  StepperType bottomType;

  Widget titleContent;
  Widget bottomContent;

  Gradient gradient;

  StepperController controller;
  List<Widget> steps;
  Function onFinish;
  bool canGoBack;
  bool canExit;
  Function onExit;
  double elevation;

  Stepper(
      {this.titleType = StepperType.Default,
      this.titleContent,
      this.bottomType = StepperType.Default,
      this.bottomContent,
      this.gradient,
      this.onFinish,
      this.canGoBack = true,
      this.canExit = true,
      this.onExit,
      this.controller, // TODO: Default
      this.steps,
      this.elevation = 5});

  @override
  _StepperState createState() => _StepperState(
        controller: controller != null ? controller : StepperController(),
      );
}

class _StepperState extends State<Stepper> {
  final StepperController controller;

  bool canNext = true;
  PageController pageController;

  _StepperState({this.controller});

  Future<bool> _onWillPop() async {
    bool isFirstStep = controller.currentStep == 0;

    if (isFirstStep) {
      return widget.canExit;
    } else {
      if (widget.canGoBack) {
        _changeStep(this.controller.currentStep - 1);
      }
      return false;
    }

  }

  @override
  void initState() {
    super.initState();

    if (widget.bottomType == StepperType.Default) {
      controller.onSetCanNext = (bool value) {
        setState(() {
          canNext = value;
        });
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[_getTitle(), Flexible(child: Container(child: _getContent())), _getBottomContent()],
      ),
    );
  }

  Widget _getTitle() {
    if (widget.titleType == StepperType.None) {
      return Container();
    }

    bool isFirstStep = controller.currentStep == 0;
    bool backButtonEnabled = isFirstStep ? widget.canExit : true;
    Container backArrow = !widget.canGoBack
        ? Container(
            width: 20,
            height: 50,
          )
        : Container(
            height: 50,
            width: 50,
            child: Center(
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: !backButtonEnabled
                      ? null
                      : () {
                          if (isFirstStep) {
                            if (widget.onExit != null) {
                              widget.onExit();
                            }
                          } else {
                            _changeStep(this.controller.currentStep - 1);
                          }
                        }),
            ),
          );

    Widget content = Container();

    switch (widget.titleType) {
      case StepperType.Default:
        content = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            backArrow,
            widget.titleContent != null ? widget.titleContent : Text('${Strings.stepperDefaultTitleText} ${this.controller.currentStep.toString()}'),
          ],
        );
        break;
      case StepperType.None:
        break;
      default:
        break;
    }

    return Container(
      decoration: _getElevation(top: true),
      child: Container(
        height: 50,
        decoration: _getColor(),
        child: content,
      ),
    );
  }

  Widget _getContent() {
    return PageView.builder(
      itemCount: widget.steps.length,
      itemBuilder: (context, index) {
        return widget.steps[index];
      },
      controller: pageController = PageController(initialPage: controller.initialStep),
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _getBottomContent() {
    if (widget.bottomType == StepperType.None) {
      return Container();
    }

    Widget content = Container();

    switch (widget.bottomType) {
      case StepperType.Default:
        content = widget.bottomContent != null ? widget.bottomContent : Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: RaisedButton(
            child: Text(widget.steps.length - 1 == controller.currentStep ? Strings.stepperNextButtonFinalText : Strings.stepperNextButtonNextText),
            onPressed: !canNext
                ? null
                : () {
              if (widget.steps.length - 1 == controller.currentStep) {
                if (widget.onFinish != null) {
                  widget.onFinish();
                }
              } else {
                _changeStep(this.controller.currentStep + 1);
              }
            },
          ),
        );
        break;
      case StepperType.None:
        break;
      default:
        break;
    }

    return Container(
      decoration: _getElevation(),
      child: Container(
        height: 50,
        decoration: _getColor(),
        child: content,
      ),
    );
  }

  BoxDecoration _getElevation({bool top = false}) {
    if (widget.elevation == null || widget.elevation == 0) {
      return BoxDecoration();
    }

    return BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: widget.elevation, spreadRadius: 0, offset: Offset(0, (top ? .1 : -.1)))]);
  }

  BoxDecoration _getColor() {
    if (widget.gradient != null) {
      return BoxDecoration(gradient: widget.gradient);
    }

    return BoxDecoration(color: Theme.of(context).canvasColor);
  }

  void _changeStep(int step) {
    this.controller.currentStep = step;
    this.pageController.animateToPage(controller.currentStep, duration: Duration(milliseconds: 300), curve: Curves.easeInOut).then((_) {
      if (controller.onStepChange != null) {
        controller.onStepChange(this.controller.currentStep);
      }
      setState(() {});
    });
  }
}
