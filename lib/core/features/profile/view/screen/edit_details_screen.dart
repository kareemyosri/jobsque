import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/ElvatedButton.dart';
import '../../../../../util/widgets/TextFormField.dart';
import '../../../../../util/widgets/app_bar.dart';
import '../../../../../util/widgets/phone_textFormField.dart';

class EditDetalisScreen extends StatelessWidget {
   EditDetalisScreen({Key? key}) : super(key: key);
  TextEditingController nameController=TextEditingController(text: "Rafif Dian Axelingga");
  TextEditingController bioController=TextEditingController(text: "Senior UI/UX Designer");
  TextEditingController addressController=TextEditingController(text: "Ranjingan, Wangon, Wasington City");
  TextEditingController phoneController=TextEditingController(text: "0100-666-7234");


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
                        alignment:Alignment.center ,
                          children: [
                            Container(
                              width: 24.5.w,
                              height: 11.5.h,
                              decoration: const ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(
                                  side: BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                            ),
                            Icon(Iconsax.camera,color: Colors.white,),
                          ],
                        ),
                        SizedBox(height: 1.h,),
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
                  SizedBox(height: 3.h,),

                  Text(
                    'Name',
                    style: TextStyle(

                      color: AppTheme.neutral4,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextFormField(controller: nameController, hintText: 'Name', obscureText: false),
                  SizedBox(height: 2.h,),
                  Text(
                    'Bio',
                    style: TextStyle(
                      color: AppTheme.neutral4,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextFormField(controller: bioController, hintText: 'Bio', obscureText: false),
                  SizedBox(height: 2.h,),
                  Text(
                    'Address',
                    style: TextStyle(
                      color: AppTheme.neutral4,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextFormField(controller: addressController, hintText: 'Bio', obscureText: false),
                  SizedBox(height: 2.h,),
                  Text(
                    'No.Handphone',
                    style: TextStyle(
                      color: AppTheme.neutral4,
                      fontSize: 13.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomPhoneTextFormField(controller: phoneController),

                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(() { }, "Save")),
          ],
        ),
      ),
    );
  }
}
