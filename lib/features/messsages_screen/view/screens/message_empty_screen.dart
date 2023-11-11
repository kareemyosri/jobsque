import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/bottom_sheet_item.dart';
import '../../../../../core/widgets/bottom_sheet_savedJob.dart';
import '../../../../../core/widgets/search_bar.dart';




class MessageEmptyScreen extends StatelessWidget {
  MessageEmptyScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Messages", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomSearchBar(
                    controller: searchController,
                    hintText: 'Search messages....',
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                InkWell(
                  onTap: () {
                    Scaffold.of(context).showBottomSheet<void>(
                      (BuildContext context) =>  const CustomBottomSheet(
                        items: [
                          BottomSheetItem(
                            'Unread',
                            hasIcon: false,
                          ),
                          BottomSheetItem(
                            'Spam',
                            hasIcon: false,
                          ),
                          BottomSheetItem(
                            'Archived',
                            hasIcon: false,
                          ),
                        ],
                        isTitled: true,
                        text: 'Message filters',
                      ),
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppTheme.neutral3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Icon(Iconsax.setting_4),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/home/message.svg"),
                    SizedBox(height: 2.h),
                    Text(
                      'You have not received any messages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.neutral9,
                        fontSize: 20.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Once your application has reached the interview stage, you will get a message from the recruiter.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppTheme.neutral5,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
