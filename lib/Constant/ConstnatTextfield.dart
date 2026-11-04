
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Constant_Color.dart';
import 'constantappdiamention.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.focusNode,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscure = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColor.darkBorder : AppColor.lightBorder;
    final fillColor = isDark ? AppColor.darkSurface : AppColor.lightSurface;
    final textColor =
    isDark ? AppColor.darkTextPrimary : AppColor.lightTextPrimary;
    final hintColor = isDark ? AppColor.darkTextHint : AppColor.lightTextHint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
             // fontFamily: AppFonts.urbanistSemiBold,
              fontSize: AppFontSize.sm,
              color: textColor,
            ),
          ),
          AppSpacing.h8,
        ],
        TextFormField(
          controller: widget.controller,
          obscureText: _obscure,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          textAlign: widget.textAlign,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          cursorColor: AppColor.primary,
          style: TextStyle(
           // fontFamily: AppFonts.urbanistMed,
            fontSize: AppFontSize.lg,
            color: textColor,
          ),
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            hintStyle: TextStyle(
             // fontFamily: AppFonts.urbanistReg,
              fontSize: AppFontSize.lg,
              color: hintColor,
            ),
            filled: true,
            fillColor: fillColor,
            prefixIcon: widget.prefix != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: widget.prefix,
            )
                : widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              color: hintColor,
              size: AppSizes.iconMd,
            )
                : null,

            prefixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _obscure
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: hintColor,
                size: AppSizes.iconMd,
              ),
              onPressed: () => setState(() => _obscure = !_obscure),
            )
                : widget.suffixIcon != null
                ? IconButton(
              icon: Icon(
                widget.suffixIcon,
                color: hintColor,
                size: AppSizes.iconMd,
              ),
              onPressed: widget.onSuffixTap,
            )
                : widget.suffix != null
                ? Padding(
              padding: const EdgeInsets.only(right: 12,top: 12),
              child: widget.suffix,
            )
                : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: AppRadius.sl,
              borderSide: BorderSide(color: AppColor.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.sl,
              borderSide: BorderSide(color: AppColor.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.sl,
              borderSide: BorderSide(color: borderColor.withValues(alpha: 0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.sl,
              borderSide:  BorderSide(color: AppColor.stockTitleColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppRadius.sl,
              borderSide: BorderSide(color: AppColor.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppRadius.sl,
              borderSide:  BorderSide(color: AppColor.error, width: 1),
            ),
            errorStyle:  TextStyle(
             // fontFamily: AppFonts.urbanistMed,
              fontSize: AppFontSize.xs,
              color: AppColor.error,
            ),
          ),
        ),
      ],
    );
  }
}