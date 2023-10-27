import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../styles/color.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String hintText;
  const CustomSearchBar({super.key,
    this.onChanged,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          prefixIconColor: const Color(0xFF292D32),


          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,
            color: AppTheme.neutral4,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: AppTheme.neutral3,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primary5),
          ),
        ),
      ),
    );
  }


}
