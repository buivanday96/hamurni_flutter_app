import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamurni_flutter_app/settings/color_setting.dart';

class GreenButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final TextStyle textStyle;
  const GreenButton({
    Key key,
    this.onTap,
    this.text = '',
    this.width = 10,
    this.height = 10,
    this.borderColor = colorApp,
    this.backgroundColor = colorApp,
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return outlineBtn();
  }

  Widget normalBtn() {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      elevation: 0.0,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4.r),
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget outlineBtn() {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
            side: BorderSide(
              color: colorApp,
              width: 1.2,
            ),
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            )),
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
