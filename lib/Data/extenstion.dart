import 'package:flutter/material.dart';

extension emptySpace on num {
  SizedBox get Y => SizedBox(height: toDouble());

  SizedBox get x => SizedBox(width: toDouble());
}

//text factor
extension ScaleExtension on BuildContext {
  double get textScale => MediaQuery.of(this).textScaleFactor;
}

//padding extension
extension WidgetPaddingExtension on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }
}
