import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/color.dart';

class CustomSocialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String image;

  const CustomSocialButton(this.image, this.onPressed, this.text, {super.key});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 13),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(8), // <-- Radius
        ),
        side: const BorderSide(
          color: AppTheme.neutral3,
        ),
      ),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 1.w,),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(text,
              style: const TextStyle(
                color: Color(0xFF363F5E),
                fontSize: 14,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),

    );
  }
}
