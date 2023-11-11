import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/apply_job/view_model/job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';

class TypeofWorkTile extends StatefulWidget {
  final String title;
  final String subtitle;
    bool isSelected;
  final int value;

   TypeofWorkTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,  this.isSelected=false,

  });

  @override
  State<TypeofWorkTile> createState() => _TypeofWorkTileState();
}

class _TypeofWorkTileState extends State<TypeofWorkTile> {


  late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
  builder: (context, state) {
    return Column(children: [
      InkWell(
        onTap: () {
          // Check the isSelected variable of the other tiles.
          for (TypeofWorkTile tile in cubit.typeOfWorkTiles) {
            if (tile != this && tile.isSelected) {
              tile.isSelected = false;
            }
          }


           widget.isSelected=true;
            cubit.selectChoice(widget.value);


        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: ShapeDecoration(
            color:widget.isSelected ? const Color(0xFFE0EAFF) : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color:widget.isSelected ? AppTheme.primary5 : AppTheme.neutral3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,

            title: Text(
              widget.title,
              style:  TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            subtitle: Text(
              widget.subtitle,
              style:  TextStyle(
                color: AppTheme.neutral5,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            trailing: Radio(
              value: widget.value,
              groupValue: cubit.selectedChoice,
              activeColor: AppTheme.primary5,
              splashRadius: 25,
              onChanged: (value) {
              //  cubit.selectChoice(value);
              },
            ),
          ),
        ),
      ),
      SizedBox(height: 2.h,)
    ]);
  },
);
  }
}