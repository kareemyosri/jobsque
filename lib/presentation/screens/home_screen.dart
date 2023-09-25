
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/presentation/screens/notification/notification_screen.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:jobsque/presentation/widgets/recent_job_item.dart';
import 'package:jobsque/presentation/widgets/search_bar.dart';
import 'package:sizer/sizer.dart';

import '../widgets/job_status_item.dart';
import '../widgets/suggested_job_item.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
          padding:  const EdgeInsets.fromLTRB(24, 16, 0, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Rafif Dian👋',
                style: TextStyle(
                  color: AppTheme.neutral9,
                  fontSize: 20.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 0.8.h,),
              Text(
                'Create a better future for yourself here',
                style: TextStyle(
                  color: AppTheme.neutral5,
                  fontSize: 11.5.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 0.8.h,),

            ],
          ),
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            child: Container(
              width: 48,
              height: 48,
            //  padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide( color: AppTheme.neutral3),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child:  Center(
                child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                },
                    icon: const Icon(Iconsax.notification)
                ),
              )
            ),
          ),



        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(controller: searchController, hintText: "Search...."),
              SizedBox(height: 2.h,),
              JobStatusItem(title: 'Twitter', subTitle: 'Waiting to be selected by the twitter team', isAccepted: true,),
              SizedBox(height: 2.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggested Job',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 15.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text(
                    'View all',
                    style: TextStyle(
                      color: AppTheme.primary5,
                      fontSize: 11.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>
                    const SuggestedJobItem(jobTitle: 'Product Designer', jobSubTitle: 'Zoom • United States',),
                    separatorBuilder: (context,index)=> SizedBox(width: 4.w,),
                    itemCount: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Job',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 15.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text(
                    'View all',
                    style: TextStyle(
                      color: AppTheme.primary5,
                      fontSize: 11.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  )),
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>
                  const RecentJobItem(jobTitle: "Senior UI Designer", jobSubTitle: "Twitter • Jakarta, Indonesia "),
                  separatorBuilder: (context,index)=>const Divider(),
                  itemCount: 10),



            ],
          ),
        ),
      ),
    );
  }
}
