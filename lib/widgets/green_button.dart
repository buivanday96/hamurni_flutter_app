import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamurni_flutter_app/settings/color_setting.dart';
import 'package:hamurni_flutter_app/settings/font_setting.dart';

class GreenButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;
  final double height;

  const GreenButton({
    Key key,
    this.onTap,
    this.text,
    this.width = 133,
    this.height = 48,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorApp,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      elevation: 0.0,
      child: Container(
        height: height.h,
        width: width.w,
        child: InkWell(
          splashColor: Colors.grey,
          borderRadius: BorderRadius.circular(4.r),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontRoboto,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
