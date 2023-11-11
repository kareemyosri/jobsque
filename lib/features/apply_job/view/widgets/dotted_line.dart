import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DottedLine({
    this.totalWidth = 30,
    this.dashWidth = 3,
    this.emptyWidth = 2,
    this.dashHeight = 1.2,
    this.dashColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
            (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}
