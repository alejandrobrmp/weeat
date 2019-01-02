import 'package:flutter/material.dart';

class ScrollableTextExpanded extends StatelessWidget {
  Text text;

  ScrollableTextExpanded({this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(child: text),
      ),
    );
  }
}

class ScrollableTextFlexible extends StatelessWidget {
  Text text;

  ScrollableTextFlexible({this.text});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Center(child: text),
      ),
    );
  }
}
