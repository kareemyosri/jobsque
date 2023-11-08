import 'package:flutter/material.dart';

import '../animations/slide_transition_animation.dart';
import '../styles/color.dart';

class CustomElevatedButton extends StatelessWidget {
   final void Function()? onPressed;
   final double? width;
   final String text;

   const CustomElevatedButton( this.onPressed, this.text, {super.key, this.width=double.infinity});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primary5,
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000), // <-- Radius
          ),
        ),
          child:
          SlideTransitionAnimation(duration: const Duration(seconds:1), begin:  const Offset(0.7, 0), end: Offset.zero,
            child: Text(text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,
              ),
            ),)


      ),
    );
  }
}
