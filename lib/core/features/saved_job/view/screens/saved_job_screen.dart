import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/home/view_model/home_cubit.dart';
import 'package:jobsque/core/features/saved_job/view/screens/saved_job_empty.dart';
import 'package:jobsque/util/widgets/app_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Models/savedJobItemModel.dart';
import '../../../../../util/widgets/header.dart';
import '../widgets/saved_job_item.dart';


class SavedJobScreen extends StatefulWidget {
  const SavedJobScreen({Key? key}) : super(key: key);

  @override
  State<SavedJobScreen> createState() => _SavedJobScreenState();
}

class _SavedJobScreenState extends State<SavedJobScreen> {
  late HomeCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Saved', context,leading: false),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BuildCondition(
            condition:cubit.favouriteItems.isNotEmpty ,
            builder: (context) =>
                SingleChildScrollView(
                  child: Column(
                    children: [
                       CustomHeader(
                        '${cubit.favouriteItems.length} Job Saved',
                        isCentered: true,
                      ),
                      SizedBox(height: 1.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ListView.separated(

                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.favouriteItems.length,
                          itemBuilder: (BuildContext context, int index) =>
                              SavedJobItem(favouriteData: cubit.favouriteItems[index],),
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(indent: 24.0, endIndent: 24.0),
                        ),
                      ),
                    ],
                  ),
                ),
            fallback: (context) => const SavedJobEmptyScreen(),


          );
        },
      ),


    );
  }
}
