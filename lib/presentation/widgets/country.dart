import 'package:flutter/material.dart';
import 'package:jobsque/presentation/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/register/register_cubit.dart';

class CustomCountryChip extends StatefulWidget {
  final CounrtyModel country;
  const CustomCountryChip(this.country, {super.key});

  @override
  State<CustomCountryChip> createState() => _CustomCountryChipState();
}

class _CustomCountryChipState extends State<CustomCountryChip> {
  late RegisterCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(cubit.selectedCountries.contains(widget.country.name)){
          cubit.deleteItemCountry(widget.country.name);
        }
        else{
          cubit.addItemCountry(widget.country.name);
        }
        print(cubit.selectedCountries);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 42,
          padding:
          const EdgeInsets.only(top: 8, left: 10, right: 14, bottom: 8),
          decoration: ShapeDecoration(
            color: cubit.selectedCountries.contains(widget.country.name)
                ? AppTheme.primary1
                : const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              side: BorderSide(

                  color: cubit.selectedCountries.contains(widget.country.name)
                      ? AppTheme.primary5
                      : AppTheme.neutral2),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.country.label),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
               SizedBox(width: 1.5.w),
              Flexible(
                child: Text(
                  widget.country.name,
                  style: const TextStyle(
                    color: AppTheme.neutral9,
                    fontSize: 16,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,
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

class CounrtyModel {
  final String name;
  final String label;
  const CounrtyModel(this.name, this.label);
}

List<CounrtyModel> countries = const [
  CounrtyModel(
    "United States",
    "https://cdn-icons-png.flaticon.com/128/197/197484.png",
  ),
  CounrtyModel(
    "Malaysia",
    "https://cdn-icons-png.flaticon.com/128/197/197581.png",
  ),
  CounrtyModel(
    "Singapore",
    "https://cdn-icons-png.flaticon.com/128/197/197496.png",
  ),
  CounrtyModel(
    "Indonesia",
    "https://cdn-icons-png.flaticon.com/128/6157/6157721.png",
  ),
  CounrtyModel(
    "Philiphines",
    "https://cdn-icons-png.flaticon.com/512/197/197561.png",
  ),
  CounrtyModel(
    "Polandia",
    "https://cdn-icons-png.flaticon.com/128/197/197529.png",
  ),
  CounrtyModel(
    "India",
    "https://cdn-icons-png.flaticon.com/128/10576/10576638.png",
  ),
  CounrtyModel(
    "Vietnam",
    "https://cdn-icons-png.flaticon.com/128/197/197473.png",
  ),
  CounrtyModel(
    "China",
    "https://cdn-icons-png.flaticon.com/128/5372/5372696.png",
  ),
  CounrtyModel(
    "Canada",
    "https://cdn-icons-png.flaticon.com/128/197/197430.png",
  ),
  CounrtyModel(
    "Saudi Arabia",
    "https://cdn-icons-png.flaticon.com/128/5111/5111777.png",
  ),
  CounrtyModel(
    "Argentina",
    "https://cdn-icons-png.flaticon.com/128/197/197573.png",
  ),
  CounrtyModel(
    "Brazil",
    "https://cdn-icons-png.flaticon.com/128/9906/9906449.png",
  ),
];