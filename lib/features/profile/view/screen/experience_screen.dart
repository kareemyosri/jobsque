import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/features/profile/view_model/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/TextFormField.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../widgets/education_listTile.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController positionController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController startYearController = TextEditingController();
  bool? isChecked = false;
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "Full time",
        child: Text(
          'Full time',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
        )),
    DropdownMenuItem(
        value: "Part time",
        child: Text(
          'Part time',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
        )),
  ];

  String selectedValue = "Full time";

  late ProfileCubit cubit;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Experience", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 484,
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                  bottom: 16,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppTheme.neutral3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Position *',
                      style: TextStyle(
                        color: AppTheme.neutral4,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    CustomTextFormField(
                        controller: positionController,
                        hintText: "Position",
                        obscureText: false),

                    SizedBox(
                      height: 2.h,
                    ),

                    Text(
                      'Type of work',
                      style: TextStyle(
                        color: AppTheme.neutral4,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    DropdownButtonFormField(
                        icon: const Icon(
                          Iconsax.arrow_down_14,
                          color: AppTheme.neutral9,
                        ),
                        decoration: InputDecoration(
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
                    //CustomTextFormField(controller: titleController, hintText: "Title", obscureText: false),

                    SizedBox(
                      height: 2.h,
                    ),

                    Text(
                      'Company name *',
                      style: TextStyle(
                        color: AppTheme.neutral4,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    CustomTextFormField(
                      controller: companyNameController,
                      hintText: "Company Name",
                      obscureText: false,
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    Text(
                      'Location',
                      style: TextStyle(
                        color: AppTheme.neutral4,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    CustomTextFormField(
                      controller: locationController,
                      hintText: "Location",
                      obscureText: false,
                      prefixIcon: const Icon(Iconsax.location),
                      prefixIconColor: AppTheme.neutral9,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: isChecked,
                            activeColor: AppTheme.primary5,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side: const BorderSide(
                              color: AppTheme.neutral4,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue;
                              });
                            }),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'I am currently working in this role',
                            style: TextStyle(
                              color: AppTheme.neutral9,
                              fontSize: 11.5.sp,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    Text(
                      'Start Year *',
                      style: TextStyle(
                        color: AppTheme.neutral4,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    CustomTextFormField(
                      controller: startYearController,
                      hintText: "Start Year",
                      obscureText: false,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1970),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        //print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat.yMMMM().format(pickedDate!);
                        startYearController.text =
                            formattedDate; //set output date to TextField value.
                      },
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is AddItemCompleteProfile) {
                          showSuccessSnackBar(
                              context: context,
                              message: 'Experience Updated Successfully');
                         Navigator.pop(context);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(() {
                          cubit.addItem('Experience');
                        }, "Save");
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              // experience Tile

              // Column(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //
              //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              //       decoration: ShapeDecoration(
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide( color: AppTheme.neutral3),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              //       child: const EducationListTile(image:"https://cdn-icons-png.flaticon.com/128/3536/3536424.png", title: 'The University of Arizona', bachelor: 'Remote • GrowUp Studio', date: '2015-2018',),
              //     ),
              //     SizedBox(height: 3.h,)
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
