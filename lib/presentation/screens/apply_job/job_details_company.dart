import 'package:flutter/material.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:sizer/sizer.dart';

class JobDetailsCompany extends StatelessWidget {
  const JobDetailsCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 11.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8.h,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppTheme.neutral2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: AppTheme.neutral4,
                            fontSize: 10.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'twitter@mail.com',
                          style: TextStyle(
                            color: AppTheme.neutral9,
                            fontSize: 11.5.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4.w,),
                Expanded(
                  child: Container(
                    height: 8.h,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppTheme.neutral2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Website',
                          style: TextStyle(
                            color: AppTheme.neutral4,
                            fontSize: 10.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'https://twitter.com',
                          style: TextStyle(
                            color: AppTheme.neutral9,
                            fontSize: 11.5.sp,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 3.h,),
            Text(
              'About Company',
              style: TextStyle(
                color: AppTheme.neutral9,
                fontSize: 11.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 2.h,),
            Text(
              'Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including ​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.',
              style: TextStyle(
                color: AppTheme.neutral6,
                fontSize: 10.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            )
          ],
        ),
      ),
    );
  }
}
