import 'package:flutter/material.dart';
import 'package:jobsque/presentation/widgets/app_bar.dart';
import 'package:jobsque/presentation/widgets/header.dart';
import 'package:jobsque/presentation/widgets/saved_job_item.dart';
import 'package:sizer/sizer.dart';

import '../../../Models/savedJobItemModel.dart';

class SavedJobScreen extends StatelessWidget {
  const SavedJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Saved',context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader(
              '12 Job Saved',
              isCentered: true,
            ),
             SizedBox(height: 1.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(

                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: savedJobs.length,
                itemBuilder: (BuildContext context, int index) =>
                    SavedJobItem(savedJobs[index]),
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(indent: 24.0, endIndent: 24.0),
              ),
            ),
          ],
        ),
      )

    );
  }
}
