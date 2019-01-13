import 'package:flutter/material.dart';

class ScrollableContent extends StatefulWidget {
  Widget child;

  ScrollableContent({this.child});

  @override
  _ScrollableContentState createState() => _ScrollableContentState();
}

class _ScrollableContentState extends State<ScrollableContent> {
  ScrollMetrics _lastMetrics;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification || notification is OverscrollNotification) {
          setState(() {
            _lastMetrics = notification.metrics;
          });
        }
      },
      child: CustomPaint(
        painter: CanvasBox(maxScroll: _lastMetrics?.maxScrollExtent, heightPixels: _lastMetrics?.pixels ?? 0),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: widget.child,
        ),
      ),
    );
  }

}

class CanvasBox extends CustomPainter {
  double maxScroll;
  double heightPixels;

  CanvasBox({this.maxScroll, this.heightPixels});

  @override
  void paint(Canvas canvas, Size size) {
    if (maxScroll == null || maxScroll == 0) return;

    Paint paint = Paint();
    paint.color = Colors.black.withOpacity(.5);
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.fill;

    Rect r = Rect.fromLTWH(size.width - 5, _getScroll(size), 5, _getSize(size));
    canvas.drawRect(r, paint);
  }

  double _getSize(Size size) {
    double barSize = (size.height / (size.height + maxScroll)) * 100;
    return barSize.clamp(10, size.height).toDouble();
  }

  double _getScroll(Size size) {
    double barSize = _getSize(size);
    return ((size.height - barSize) * heightPixels) / maxScroll;
  }

  @override
  bool shouldRepaint(CanvasBox oldDelegate) {
    return oldDelegate.heightPixels != heightPixels;
  }
}
