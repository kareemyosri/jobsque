import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/applied_job_item.dart';
import '../../widgets/header.dart';
import '../../widgets/recent_job_item.dart';

class AppliedJobActiveScreen extends StatelessWidget {
  const AppliedJobActiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader("3 Jobs"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=>
                    AppliedJobItem(jobTitle: "Senior UI Designer", jobSubTitle: "Twitter • Jakarta, Indonesia "),
                separatorBuilder: (context,index)=>Divider(),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
