import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/home/model/job_model.dart';
import 'package:jobsque/core/features/home/view_model/home_cubit.dart';
import 'package:jobsque/util/router/app_route.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/job_feature.dart';
import '../../../saved_job/model/favourite_model.dart';
import '../../../saved_job/view_model/favourite_cubit.dart';

class RecentJobItem extends StatefulWidget {
  final JobData jobData;

  const RecentJobItem({
    super.key,
    required this.jobData,
  });

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  late HomeCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.jobDetailsScreen,
                arguments: widget.jobData);
          },
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Image.network(widget.jobData.image!)),
          title: Text(
            widget.jobData.name!,
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
                widget.jobData.compName!,
                style: TextStyle(
                  color: AppTheme.neutral7,
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Text(
                  "• ${widget.jobData.location!}",
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
          trailing: BlocConsumer<HomeCubit, HomeState>(
          //  listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              print('stated updated: $state');

            },
            builder: (context, state) {

                return IconButton(
                  onPressed: () {
                  //  cubit.addFavourite(widget.jobData.id.toString());
                    cubit.handleFavourite( widget.jobData);
                  },

                  icon:
                        cubit.checkFavourite(widget.jobData.id!)?
                  Transform.translate(
                      offset: Offset(1.5.h,0),
                      child: const Icon(Iconsax.archive_minus5, color: AppTheme.primary5,)):
               const Icon(Iconsax.archive_minus,),
                );



            },
          ),
          contentPadding: EdgeInsets.zero,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            JobFeature(
              text: widget.jobData.jobTimeType!,
            ),
            SizedBox(
              width: 2.h,
            ),
            // const JobFeature(text: "Remote",),
            JobFeature(
              text: widget.jobData.jobType!,
            ),
            const Spacer(),

            Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${widget.jobData.salary!}',
                        style: TextStyle(
                          color: AppTheme.success7,
                          fontSize: 13.5.sp,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '/Month',
                        style: TextStyle(
                          color: AppTheme.neutral5,
                          fontSize: 10.sp,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
