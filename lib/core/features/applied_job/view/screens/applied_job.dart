import 'package:flutter/material.dart';
import 'package:jobsque/core/features/applied_job/view/screens/active.dart';
import 'package:jobsque/core/features/applied_job/view/screens/rejected.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/app_bar.dart';


class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  int activeIndex = 0;
  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Applied Job", context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _menuBar(context),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                AppliedJobActiveScreen(),
                AppliedJobRejectedScreen()
              ],
              onPageChanged: (index) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),

        ],
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
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
                setState(() {
                  activeIndex = 0;
                  pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (activeIndex == 0)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Active",
                  style: (activeIndex == 0)
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
                setState(() {
                  activeIndex = 1;
                  pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
                alignment: Alignment.center,
                decoration: (activeIndex == 1)
                    ? const BoxDecoration(
                  color: AppTheme.primary9,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                )
                    : null,
                child: Text(
                  "Rejected",
                  style: (activeIndex == 1)
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
  }
}


