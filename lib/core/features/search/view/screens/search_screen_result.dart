import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/ElvatedButton.dart';
import '../../../../../util/widgets/TextFormField.dart';
import '../../../../../util/widgets/header.dart';
import '../../../../../util/widgets/job_feature.dart';
import '../../../home/view/widgets/recent_job_item.dart';
import '../../../../../util/widgets/search_filter_drop_down.dart';



class SearchScreenResult extends StatelessWidget {
   SearchScreenResult({Key? key}) : super(key: key);
  TextEditingController jobTitleController=TextEditingController();
   TextEditingController locationController=TextEditingController();
   //TextEditingController salaryController=TextEditingController();
   List<DropdownMenuItem<String>> menuItems = [
     DropdownMenuItem(value: "\$5K - \$10K",
         child: Text(
           '\$5K - \$10K',
           style: TextStyle(
             color: AppTheme.neutral9,
             fontSize: 11.5.sp,
             fontFamily: 'SFProDisplay',
             fontWeight: FontWeight.w500,

           ),
         )),
     DropdownMenuItem(value: "\$10K - \$15K",
         child: Text(
           '\$10K - \$15K',
           style: TextStyle(
             color: AppTheme.neutral9,
             fontSize: 11.5.sp,
             fontFamily: 'SFProDisplay',
             fontWeight: FontWeight.w500,

           ),
         )),
   ];

   String selectedValue = "\$5K - \$10K";

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    /// Filteration Setting
                    Builder(builder: (ctx) {
                      return IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          onPressed: () {
                            // Scaffold.of(ctx).showBottomSheet(
                            //   (BuildContext context) => const SavedItemActions(),
                            // );
                            Scaffold.of(ctx).showBottomSheet<void>(

                                  (BuildContext context) => Container(
                                height: MediaQuery.of(context).size.height * 0.80,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 40,
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
                                        SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconButton(onPressed: (){},icon: const Icon(Iconsax.arrow_left),),
                                                  Text(
                                                    'Set Filter',
                                                    style: TextStyle(
                                                      color: AppTheme.neutral9,
                                                      fontSize: 16.5.sp,
                                                      fontFamily: 'SFProDisplay',
                                                      fontWeight: FontWeight.w500,

                                                    ),
                                                  ),
                                                  TextButton(onPressed: (){},
                                                      child:Text(
                                                        'Reset',
                                                        style: TextStyle(
                                                          color: AppTheme.primary5,
                                                          fontSize: 13.5.sp,
                                                          fontFamily: 'SFProDisplay',
                                                          fontWeight: FontWeight.w500,

                                                        ),
                                                      )
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 3.h,),
                                              Text(
                                                'Job Tittle',
                                                style: TextStyle(
                                                  color: AppTheme.neutral9,
                                                  fontSize: 13.5.sp,
                                                  fontFamily: 'SFProDisplay',
                                                  fontWeight: FontWeight.w500,

                                                ),
                                              ),
                                              SizedBox(height: 1.h,),
                                              CustomTextFormField(
                                                  prefixIcon: const Icon(Iconsax.briefcase),
                                                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                                                  states.contains(MaterialState.focused)
                                                      ? AppTheme.neutral9
                                                      : AppTheme.neutral3),
                                                  controller: jobTitleController, hintText: "Job title", obscureText: false),
                                              SizedBox(height: 2.h,),

                                              Text(
                                                'Location',
                                                style: TextStyle(
                                                  color: AppTheme.neutral9,
                                                  fontSize: 13.5.sp,
                                                  fontFamily: 'SFProDisplay',
                                                  fontWeight: FontWeight.w500,

                                                ),
                                              ),
                                              SizedBox(height: 1.h,),
                                              CustomTextFormField(
                                                  prefixIcon: const Icon(Iconsax.location),
                                                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                                                  states.contains(MaterialState.focused)
                                                      ? AppTheme.neutral9
                                                      : AppTheme.neutral3),
                                                  controller: jobTitleController, hintText: "Job title", obscureText: false),

                                              SizedBox(height: 2.h,),

                                              Text(
                                                'Salary',
                                                style: TextStyle(
                                                  color: AppTheme.neutral9,
                                                  fontSize: 13.5.sp,
                                                  fontFamily: 'SFProDisplay',
                                                  fontWeight: FontWeight.w500,

                                                ),
                                              ),
                                              SizedBox(height: 1.h,),
                                              DropdownButtonFormField(

                                                  icon: const Icon(Iconsax.arrow_down_14,color: AppTheme.neutral9,),
                                                  decoration: InputDecoration(
                                                    prefixIcon: const Icon(Iconsax.dollar_circle),
                                                    prefixIconColor: AppTheme.neutral9,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: const BorderSide(
                                                        color: AppTheme.neutral3,
                                                      ),
                                                    ),
                                                    focusedBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide(color: AppTheme.primary5),
                                                    ),

                                                  ),
                                                  value: selectedValue,
                                                  onChanged: (String? newValue) {

                                                    selectedValue = newValue!;

                                                  },
                                                  items: menuItems),
                                              SizedBox(height: 2.h,),
                                              Text(
                                                'Job Type',
                                                style: TextStyle(
                                                  color: AppTheme.neutral9,
                                                  fontSize: 13.5.sp,
                                                  fontFamily: 'SFProDisplay',
                                                  fontWeight: FontWeight.w500,

                                                ),
                                              ),
                                              SizedBox(height: 1.h,),
                                              Row(
                                                children: [
                                                  const JobFeature(text: "FullTime"),
                                                  SizedBox(width: 2.w,),
                                                  const JobFeature(text: "Remote"),
                                                  SizedBox(width: 2.w,),

                                                  const JobFeature(text: "Contract")

                                                ],
                                              ),
                                              SizedBox(height: 2.h,),
                                              Row(
                                                children: [
                                                  const JobFeature(text: "FullTime"),
                                                  SizedBox(width: 2.w,),
                                                  const JobFeature(text: "Remote"),
                                                  SizedBox(width: 2.w,),

                                                  const JobFeature(text: "Contract")

                                                ],
                                              ),
                                              SizedBox(height: 10.h,)

                                            ],
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: CustomElevatedButton(() { }, "Show Result"))
                                      ],
                                    ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Iconsax.setting_4,
                            size: 24.0,
                          ));
                    }),
                    const FilterDropDownOption('Remote', isSelected: true),
                    const FilterDropDownOption('Full Time', isSelected: true),
                    const FilterDropDownOption('Post date'),
                    const FilterDropDownOption('Experience level'),
                  ],
                ),
              ),
              const CustomHeader('Featuring 120+ jobs'),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>
                        // RecentJobItem( jobData: null,) here important*****
                    Container() //delete it
                    ,
                    separatorBuilder: (context,index)=>const Divider(),
                    itemCount: 10),
              )

              /// Write the rest of the body here
              /// Jobs ListTile
              /// ...
              /// ...
            ],
          ),
        ),
      ),
    );
  }
}
