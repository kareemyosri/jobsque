import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {},
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8.0),
        dashPattern: const [8, 5],
        color: AppTheme.primary5 ,
        child: Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppTheme.primary1.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 17.w,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppTheme.primary1,
                  shape: BoxShape.circle,
                ),
                child:  Center(
                  child: Icon(
                    Iconsax.document_upload5,
                    color: AppTheme.primary5,
                    size: 27.sp,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Upload your other file',
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 15.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Max. file size 10 MB',
                style: TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 10.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 5.5.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: AppTheme.primary1,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: AppTheme.primary5),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.export_1,
                        color: AppTheme.primary5,
                        size: 17.sp,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        'Add file',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppTheme.primary5,
                          fontSize: 11.5.sp,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}