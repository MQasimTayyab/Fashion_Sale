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
extension WidgetPadding on Widget {
  Widget padAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget padSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }
}
