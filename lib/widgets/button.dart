import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color splashColor;
  final Color disableColor;
  final TextStyle textStyle;
  final bool isDisable;

  const MyButton({
    Key key,
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.backgroundColor = Colors.blue,
    this.textStyle,
    this.splashColor = Colors.amber,
    this.disableColor = Colors.grey,
    this.isDisable = false,
  }) : super(
          key: key,
        );

  factory MyButton.elevated({
    Key key,
    double width,
    double height,
    String text,
    TextStyle textStyle,
    double elevation,
    Color backgroundColor,
    Color splashColor,
    Color disableColor,
    double borderRadius,
    bool isDisable,
    Function onTap,
  }) = ButtonElevated;

  factory MyButton.outlined({
    Key key,
    double width,
    double height,
    String text,
    TextStyle textStyle,
    Color backgroundColor,
    Color splashColor,
    Color borderColor,
    Color disableColor,
    double borderRadius,
    bool isDisable,
    Function onTap,
  }) = ButtonOutlined;

  /// [kMinInteractiveDimension] = 48.
  ///
  /// Caculator distance : top - [kMinInteractiveDimension] /4
  ///
  ///  right  - [kMinInteractiveDimension] /4

  factory MyButton.icon({
    Key key,
    @required IconData iconData,
    EdgeInsetsGeometry iconPadding,
    double iconSize,
    Color iconColor,
    String tooltip,
    bool isAreaTap,
    Function onTap,
  }) = ButtonIcon;

  factory MyButton.iconSvg({
    Key key,
    @required String assetName,
    EdgeInsetsGeometry iconPadding,
    double iconSize,
    Color iconColor,
    String tooltip,
    bool isAreaTap,
    Function onTap,
  }) = ButtonIconSvg;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ButtonElevated extends MyButton {
  final double borderRadius;
  final double elevation;
  ButtonElevated({
    Key key,
    double width,
    double height,
    String text,
    TextStyle textStyle,
    this.elevation,
    Color backgroundColor,
    Color splashColor,
    Color disableColor,
    this.borderRadius,
    bool isDisable,
    Function onTap,
  }) : super(
          key: key,
          onTap: onTap,
          text: text,
          width: width,
          height: height,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          splashColor: splashColor,
          isDisable: isDisable ?? false,
          disableColor: disableColor,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap == null || isDisable ? null : onTap,
        child: Text(
          text ?? '',
          style: textStyle,
        ),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
          backgroundColor: DefaultForeground(backgroundColor, disableColor),
          foregroundColor: DefaultForeground(backgroundColor, disableColor),
          overlayColor: DefaultOverplay(splashColor: splashColor),
          elevation: DefaultElevation(elevation: elevation),
          padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
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
    Key key,
    double width,
    double height,
    String text,
    TextStyle textStyle,
    this.borderRadius,
    this.borderColor,
    Color backgroundColor,
    Color splashColor,
    Color disableColor,
    bool isDisable,
    Function onTap,
  }) : super(
          key: key,
          onTap: onTap,
          text: text,
          width: width,
          height: height,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          splashColor: splashColor,
          isDisable: isDisable ?? false,
          disableColor: disableColor,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap == null || isDisable ? null : onTap,
        child: Text(
          text ?? '',
          style: textStyle,
        ),
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
            backgroundColor: DefaultForeground(backgroundColor, disableColor),
            foregroundColor: DefaultForeground(backgroundColor, disableColor),
            overlayColor: DefaultOverplay(splashColor: splashColor),
            padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(EdgeInsets.zero),
            shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
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

class ButtonIcon extends MyButton {
  final double iconSize;
  final Color iconColor;
  final EdgeInsetsGeometry iconPadding;
  final IconData iconData;
  final String tooltip;
  final bool isAreaTap;

  ButtonIcon({
    Key key,
    @required this.iconData,
    this.iconSize = 24,
    this.iconColor,
    this.iconPadding,
    this.tooltip,
    this.isAreaTap = false,
    Function onTap,
  }) : super(
          key: key,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        shape: CircleBorder(),
        child: IconButton(
          icon: Icon(
            iconData,
            size: iconSize,
          ),
          tooltip: tooltip,
          color: Colors.grey,
          splashColor: Theme.of(context).splashColor,
          splashRadius: 90,
          highlightColor: Colors.transparent,
          padding: iconPadding ?? EdgeInsets.all(0),
          constraints: isAreaTap
              ? BoxConstraints(
                  minWidth: kMinInteractiveDimension,
                  minHeight: kMinInteractiveDimension,
                )
              : BoxConstraints(),
          onPressed: onTap,
        ),
      ),
    );
  }
}

class ButtonIconSvg extends MyButton {
  final double iconSize;
  final Color iconColor;
  final EdgeInsetsGeometry iconPadding;
  final String assetName;
  final String tooltip;
  final bool isAreaTap;

  ButtonIconSvg({
    Key key,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.assetName,
    this.tooltip,
    this.isAreaTap = false,
    Function onTap,
  }) : super(
          key: key,
          onTap: onTap,
        );
  @override
  Widget build(BuildContext context) {
    Widget result = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: isAreaTap ? kMinInteractiveDimension / 1 : 0,
        minHeight: isAreaTap ? kMinInteractiveDimension / 1 : 0,
      ),
      child: Padding(
        padding: iconPadding ?? EdgeInsets.all(0),
        child: SizedBox(
          height: iconSize - 4,
          width: iconSize - 4,
          child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                assetName,
                width: iconSize - 4,
                height: iconSize - 4,
                color: iconColor,
              )),
        ),
      ),
    );

    if (tooltip != null) {
      result = Tooltip(
        message: tooltip,
        child: result,
      );
    }

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        shape: CircleBorder(),
        child: InkWell(
          child: result,
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.38),
        ),
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
  final Color splashColor;

  DefaultOverplay({this.splashColor});
  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return splashColor ?? Colors.white.withOpacity(0.38);
    }
    return Colors.transparent;
  }
}

class DefaultElevation extends MaterialStateProperty<double> with Diagnosticable {
  final double elevation;

  DefaultElevation({this.elevation});
  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) return elevation ?? 0;
    return 0;
  }
}
