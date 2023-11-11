import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/search_bar.dart';


class HelpCenterScreen extends StatelessWidget {
   HelpCenterScreen({super.key});
TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Help Center',context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(controller: searchController, hintText: "What can we help?"),
              SizedBox(height: 3.h,),
              ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => HelpCenterTile(
                  HelpCenterModel(
                    title: 'Lorem ipsum dolor sit amet',
                    body:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpCenterTile extends StatefulWidget {
  final HelpCenterModel helpCenterModel;
  const HelpCenterTile(this.helpCenterModel, {super.key});

  @override
  State<HelpCenterTile> createState() => _HelpCenterTileState();
}

class _HelpCenterTileState extends State<HelpCenterTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppTheme.neutral3),
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.white,
          elevation: 0.3,
          child: ExpansionTile(
            title: Text(
              widget.helpCenterModel.title,
              style:  TextStyle(
                color: AppTheme.neutral9,
                fontSize: 13.5.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            trailing: const Icon(Iconsax.arrow_down_1),
            children: <Widget>[
              ListTile(
                title: Text(
                  widget.helpCenterModel.body,
                  style:  TextStyle(
                    color: AppTheme.neutral5,
                    fontSize: 11.5.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class HelpCenterModel {
  final String title;
  final String body;

  HelpCenterModel({required this.title, required this.body});
}
