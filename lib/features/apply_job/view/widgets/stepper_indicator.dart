import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/styles/color.dart';
import 'dotted_line.dart';

class StepIndication extends StatefulWidget {
  final int index;
  final String text;
  final bool state, lineState;
  final double? raduis;

  const StepIndication(this.index, this.text, this.state,
      {super.key, this.lineState = true, this.raduis});

  @override
  State<StepIndication> createState() => _StepIndicationState();
}

class _StepIndicationState extends State<StepIndication> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,      //here edited delete it to be old
          mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                  width: widget.raduis?? 5.5.h,
                  height:widget.raduis?? 5.5.h ,
                  decoration: ShapeDecoration(
                    color: widget.state ? AppTheme.primary5 : Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(

                          color: widget.state
                              ? AppTheme.primary5
                              : AppTheme.neutral4),
                    ),
                  ),
                  child: Center(
                    child: widget.state
                        ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                        : Text(
                      widget.index.toString(),
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        color: AppTheme.neutral4,
                        fontSize: 13.5.sp,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  )),
              SizedBox(height: 1.h,),
              SizedBox(
                //width: 19.w, //here 25.w
                child: Text(
                  widget.text,
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,

                 // textAlign: TextAlign.center,  //here edited make it center to be old
                  style: TextStyle(

                    color: widget.state
                        ? AppTheme.primary5
                        : AppTheme.neutral9,
                    fontSize: 10.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ),
            ]),
        Row(

          children: [
            Visibility(
                visible: widget.lineState,
                child: Row(
                  children: [
                    SizedBox(width: 2.w,),
                    DottedLine(

                      dashColor: widget.state
                          ? AppTheme.primary5
                          : AppTheme.neutral3,
                      totalWidth: 9.w,
                      dashWidth: 1.w,
                      dashHeight: 0.15.h,
                    ),
                    //SizedBox(width: 3.w,)
                  ],
                )
            ),
          ],
        ),
      ],
    );
  }
}

