import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/features/profile/view_model/profile_cubit.dart';

import 'package:sizer/sizer.dart';

import '../../../../../util/router/app_route.dart';
import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/ElvatedButton.dart';
import '../../../../../util/widgets/TextFormField.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/snack_bar.dart';
import '../widgets/education_listTile.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final formKey=GlobalKey<FormState>();
  TextEditingController universityController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController startYearController = TextEditingController();

  TextEditingController endYearController = TextEditingController();
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
      appBar: customAppBar("Education", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                        'University *',
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'University must not be empty';
                          }
                          else{
                            return null;
                          }
                        },
                          controller: universityController,
                          hintText: "University",
                          obscureText: false),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Title',
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
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Title must not be empty';
                            }
                            else{
                              return null;
                            }
                          },
                          controller: titleController,
                          hintText: "Title",
                          obscureText: false),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Start Date',
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Start Date must not be empty';
                          }
                          else{
                            return null;
                          }
                        },
                        controller: startYearController,
                        hintText: "Start Year",
                        obscureText: false,
                        suffixIcon: const Icon(Iconsax.calendar_1),
                        suffixIconColor: AppTheme.neutral9,
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
                        height: 2.h,
                      ),
                      Text(
                        'End Year',
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'End Date must not be empty';
                          }
                          else{
                            return null;
                          }
                        },
                        controller: endYearController,
                        hintText: "End Date",
                        obscureText: false,
                        suffixIcon: const Icon(Iconsax.calendar_1),
                        suffixIconColor: AppTheme.neutral9,
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
                          endYearController.text =
                              formattedDate; //set output date to TextField value.
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                           if (state is AddItemCompleteProfile){
                          showSuccessSnackBar(context: context, message: 'Education Updated Successfully');
                          Navigator.pop(context);
                           }
                        },
                        builder: (context, state) {
                          return CustomElevatedButton(() {
                            if(formKey.currentState!.validate()){
                              cubit.addItem('Education');

                            }
                          }, "Save");
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),

                // education List Tile

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                //   decoration: ShapeDecoration(
                //     shape: RoundedRectangleBorder(
                //       side: const BorderSide(color: AppTheme.neutral3),
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                //   child: const EducationListTile(
                //     image:
                //         "https://cdn-icons-png.flaticon.com/128/3536/3536424.png",
                //     title: 'The University of Arizona',
                //     bachelor: 'Bachelor of Art and Design',
                //     date: '2015-2018',
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
