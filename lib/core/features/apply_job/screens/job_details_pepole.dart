import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../util/styles/color.dart';
import '../../../../util/widgets/job_details_people_tile.dart';

class JobDetailsPepole extends StatelessWidget {
   JobDetailsPepole({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "UI/UX Designer",
        child: Text(
          'UI/UX Designer',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 10.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        )),
    DropdownMenuItem(value: "Front",
        child: Text(
          'Front',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 10.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        )),
  ];

  String selectedValue = "UI/UX Designer";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                '6 Employees For',
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 11.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              subtitle: Text(
                'UI/UX Design',
                style: TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),

              trailing:  SizedBox(
                width: 40.w,

                child: DropdownButtonFormField(
                  padding: EdgeInsets.zero,
                    icon:  Icon(Iconsax.arrow_down_14,color: AppTheme.neutral9,size: 14.sp,),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
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
              ),
            ),
            SizedBox(height: 3.h,),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context,index)=> JobDetailsPeopleTile(image:"https://cdn-icons-png.flaticon.com/128/3536/3536424.png", name: "Dimas Adi Saputro", job: "Senior UI/UX Designer at Twitter", yearsOfExp: "5 Years"),

                separatorBuilder: (context,index)=>const Divider(),
                itemCount: 5
            ),
          ],
        ),
      ),
    );
  }
}
