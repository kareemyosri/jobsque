import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/applied_job/view_model/applied_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';

class MenuBarAppliedJob extends StatefulWidget {
  final PageController pageController;
  const MenuBarAppliedJob({Key? key, required this.pageController}) : super(key: key);

  @override
  State<MenuBarAppliedJob> createState() => _MenuBarAppliedJobState();
}

class _MenuBarAppliedJobState extends State<MenuBarAppliedJob> {
  late AppliedJobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=AppliedJobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppliedJobCubit, AppliedJobState>(
  builder: (context, state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 6.h,
      decoration: const BoxDecoration(
        color: AppTheme.neutral1,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {
                cubit.changeIndex(0);

                  widget.pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (cubit.activeIndex == 0)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Active",
                  style: (cubit.activeIndex == 0)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,)
                      :  TextStyle(
                    color: AppTheme.neutral5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),

                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              onTap: () {
                  cubit.changeIndex(1);
                  widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);


              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (cubit.activeIndex == 1)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Rejected",
                  style: (cubit.activeIndex == 1)
                      ?  TextStyle(
                    color: Colors.white,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,)
                      :  TextStyle(
                    color: AppTheme.neutral5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),

                ),
              ),
            ),
          ),

        ],
      ),
    );
  },
);
  }
}
