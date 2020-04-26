import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  Widget padding(double defaultPadding,
      {double top,
      double left,
      double right,
      double bottom,
      double vertical,
      double horizontal}) {
    var padding = EdgeInsets.fromLTRB(
      left ?? horizontal ?? defaultPadding,
      top ?? vertical ?? defaultPadding,
      right ?? horizontal ?? defaultPadding,
      bottom ?? vertical ?? defaultPadding,
    );
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget centered() {
    return Center(
      child: this,
    );
  }

  Widget size({double height, double width}) {
    return SizedBox(
      child: this,
      height: height,
      width: width,
    );
  }
}

extension WidgetListExtensions on List<Widget> {
  List<Widget> padding(double defaultPadding,
      {double top, double left, double right, double bottom}) {
    return this.map<Widget>((widget) {
      return widget.padding(
        defaultPadding,
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      );
    }).toList();
  }
}
