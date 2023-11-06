import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/applied_job/view_model/applied_job_cubit.dart';
import 'package:jobsque/core/features/apply_job/view/widgets/stepper_indicator.dart';
import 'package:jobsque/core/features/saved_job/model/favourite_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/job_feature.dart';
import '../../../home/view_model/home_cubit.dart';

class AppliedJobItem extends StatefulWidget {
    const AppliedJobItem({Key? key, required this.jobData}) : super(key: key);

  final JobData jobData;

  @override
  State<AppliedJobItem> createState() => _AppliedJobItemState();
}

class _AppliedJobItemState extends State<AppliedJobItem> {
   int currentStep = 2;
   late AppliedJobCubit cubit;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=AppliedJobCubit.get(context);
  }

   @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Image.network(widget.jobData.image!)),
          title: Text(
            widget.jobData.name!,
            style: TextStyle(
              color:AppTheme.neutral9,
              fontSize: 15.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle:  Row(
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
                  HomeCubit.get(context).handleFavourite( widget.jobData);
                },

                icon:
                HomeCubit.get(context).checkFavourite(widget.jobData.id!)?
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
            SizedBox(width: 2.h,),
            JobFeature(
              text: widget.jobData.jobType!,
            ),

            const Spacer(),


            Column(
              children: [
                Text(
                  'Posted 2 days ago',
                 // textAlign: TextAlign.right,
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
        SizedBox(height: 1.5.h,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height*0.10,

          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide( color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepIndication(

                  1, "Bio Data", currentStep >= 0,
                  raduis: 4.h,
                ),
                StepIndication(
                  2, 'Type of work', currentStep >= 1,
                  raduis: 4.h,
                ),
                StepIndication(
                    3, 'Upload portfolio', currentStep >= 2,
                    lineState: false,
                raduis: 4.h,
                ),
              ]
          ),
        ),
      ],
    );
  }
}
