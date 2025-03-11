import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/app/core/values/app_values.dart';

import '../base/theme/get_all_theme.dart';
import '../values/app_colors/app_colors.dart';
import '../values/app_colors/text_form_field_color.dart';
import '../values/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final int themIndex;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool isCurrentPasswordField;
  final bool isConfirmPasswordField;
  final String? hintText;
  final IconData? icon;
  final bool isPassword;
  final Color? hintColor;
  final double? hintTextSize;
  final Color? textColor;
  final TextInputType? textInputType;
  final Function? onChanged;
  final Function? validation;
  final Function? onTap;
  final Function? onFieldSubmit;
  final Function? suffixIconOnTap;
  final TextEditingController? controller;
  final bool? isReadOnly;
  final EdgeInsets? padding;
  final double? height;
  final double? fontSize;
  final String? errorText;
  final double? outLineBoarder;
  final Color? fillColor;
  final bool? isContentPadding;
  final double contentPaddingVertical;
  final double contentPaddingHorizontal;
  final double? iconPadding;
  final String? prefixIconString;
  final String? suffixIconString;
  final bool? isFilled;
  final FontWeight? fontWeight;
  final Color? iconColor;
  final bool? isErrorValidation;
  final String? labelText;
  final bool? isOutlineBoarder;
  final bool? isDigitOnly;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? isAutovalidateMode;
  final Color? enabledBoarderColor;
  final Color? focusBoarderColor;
  final Color? errorBoarderColor;
  final bool onlyShowingBoarderError;
  final bool enabled;
  final bool isPhoneNumber;
  final bool isLabelShowAlways;
  final List<TextInputFormatter>? inputFormatters;
  final double boarderRadius;
  final double suffixIconSize;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? labelTextColor;
  final Color? textStyleColor;
  final dynamic prefixSecondWidget;
  final int multiline;
  final bool isShowCounterText;

  const CustomTextFormField({
    super.key,
    this.themIndex = 0,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.icon,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.controller,
    this.hintColor,
    this.textColor = Colors.black,
    this.onChanged,
    this.onTap,
    this.isReadOnly = false,
    this.padding,
    this.height = 0,
    this.fontSize = 14,
    this.errorText = "",
    this.isOutlineBoarder = true,
    this.validation,
    this.fillColor = AppColors.whiteOnly,
    this.outLineBoarder,
    this.iconPadding,
    this.prefixIconString,
    this.suffixIconString,
    this.isFilled = true,
    this.fontWeight = FontWeight.w400,
    this.hintTextSize = 16,
    this.iconColor = Colors.grey,
    this.isErrorValidation = true,
    this.labelText,
    this.isDigitOnly = false,
    this.maxLength = 10000000,
    this.contentPaddingHorizontal = 15,
    this.contentPaddingVertical = 12.2,
    this.isContentPadding = false,
    this.focusNode,
    this.isAutovalidateMode = false,
    this.isCurrentPasswordField = false,
    this.isConfirmPasswordField = false,
    this.onFieldSubmit,
    this.enabledBoarderColor,
    this.errorBoarderColor,
    this.focusBoarderColor,
    this.onlyShowingBoarderError = false,
    this.enabled = true,
    this.isPhoneNumber = false,
    this.isLabelShowAlways = false,
    this.inputFormatters,
    this.boarderRadius = 8,
    this.suffixIconOnTap,
    this.suffixIconSize = 22,
    this.prefixIconColor,
    this.suffixIconColor,
    this.labelTextColor,
    this.textStyleColor,
    this.prefixSecondWidget,
    this.multiline = 1,
    this.isShowCounterText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;
  late IconData? suffixIcon;
  late InputDecorationTheme inputDecorationTheme;
  late TextStyle textStyle;

  @override
  void initState() {
    // TODO: implement initState
    suffixIcon = widget.suffixIcon;
    obscureText = widget.isPassword;
    widget.controller?.addListener(() {
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final textFormFieldTheme = GetTheme().textFormFieldTheme();
    final extendThemeList = textFormFieldTheme.inputDecorationThemes;
    final textStyleList = textFormFieldTheme.textStyles;
    inputDecorationTheme = extendThemeList[widget.themIndex]!;
    textStyle = textStyleList[widget.themIndex]!;
    Color enableBoarderColor = widget.enabledBoarderColor ?? inputDecorationTheme.enabledBorder!.borderSide.color;
    Color focusBoarderColor = widget.focusBoarderColor ?? inputDecorationTheme.focusedBorder!.borderSide.color;
    Color errorBoarderColor = widget.errorBoarderColor ??  inputDecorationTheme.errorBorder!.borderSide.color;
    Color prefixIconColor = widget.prefixIconColor ??  inputDecorationTheme.prefixIconColor!;
    Color suffixIconColor = widget.suffixIconColor ??  inputDecorationTheme.suffixIconColor!;
    Color labelTextColor = widget.labelTextColor ??  inputDecorationTheme.labelStyle!.color!;
    Color hintColor = widget.suffixIconColor ??  inputDecorationTheme.hintStyle!.color!;
    Color floatingLabelColor = widget.suffixIconColor ??  inputDecorationTheme.floatingLabelStyle!.color!;
    Color fillColor = widget.fillColor ??  inputDecorationTheme.fillColor!;
    Color textStyleColor = widget.textStyleColor ??  textStyle.color!;

    return TextFormField(
      maxLines: widget.multiline,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.isReadOnly!,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      onTap: widget.onTap != null ? () => widget.onTap!() : null,
      autovalidateMode: widget.isAutovalidateMode! ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
      validator: widget.validation != null && !widget.onlyShowingBoarderError ? (String? txt) => widget.validation!(txt) : null,
      controller: widget.controller,
      obscureText: obscureText,
      keyboardType: widget.textInputType,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      onChanged: widget.onChanged != null ? (String txt) => widget.onChanged!(txt) : null,
      onFieldSubmitted: widget.onFieldSubmit != null ? (String txt) => widget.onFieldSubmit!(txt) : null,
      style:  myTxt14(color: textStyleColor, fontWeight: widget.fontWeight),
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 80),
        suffixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
        counterText:  !widget.isShowCounterText ? "" : "${widget.controller?.text.length ?? 0}/${widget.maxLength}",
        isDense: false,
          //for content padding workable it needs true
          isCollapsed: true,
          //isCollapsed: isContentPadding! ? true : false,
          border: widget.isOutlineBoarder! ?  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
            // borderSide:BorderSide(
            //   width: boarderWidthVariable, color: focusBoarderColor),
          ) : InputBorder.none,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
            borderSide:  BorderSide(
                width: AppValues.boarderWidthVariable, color: focusBoarderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
            borderSide: BorderSide(
                width:  AppValues.boarderWidthVariable, color: enableBoarderColor),
          ),
          errorBorder: !widget.onlyShowingBoarderError ? null : OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
            borderSide:  BorderSide(
              width:  AppValues.boarderWidthVariable, // Set the border width as desired
              color: errorBoarderColor, // Set the border color for error
            ),
          ),
          labelText: widget.labelText,
          floatingLabelStyle: WidgetStateTextStyle.resolveWith(
                (Set<WidgetState> states) {
              final Color color = states.contains(WidgetState.error)
                  ? Theme.of(context).colorScheme.error
                  : floatingLabelColor;
              return TextStyle(color: color, letterSpacing: 1.3, fontSize: 14);
            },
          ),
          floatingLabelBehavior: widget.isLabelShowAlways ? FloatingLabelBehavior.always  : null,
          labelStyle: TextStyle(fontSize: 14, color: labelTextColor),
          contentPadding: EdgeInsets.symmetric(horizontal: widget.contentPaddingHorizontal, vertical: widget.contentPaddingVertical/*(contentPaddingVertical+extraVerticalPadding).h*/),
          suffixIcon: widget.suffixIcon == null
              ? null
              : SizedBox(
            child: InkWell(
              onTap: (){
                if (widget.isPassword){
                  obscureText = !obscureText;
                  suffixIcon = obscureText ? const Icon(Icons.visibility_off).icon :  const Icon(Icons.visibility).icon;
                }else{
                  if(widget.suffixIconOnTap != null){
                    widget.suffixIconOnTap!();
                  }
                }
                setState(() {
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Icon(suffixIcon, color: suffixIconColor, size: widget.suffixIconSize.r, ),
              ),
            ),
          ),
          prefixIcon: widget.isPhoneNumber ? Container(
            margin: const EdgeInsets.only(top: 0),
            width: 40.w,
            child:  const Center(child: Text("+88", style: TextStyle(fontSize: 14),),),
          )
              : widget.prefixIcon == null
              ? null
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Icon(widget.prefixIcon, color: prefixIconColor, size: 22.r, ),
                ),
              ),
              if(widget.prefixSecondWidget != null)widget.prefixSecondWidget,
            ],
          ),
          hintText: widget.hintText,
         // hintStyle:  TextStyle(fontSize: 13, color: hintColor, fontWeight: FontWeight.normal, ),
          hintStyle:  TextStyle(fontSize: 14, color: labelTextColor),
          filled: widget.isFilled,
          fillColor: fillColor,
      ),
    );
  }
}