import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Models/savedJobItemModel.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/bottom_sheet_savedJob.dart';
import 'package:sizer/sizer.dart';

import 'bottom_sheet_item.dart';

class SavedJobItem extends StatelessWidget {
  final SavedJobModel job;

  const SavedJobItem(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(job.img, width: 11.w, height: 5.h),
          title: Text(
            job.jobDescription,
            style:  TextStyle(
              color: AppTheme.neutral9,
              fontSize: 15.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text('${job.company} • ${job.hqLocation}',
              style:  TextStyle(
                color: AppTheme.neutral7,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
              )),
          trailing: IconButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) =>  const CustomBottomSheet(items: [
                   BottomSheetItem('Apply Job',actionIcon: Iconsax.directbox_notif, ),
                   BottomSheetItem('Share via...',actionIcon: Iconsax.export),
                   BottomSheetItem('Cancel save',actionIcon: Iconsax.archive_minus),
                ],),
              );
            },
            icon: const Icon(
              Iconsax.more,
              size: 24.0,
            ),
          ),
          contentPadding: EdgeInsets.zero,

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              job.date,
              style:  TextStyle(
                color: AppTheme.neutral7,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            Spacer(),
            Row(
              children: [
                const Icon(
                  Iconsax.clock,
                  size: 12,
                  color: AppTheme.success7,
                ),
                const SizedBox(width: 6.0),
                Text(
                  job.status,
                  style:  TextStyle(
                    color: AppTheme.neutral7,
                    fontSize: 10.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                )
              ],
            )
          ],
        ),
         SizedBox(height: 1.h),
      ],
    );
  }
}
