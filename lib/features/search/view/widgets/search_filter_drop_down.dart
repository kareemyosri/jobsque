import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/job_feature.dart';

class FilterDropDownOption extends StatelessWidget {
  final String option;
  final bool isSelected;
  const FilterDropDownOption(this.option, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 24.0),
      child: InkWell(
        onTap: (){
          Scaffold.of(context).showBottomSheet<void>(

                (BuildContext context) =>  Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'On-Site/Remote',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF222741),
                              fontSize: 15.5.sp,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          SizedBox(height: 3.h,),
                          Row(
                            children: [
                              const JobFeature(text: "FullTime"),
                              SizedBox(width: 2.w,),
                              const JobFeature(text: "Remote"),
                              SizedBox(width: 2.w,),

                              const JobFeature(text: "Contract"),
                              SizedBox(width: 2.w,),

                              const JobFeature(text: "Contract")

                            ],
                          ),

                          SizedBox(height: 10.h,)

                        ],
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomElevatedButton(() { }, "Show Result"))
                    ],
                  ),
                )
          );

        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8.0),
          decoration: ShapeDecoration(
            color: isSelected ?  AppTheme.primary9 : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.2,
                  color: isSelected
                      ? AppTheme.primary9
                      : AppTheme.neutral3),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: Row(
            children: [
              Text(
                option,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
               SizedBox(width: 2.w),
              Icon(
                Iconsax.arrow_down_1,
                color: isSelected ? Colors.white : AppTheme.neutral5,
                size: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}