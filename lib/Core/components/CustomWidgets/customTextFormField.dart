import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    required this.controller,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
    this.color = Colors.black,
    this.cursorColor = mainColor,
    this.fillColor,
    this.borderRadius,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    this.keyboardType,
    this.onTap,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.labelFontSize = 12,
    this.hintText,
    this.helperText,
    this.hintFontSize = 12,
    this.isDense = true,
    this.showErrorMessage = true,
    this.onSaved,
    this.textColor,
    this.maxLines = 1,
  });

  final String? label;
  final String? hintText;
  final String? helperText;
  final double labelFontSize;
  final double hintFontSize;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? textColor;
  final Color? cursorColor;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final TextAlign textAlign;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final bool isDense;
  final bool showErrorMessage;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textAlign: textAlign,
      cursorColor: cursorColor,
      cursorRadius: const Radius.circular(10),
      cursorWidth: 2,
      cursorOpacityAnimates: true,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: showErrorMessage ? hintFontSize : 0),
        isDense: isDense,
        hintText: hintText,
        helperText: helperText,
        filled: fillColor != null ? true : false,
        fillColor: fillColor,
        contentPadding: contentPadding,
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: MediaQuery.textScalerOf(context).scale(labelFontSize),
          color: textColor ?? Colors.black,
          fontFamily: 'Montserrat',
        ),
        helperStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: MediaQuery.textScalerOf(context).scale(labelFontSize),
          color: const Color(0xffd8d8d8),
          fontFamily: 'Montserrat',
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: MediaQuery.textScalerOf(context).scale(hintFontSize),
          fontFamily: 'Montserrat',
        ),
        floatingLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: MediaQuery.textScalerOf(context).scale(labelFontSize + 2),
          color: color,
          fontFamily: 'Montserrat',
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          borderSide: BorderSide(color: color!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          borderSide: BorderSide(color: color!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIconColor: color,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      validator: validator,
      obscureText: isPassword!,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
