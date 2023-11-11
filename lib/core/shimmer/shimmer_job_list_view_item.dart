import 'package:flutter/material.dart';
import 'package:jobsque/core/shimmer/shimmer_container_effect.dart';
import 'package:sizer/sizer.dart';

class ShimmerJobListViewItem extends StatelessWidget {
  const ShimmerJobListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(1.h),
      ),
      padding: EdgeInsets.all(0.8.h),
      height: 10.h,
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
              const Spacer(),
              ShimmerContainerEffect(
                height: 1.2.h,
                width: 20.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
