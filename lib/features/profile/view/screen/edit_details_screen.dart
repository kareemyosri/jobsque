import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/features/profile/view_model/profile_cubit.dart';
import 'package:jobsque/core/database/local_database/cache_helper.dart';
import 'package:jobsque/core/enums.dart';
import 'package:jobsque/core/router/app_route.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/TextFormField.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/phone_textFormField.dart';
import '../../../../../core/widgets/snack_bar.dart';




class EditDetalisScreen extends StatefulWidget {
  EditDetalisScreen({Key? key}) : super(key: key);

  @override
  State<EditDetalisScreen> createState() => _EditDetalisScreenState();
}

class _EditDetalisScreenState extends State<EditDetalisScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController workController = TextEditingController();
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
    nameController.text = cubit.profile[0].name!;
    bioController.text = cubit.profileDetails[0].bio??'';
    addressController.text = cubit.profileDetails[0].address??'';
    phoneController.text = cubit.profileDetails[0].mobile??'';
    workController.text = cubit.profileDetails[0].interestedWork??"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Edit Details", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            BlocConsumer<ProfileCubit, ProfileState>(
                              listener: (context,state){
                                if(state is PickImageSuccess){
                                  showSuccessSnackBar(context: context, message: 'Profile Image Updated Successfully');

                                }
                                else if(state is PickImageError){
                                  if(state is PickImageSuccess){
                                    showErrorSnackBar(context: context, message: 'There is something went wrong. Try Again');

                                  }
                                }
                              },
                              builder: (context, state) {
                                if(state is PickImageLoading){
                                  return const Center(child: CircularProgressIndicator());
                                }
                                else{
                                  return InkWell(
                                    onTap: () {
                                      cubit.pickAndSaveProfileImage();
                                    },
                                    child: Container(
                                      width: 24.5.w,
                                      height: 11.5.h,
                                      decoration:  ShapeDecoration(
                                        image: cubit.savedImage != null
                                            ? DecorationImage(
                                          image: FileImage(cubit.savedImage!),
                                          fit: BoxFit.fill,
                                        )
                                            : const DecorationImage(
                                          image: NetworkImage(
                                              "https://icons-for-free.com/iconfiles/png/512/man+person+profile+user+icon-1320073176482503236.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: const OvalBorder(
                                          side: BorderSide(width: 2, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                              },
                            ),
                            const Icon(
                              Iconsax.camera,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Change  Photo',
                          style: TextStyle(
                            color: AppTheme.primary5,
                            fontSize: 13.5.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Name',
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
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                          controller: nameController,
                          hintText: 'Name',
                          obscureText: false);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Interested Work',
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
                      controller: workController,
                      hintText: 'work',
                      obscureText: false),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Bio',
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
                      controller: bioController,
                      hintText: 'Bio',
                      obscureText: false),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Address',
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
                      controller: addressController,
                      hintText: 'Bio',
                      obscureText: false),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'No.Handphone',
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
                  CustomPhoneTextFormField(controller: phoneController),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is UpdateProfileSuccessfully) {
                      showSuccessSnackBar(context: context, message: 'Profile Updated Successfully');

                      Navigator.pop(context);
                    }
                    else if (state is UpdateProfileError){
                      showErrorSnackBar(context: context, message: 'There is something went Wrong. Try Again');
                    }

                  },
                  builder: (context, state) {
                    if (state is! UpdateProfileLoading) {
                      return CustomElevatedButton(() {
                        if(CashHelper.getString(key: MySharedKeys.completeProfile)==''){
                          cubit.addItem('Personal Details');
                          cubit.updateProfileNameAndPassword(
                              name: nameController.text,
                              password: CashHelper.getString(
                                  key: MySharedKeys.password));
                          cubit.updateUserData(
                              interestedWork: workController.text,
                              mobile: phoneController.text,
                              address: addressController.text,
                              bio: bioController.text);

                        }
                        else{
                          cubit.updateProfileNameAndPassword(
                              name: nameController.text,
                              password: CashHelper.getString(
                                  key: MySharedKeys.password));
                          cubit.updateUserData(
                              interestedWork: workController.text,
                              mobile: phoneController.text,
                              address: addressController.text,
                              bio: bioController.text);
                        }

                      }, "Save");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
