
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/home/view_model/home_cubit.dart';
import 'package:jobsque/core/features/saved_job/model/favourite_model.dart';
import 'package:jobsque/core/features/saved_job/view_model/favourite_cubit.dart';
import 'package:jobsque/util/router/app_route.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/animations/slide_transition_animation.dart';
import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/bottom_sheet_item.dart';
import '../../../../../util/widgets/bottom_sheet_savedJob.dart';

class SavedJobItem extends StatefulWidget {

  final FavouriteData favouriteData;

  const SavedJobItem( {super.key, required this.favouriteData});

  @override
  State<SavedJobItem> createState() => _SavedJobItemState();
}

class _SavedJobItemState extends State<SavedJobItem> {
  late HomeCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              Image.network(widget.favouriteData.image!, width: 11.w, height: 5.h),
          title: Text(
            widget.favouriteData.jobs!.name!,
            style: TextStyle(
              color: AppTheme.neutral9,
              fontSize: 15.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                widget.favouriteData.jobs!.compName!,
                style: TextStyle(
                  color: AppTheme.neutral7,
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Text(
                  "• ${widget.favouriteData.jobs!.location!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.neutral7,
                    fontSize: 10.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) =>
                    SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0, 0.2), end: Offset.zero,
                      child:   CustomBottomSheet(
                        items: [
                          BottomSheetItem(
                            'Apply Job',
                            actionIcon: Iconsax.directbox_notif,
                            onTap: (){
                              Navigator.pushNamed(context, AppRoute.jobDetailsScreen,arguments:
                              widget.favouriteData.jobs
                              );
                            },
                          ),
                          BottomSheetItem('Share via...', actionIcon: Iconsax.export,
                            onTap: () async{
                              await FavouriteCubit.get(context).shareImageFromApi(
                                  imageUrl: widget.favouriteData.image!,
                                  text:widget.favouriteData.jobs!.jobDescription!,
                                  subject:widget.favouriteData.jobs!.name!
                              );


                            },
                          ),
                          BottomSheetItem('Cancel save',
                            actionIcon: Iconsax.archive_minus,
                            onTap: (){
                              cubit.removeFavourite(widget.favouriteData.id.toString());
                            },
                          ),
                        ],
                      ),),

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
             'Posted 2 days ago',
              style: TextStyle(
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
                 'Be an early applicant',
                  style: TextStyle(
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
