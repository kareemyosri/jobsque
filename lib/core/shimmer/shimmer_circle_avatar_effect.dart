import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerCircleAvatarEffect extends StatelessWidget {
  const ShimmerCircleAvatarEffect({Key? key,  this.radius})
      : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.9),
        radius: radius ?? 1.5.h,
      ),
    );
  }
}
