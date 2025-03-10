import 'package:flutter/material.dart';
import '../base/theme/extend_theme/text_button_theme_extend.dart';

class CustomTextButton extends StatefulWidget {
  final int themeIndex;
  final dynamic textWidget;
  final Function? onPressed;
  final Icon? icon;
  final double? textFontSize;
  final Color? textColor;
  final double boarderRadius;
  final double boarderWidth;
  final Color? boarderColor;
  final BoxShape boxShape;
  final Color? backgroundColor;
  final double borderRadius;
  final double buttonHeight;
  final double buttonWidth;
  final MainAxisAlignment myMainAxisAlignment;
  final bool isBoarder;

  const CustomTextButton({
    this.themeIndex = 0,
    this.textWidget = "",
    this.onPressed,
    this.icon,
    this.textFontSize = 14.0,
    this.textColor,
    this.boarderRadius = 5,
    this.boxShape = BoxShape.rectangle,
    this.myMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.backgroundColor,
    this.borderRadius = 5,
    this.buttonHeight  = 32,
    this.buttonWidth = 60,
    this.isBoarder = false,
    this.boarderColor,
    this.boarderWidth = 0.5,
    super.key
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  late ButtonStyle buttonStyle;
  late Color disabledColor;
  late Color bgColor;
  late Color bdColor;
  late Color txtColor;

  @override
  Widget build(BuildContext context) {
    final textButtonTheme = Theme.of(context).extension<TextButtonThemeExtend>()!;
    final availableStyles = textButtonTheme.textButtonStyles;
    final availableDisabledColors = textButtonTheme.disabledColors;

    buttonStyle = availableStyles[widget.themeIndex];
    bgColor = widget.backgroundColor ?? availableStyles[widget.themeIndex].backgroundColor!.resolve({})!;
    bdColor = widget.boarderColor ?? availableStyles[widget.themeIndex].backgroundColor!.resolve({})!;
    txtColor = widget.textColor ?? availableStyles[widget.themeIndex].textStyle!.resolve({})!.color!;
    disabledColor = availableDisabledColors[widget.themeIndex];

    return TextButton(
      onPressed:  widget.onPressed != null ? () => widget.onPressed!() : null,
      style: TextButton.styleFrom(
        minimumSize: Size(widget.buttonWidth, 20),
        fixedSize: Size.fromHeight(widget.buttonHeight),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        backgroundColor:  bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.boarderRadius),
          side: widget.isBoarder ?  BorderSide(color: bdColor, width: widget.boarderWidth) : BorderSide.none,
        ),
        side: widget.isBoarder ?  BorderSide(color: bdColor, width: widget.boarderWidth) : BorderSide.none,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Theme.of(context).disabledColor;
            }
            return bgColor;
          },
        ),
      ),
      child: widget.textWidget is String  ?  Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5),
        child: Text(widget.textWidget,  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: widget.textFontSize!,  color: txtColor),),
      ) : widget.textWidget,
    );
  }
}
