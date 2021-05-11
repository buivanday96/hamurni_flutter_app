import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamurni_flutter_app/settings/color_setting.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;

  const MyButton({
    Key key,
    this.onTap,
    this.text = '',
    this.width,
    this.height,
    this.backgroundColor = colorApp,
    this.textStyle,
  }) : super(
          key: key,
        );

  factory MyButton.elevated({
    Key key,
    Function onTap,
    String text,
    double width,
    double height,
    Color backgroundColor,
    TextStyle textStyle,
    double borderRadius,
  }) = ButtonElevated;

  factory MyButton.outlined({
    Key key,
    Function onTap,
    String text,
    double width,
    double height,
    Color backgroundColor,
    Color borderColor,
    TextStyle textStyle,
    double borderRadius,
  }) = ButtonOutlined;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ButtonElevated extends MyButton {
  final double borderRadius;
  ButtonElevated({
    this.borderRadius,
    Key key,
    Function onTap,
    String text = '',
    double width,
    double height,
    Color backgroundColor = colorApp,
    TextStyle textStyle,
  }) : super(
          key: key,
          onTap: onTap,
          text: text,
          width: width,
          height: height,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: textStyle,
        ),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
          backgroundColor: DefaultForeground(backgroundColor, Colors.grey),
          foregroundColor: DefaultForeground(backgroundColor, Colors.grey),
          elevation: DefaultElevation(),
          padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonOutlined extends MyButton {
  final double borderRadius;
  final Color borderColor;

  ButtonOutlined({
    this.borderRadius,
    this.borderColor,
    Key key,
    Function onTap,
    String text = '',
    double width,
    double height,
    Color backgroundColor = colorApp,
    TextStyle textStyle,
  }) : super(
          key: key,
          onTap: onTap,
          text: text,
          width: width,
          height: height,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: textStyle,
        ),
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
            backgroundColor: DefaultForeground(backgroundColor, Colors.grey),
            foregroundColor: DefaultForeground(backgroundColor, Colors.grey),
            overlayColor: DefaultOverplay(),
            //elevation: DefaultElevation(),
            padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(EdgeInsets.zero),
            shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
              ),
            ),
            side: ButtonStyleButton.allOrNull<BorderSide>(
              BorderSide(
                color: borderColor ?? Colors.transparent,
                style: BorderStyle.solid,
                width: 2.0,
              ),
            )),
      ),
    );
  }
}

class DefaultForeground extends MaterialStateProperty<Color> with Diagnosticable {
  final Color primary;
  final Color onSurface;

  DefaultForeground(
    this.primary,
    this.onSurface,
  );

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return onSurface?.withOpacity(0.95);
    return primary;
  }
}

class DefaultOverplay extends MaterialStateProperty<Color> with Diagnosticable {
  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.white.withOpacity(0.39);
    }
    return Colors.transparent;
  }
}

class DefaultElevation extends MaterialStateProperty<double> with Diagnosticable {
  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) return 5;
    return 0;
  }
}
