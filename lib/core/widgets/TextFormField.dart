import 'package:flutter/material.dart';

import '../styles/color.dart';

class CustomTextFormField extends StatelessWidget {
   final TextEditingController controller;
   final TextInputType? keyboardType;
   final Widget? prefixIcon;
   final Widget? suffixIcon;
   final String hintText;
   final String? labelText;
   final String? Function(String?)? validator;
   final Function()? onTap;
   final Color? prefixIconColor;
   final Color? suffixIconColor;
   final bool obscureText;
   final Color? errorColor;
   final AutovalidateMode? autoValidateMode;
   final String? errorText;

   const CustomTextFormField({super.key,
     required this.controller,
     this.keyboardType,
     this.prefixIcon,
     this.suffixIcon,
     required this.hintText,
     this.labelText,
     this.validator,
     this.onTap,
     this.prefixIconColor,
     this.suffixIconColor,
     required this.obscureText, this.errorColor, this.autoValidateMode, this.errorText
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,

      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,

        suffixIcon: suffixIcon,
        suffixIconColor:suffixIconColor ,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,
          color: AppTheme.neutral4,
        ),
        errorText: errorText,
        errorStyle:   TextStyle(
          color: errorColor,
          fontSize: 16,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.neutral3,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary5),
        ),
      ),
    );
  }


}
