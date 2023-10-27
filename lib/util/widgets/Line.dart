import 'package:flutter/material.dart';

import '../styles/color.dart';

Widget line(){
  return Container(
    decoration: const ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.50,
          strokeAlign: BorderSide.strokeAlignCenter,
          color:AppTheme.neutral3,
        ),
      ),
    ),
  );
}