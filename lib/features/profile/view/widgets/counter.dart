import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class CustomCounter extends StatelessWidget {
  final String counterName;
  final int counter;
  const CustomCounter(
      {super.key, required this.counterName, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            counterName,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: AppTheme.neutral5,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 13.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
        ],
      ),
    );
  }
}
