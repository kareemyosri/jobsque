import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import '../../view_model/register_cubit.dart';

class SelectTypeJobMenu extends StatefulWidget {
  const SelectTypeJobMenu({Key? key}) : super(key: key);

  @override
  State<SelectTypeJobMenu> createState() => _SelectTypeJobMenuState();
}

class _SelectTypeJobMenuState extends State<SelectTypeJobMenu> {
  late RegisterCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=RegisterCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 6.h,
          decoration: const BoxDecoration(
            color: AppTheme.neutral1,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  onTap: () {
                    cubit.changeIndex(0);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    alignment: Alignment.center,
                    decoration: (cubit.activeIndex == 0)
                        ? const BoxDecoration(
                      color: AppTheme.primary9,
                      borderRadius:
                      BorderRadius.all(Radius.circular(100.0)),
                    )
                        : null,
                    child: Text(
                      "Work From Office",
                      style: (cubit.activeIndex == 0)
                          ? TextStyle(
                        color: Colors.white,
                        fontSize: 11.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      )
                          : TextStyle(
                        color: AppTheme.neutral5,
                        fontSize: 11.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  onTap: () {
                    cubit.changeIndex(1);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    alignment: Alignment.center,
                    decoration: (cubit.activeIndex == 1)
                        ? const BoxDecoration(
                      color: AppTheme.primary9,
                      borderRadius:
                      BorderRadius.all(Radius.circular(100.0)),
                    )
                        : null,
                    child: Text(
                      "Remote Work",
                      style: (cubit.activeIndex == 1)
                          ? TextStyle(
                        color: Colors.white,
                        fontSize: 11.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      )
                          : TextStyle(
                        color: AppTheme.neutral5,
                        fontSize: 11.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


