import 'package:flutter/material.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../widgets/type_of_work_item_tile.dart';



class TypeOfWorkScreen extends StatefulWidget {
  const TypeOfWorkScreen({super.key});

  @override
  State<TypeOfWorkScreen> createState() => _TypeOfWorkScreenState();
}

class _TypeOfWorkScreenState extends State<TypeOfWorkScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type Of Work',
            style: TextStyle(
              color:AppTheme.neutral9,
              fontSize: 16.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          Text(
            'Fill in your bio data correctly',
            style: TextStyle(
              color: AppTheme.neutral5,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
          SizedBox(height: 3.h,),

          Column(
            children: cubit.typeOfWorkTiles,
          ),

          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
