import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/features/apply_job/view/widgets/pdf_screen.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:jobsque/util/router/app_route.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../util/styles/color.dart';

class CustomPortfolioItem extends StatefulWidget {
  final String text;
  final String size;
  final bool? isImage;
  const CustomPortfolioItem({super.key, required this.text, required this.size, this.isImage=false});

  @override
  State<CustomPortfolioItem> createState() => _CustomPortfolioItemState();
}

class _CustomPortfolioItemState extends State<CustomPortfolioItem> {

   late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppTheme.neutral3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.network(
            widget.isImage!?
            'https://cdn.icon-icons.com/icons2/2570/PNG/512/image_icon_153794.png':
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRZJY2YZTyHwVQqbb9Dzsrz2bAdR2JfJCzito195cDsUnjnjCSf',
            width: 5.5.h,
            height: 5.5.h,
          ),
          title:  Text(
            widget.text,
            style: TextStyle(
              color: AppTheme.neutral9,
              fontSize: 11.5.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            widget.isImage!? 'IMG ${widget.size} MB':
            'CV.pdf ${widget.size} MB',
            style: TextStyle(
              color: AppTheme.neutral5,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: SizedBox(
            width: 27.w,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {
                  if( widget.isImage!)
                 {
                   Navigator.pushNamed(context, AppRoute.imageScreen);
                 }
                 else{
                    Navigator.pushNamed(context, AppRoute.pdfScreen);

                  }



                },
                  icon: Icon(
                    Iconsax.edit_2,
                    color: AppTheme.primary5,
                    size: 20.sp,
                  ),

                ),
                IconButton(onPressed: () {  },
                  icon: Icon(
                    Iconsax.close_circle,
                    color: AppTheme.danger5,
                    size: 20.sp,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}