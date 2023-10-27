import 'package:flutter/material.dart';

import '../../../../../util/widgets/applied_job_item.dart';
import '../../../../../util/widgets/header.dart';


class AppliedJobActiveScreen extends StatelessWidget {
  const AppliedJobActiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHeader("3 Jobs"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=>
                    AppliedJobItem(jobTitle: "Senior UI Designer", jobSubTitle: "Twitter • Jakarta, Indonesia "),
                separatorBuilder: (context,index)=>const Divider(),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
