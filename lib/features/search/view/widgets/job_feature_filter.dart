import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/search/view_model/search_cubit.dart';
import 'package:jobsque/core/styles/color.dart';
import 'package:sizer/sizer.dart';

class JobFeatureFilter extends StatefulWidget {
  final String text;


  const JobFeatureFilter({super.key,
    required this.text,
  });

  @override
  State<JobFeatureFilter> createState() => _JobFeatureFilterState();
}

class _JobFeatureFilterState extends State<JobFeatureFilter> {
  late SearchCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=SearchCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    return InkWell(
      onTap: (){
        if(cubit.jobTypeFilter.contains(widget.text)){
          cubit.deleteItem(widget.text);
        }
        else{
          cubit.addItem(widget.text);
        }
        print(cubit.jobTypeFilter);
      },
      child: Container(
        width: 20.w,
        height: 3.5.h,
        decoration: ShapeDecoration(
          color:  cubit.jobTypeFilter.contains(widget.text)? AppTheme.primary1:Colors.transparent,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: cubit.jobTypeFilter.contains(widget.text)? Colors.transparent:AppTheme.neutral4
            ),
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color:cubit.jobTypeFilter.contains(widget.text)? AppTheme.primary5:AppTheme.neutral5 ,
              fontSize: 10.sp,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
        ),
      ),
    );
  },
);
  }
}
