import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/applied_job/view/screens/active.dart';
import 'package:jobsque/core/features/applied_job/view/screens/rejected.dart';
import 'package:jobsque/core/features/applied_job/view/widgets/menu_bar.dart';
import 'package:jobsque/core/features/applied_job/view_model/applied_job_cubit.dart';
import '../../../../../util/widgets/app_bar.dart';


class AppliedJobScreen extends StatelessWidget {
  const AppliedJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppliedJobCubit()..getAppliedJobsId(),
    child:const AppliedJobBodyScreen() ,
    );
  }
}




class AppliedJobBodyScreen extends StatefulWidget {
  const AppliedJobBodyScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobBodyScreen> createState() => _AppliedJobBodyScreenState();
}

class _AppliedJobBodyScreenState extends State<AppliedJobBodyScreen> {
  PageController pageController = PageController();
  late AppliedJobCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = AppliedJobCubit.get(context);
   // cubit = BlocProvider.of<AppliedJobCubit>(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Applied Job", context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MenuBarAppliedJob(pageController: pageController,),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                AppliedJobActiveScreen(),
                AppliedJobRejectedScreen()
              ],
              onPageChanged: (index) {
                cubit.changeIndex(index);
              },
            ),
          ),

        ],
      ),
    );
  }


}


