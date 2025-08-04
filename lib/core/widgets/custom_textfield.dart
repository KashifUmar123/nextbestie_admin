import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChange,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.validator,
    this.isReadOnly = false,
    this.onTap,
    this.initialValue,
    this.onSaved,
    this.enableAutoCorrection = false,
    this.textCapitalization = TextCapitalization.none,
    this.prefix,
    this.suffix,
    this.borderRadius,
    this.focusNode,
    this.showBorder = true,
    this.hasPrefixIcon = true,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.fillColor,
    this.inputFormatters,
    this.borderColor,
    this.enabledBorderColor,
    this.contentPadding,
    this.width,
  });

  final TextEditingController? controller;
  final Function(String)? onChange;
  final String? labelText;
  final String? hintText;
  final bool hasPrefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final String? initialValue;
  final Function(String?)? onSaved;
  final bool enableAutoCorrection;
  final TextCapitalization textCapitalization;
  final Widget? prefix;
  final Widget? suffix;
  final BorderRadius? borderRadius;
  final FocusNode? focusNode;
  final bool? showBorder;
  final Color? fillColor;
  final int? minLines;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? width;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecureText = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      obsecureText = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    if (widget.initialValue != oldWidget.initialValue) {
      log("Text changed: ${widget.initialValue}");
      super.didUpdateWidget(oldWidget);
    }
  }

  void onTapPress() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300,
      child: TextFormField(
        controller: widget.controller,
        obscureText: obsecureText,
        style: context.label16400.copyWith(
          color:
              AppColors.textColor.withValues(alpha: widget.isReadOnly ? .7 : 1),
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onSaved: widget.onSaved,
        cursorColor: AppColors.textColor.withValues(alpha: .8),
        validator: widget.validator,
        readOnly: widget.isReadOnly,
        onTap: widget.onTap,
        initialValue: widget.initialValue,
        autocorrect: widget.enableAutoCorrection,
        autofocus: false,
        textCapitalization: widget.textCapitalization,
        focusNode: widget.focusNode,
        minLines: widget.minLines ?? 1,
        maxLines: widget.maxLines ?? 1,
        onChanged: widget.onChange,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? AppColors.textFieldFilled,
          filled: true,
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: context.label12400.copyWith(color: AppColors.iconColor),
          prefixIcon: widget.hasPrefixIcon
              ? Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: widget.prefix,
                )
              : null,
          hintStyle: context.label16400.copyWith(
            color: AppColors.iconColor,
          ),
          suffixIcon: widget.suffix ?? _getSuffixWidget(),
          border: widget.showBorder!
              ? OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: widget.borderColor ??
                        AppColors.black.withValues(alpha: .35),
                  ),
                )
              : InputBorder.none,
          errorBorder: widget.showBorder!
              ? OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.red),
                )
              : InputBorder.none,
          focusedBorder: widget.showBorder!
              ? OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: widget.enabledBorderColor ??
                        AppColors.black.withValues(alpha: .7),
                  ),
                )
              : InputBorder.none,
          enabledBorder: widget.showBorder!
              ? OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: widget.borderColor ??
                        AppColors.black.withValues(alpha: .35),
                  ),
                )
              : InputBorder.none,
        ),
      ),
    );
  }

  Widget? _getSuffixWidget() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          obsecureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.black.withValues(alpha: .6),
        ),
        onPressed: onTapPress,
      );
    }
    return null;
  }
}
