import 'package:flutter/material.dart';
import 'package:jobsque/core/features/profile/view/widgets/counter.dart';
import 'package:jobsque/core/features/profile/view/widgets/user_about.dart';
import 'package:sizer/sizer.dart';

class ProfilePersonalDetails extends StatelessWidget {
  const ProfilePersonalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: 11.h,
            padding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            decoration: ShapeDecoration(
              color:  const Color(0xFFFAFAFA),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child:  const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCounter(counterName: 'Applied', counter: 46),
                VerticalDivider(),
                CustomCounter(counterName: 'Reviewed', counter: 23),
                VerticalDivider(),
                CustomCounter(counterName: 'Contacted', counter: 16),
              ],
            ),
          ),
          SizedBox(height:1.h),
          const UserAbout(),
          SizedBox(height: 2.5.h),

        ],
      ),

    );
  }
}
