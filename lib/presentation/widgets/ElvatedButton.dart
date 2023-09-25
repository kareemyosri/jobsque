import 'package:flutter/material.dart';
import 'package:jobsque/presentation/styles/color.dart';

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
          child:Text(text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
          ),

      ),
    );
  }
}
