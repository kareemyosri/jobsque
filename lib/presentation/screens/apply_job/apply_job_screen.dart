import 'package:flutter/material.dart';
import 'package:jobsque/presentation/screens/apply_job/bio_data_screen.dart';
import 'package:jobsque/presentation/screens/apply_job/type_of_work_screen.dart';
import 'package:jobsque/presentation/screens/apply_job/upload_portfolio.dart';
import 'package:jobsque/presentation/widgets/ElvatedButton.dart';
import 'package:jobsque/presentation/widgets/app_bar.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/stepper_indicator.dart';

class ApplyJob extends StatefulWidget {
 // final List<FormPage> formPages;
  const ApplyJob( {super.key});

  @override
  State<ApplyJob> createState() => _FormStepsState();
}

class _FormStepsState extends State<ApplyJob> {
  int currentStep = 0;
  late PageController _pageController;
  List formPages=[

    FormPage(pageTitle: 'Bio Data', page:  BioDataScreen()),

    FormPage(pageTitle: 'Type of work', page: const TypeOfWorkScreen()),

    FormPage(

        pageTitle: 'Upload portfolio', page: const UploadPortfolio()),

  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar("Apply Job", context),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 2.h,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.33,
                  width: MediaQuery.of(context).size.width,

                  child: Row(
                      children: [
                        StepIndication(
                            1, "Bio Data", currentStep >= 0,
                            ),
                        StepIndication(
                            2, 'Type of work', currentStep >= 1,
                            ),
                        StepIndication(
                            3, 'Upload portfolio', currentStep >= 2,
                            lineState: false),
                      ]
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: _pageController,
                   physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (int i) {
                      //FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        currentStep = i;
                      });
                    },
                    children: [
                      BioDataScreen(),
                      TypeOfWorkScreen(),
                      UploadPortfolio()
                    ]

                    // widget.formPages
                    //     .map((page) => ConstrainedBox(
                    //     constraints: const BoxConstraints.expand(),
                    //     child: page.page))
                    //     .toList(),
                    // children: <Widget>[
                    // ConstrainedBox(
                    //   constraints: const BoxConstraints.expand(),
                    //   child: const Center(
                    //     child: Text("Place Bid"),
                    //   ),
                    // ),
                    //   ConstrainedBox(
                    //     constraints: const BoxConstraints.expand(),
                    //     child: const Center(
                    //       child: Text("Buy Now"),
                    //     ),
                    //   ),
                    // ],
                  ),
                ),
                SizedBox(height: 3.h,)
              ],
            ),
          ),
            Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomElevatedButton((){
                if (currentStep < 2) {
                  setState(() {
                    currentStep = currentStep + 1;
                  });
                  _onNextButtonPress(currentStep);
                }
              },


                  currentStep < 2? 'Next':'Submit'),
            ),
          ),

        ]));
  }

  void _onNextButtonPress(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

class FormPage {
  final String pageTitle;
  final Widget page;

  FormPage({
    required this.pageTitle,
    required this.page,
  });
}




