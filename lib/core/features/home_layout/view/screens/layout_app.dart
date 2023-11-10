import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../view_model/layout_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late LayoutCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = LayoutCubit.get(context);
    cubit.changeIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            selectedItemColor: AppTheme.primary5,
            selectedLabelStyle: TextStyle(
              color: AppTheme.primary5,
              fontSize: 9.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,),
            selectedIconTheme: const IconThemeData(

              color: AppTheme.primary5
            ),
            unselectedItemColor: AppTheme.neutral4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Iconsax.home,
                ),
                activeIcon: const Icon(
                  Iconsax.home_15,
                ),
                label: cubit.titles[0],
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.message,
                  ),
                  activeIcon: const Icon(
                    Iconsax.message5,
                  ),
                  label: cubit.titles[1]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.briefcase,
                  ),
                  activeIcon:  Padding(
                    padding: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                    child: const Icon(
                      Iconsax.briefcase5,
                    ),
                  ),
                  label: cubit.titles[2]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.archive_minus,
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                    child: const Icon(
                      Iconsax.archive_minus5,

                    ),
                  ),
                  label: cubit.titles[3]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.frame_1,
                  ),
                  activeIcon: const Icon(
                    Iconsax.frame5,
                  ),
                  label: cubit.titles[4]),
            ],
          ),
        );
      },
    );
  }
}
