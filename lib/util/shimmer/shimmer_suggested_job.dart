import 'package:flutter/material.dart';
import 'package:jobsque/util/shimmer/shimmer_container_effect.dart';
import 'package:sizer/sizer.dart';


class ShimmerSuggestedJob extends StatelessWidget {
  const ShimmerSuggestedJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(1.h),
        ),
        padding: EdgeInsets.all(0.8.h),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ShimmerContainerEffect(
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainerEffect(
                        height: 1.2.h,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ShimmerContainerEffect(
                        height: 1.2.h,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ],
                  ),
                ),
                ShimmerContainerEffect(
                  height: 3.h,
                  width: 3.h,
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                ShimmerContainerEffect(
                  height: 1.2.h,
                  width: 20.w,
                ),
                SizedBox(
                  width: 2.h,
                ),
                ShimmerContainerEffect(
                  height: 1.2.h,
                  width: 20.w,
                ),

              ],
            ),
            SizedBox(height: 1.5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainerEffect(
                  height: 1.2.h,
                  width: 20.w,
                ),

                ShimmerContainerEffect(
                  height: 1.2.h,
                  width: 20.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



