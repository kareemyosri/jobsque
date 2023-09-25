import 'package:flutter/material.dart';
import 'package:jobsque/Models/languageModel.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:sizer/sizer.dart';

class CustomLanguageItem extends StatelessWidget {
  final int value;
  final LanguageModel languageModel;

  const CustomLanguageItem(this.value, this.languageModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: SizedBox(
        width: 8.5.w,
        height: 2.5.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(
            languageModel.flag,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        languageModel.lang,
        style:  TextStyle(
          color: AppTheme.neutral9,
          fontSize: 13.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w500,

        ),
      ),
      trailing: Radio(
        value: value,
        groupValue: 1,
        activeColor: AppTheme.primary5,
        splashRadius: 25,
        onChanged: (value) {},
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}