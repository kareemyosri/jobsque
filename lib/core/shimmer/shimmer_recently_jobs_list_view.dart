import 'package:flutter/material.dart';

import 'package:jobsque/core/shimmer/shimmer_job_list_view_item.dart';
import 'package:sizer/sizer.dart';

class ShimmerRecentlyListView extends StatelessWidget {
  const ShimmerRecentlyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      //  const ShimmerTitleAndViewAll(),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ShimmerJobListViewItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 1.h,
            );
          },
          itemCount: 5,
        ),
      ],
    );
  }
}
