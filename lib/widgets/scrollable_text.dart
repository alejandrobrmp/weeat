import 'package:flutter/material.dart';
import 'package:we_eat/widgets/scrollable_content.dart';

class ScrollableTextExpanded extends StatelessWidget {
  Text text;

  ScrollableTextExpanded({this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollableContent(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 5),
          child: Center(child: text),
        ),
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
      child: ScrollableContent(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 5),
          child: Center(child: text),
        ),
      ),
    );
  }
}
