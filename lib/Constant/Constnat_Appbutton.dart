import 'package:flutter/material.dart';

import 'Constant_Color.dart';

enum CustomButtonType {
  filled,
  outlined,
  text,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  // Button type
  final CustomButtonType type;

  // Size
  final double? width;
  final double height;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
  final double borderWidth;
  final double elevation;
  final double loaderSize;
  final double loaderStrokeWidth;
  final double iconSpacing;

  // Colors
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? loaderColor;
  final Color? disabledBackgroundColor;

  // Icon
  final IconData? icon;
  final bool iconOnLeft;

  // Font
  final FontWeight fontWeight;
  final String? fontFamily;

  // Shape and padding
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry padding;
  final bool fullWidth;

  // Loading
  final bool isLoading;
  final Widget? loadingWidget;
  final String? loadingText;
  final bool disableWhileLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CustomButtonType.filled,
    this.width,
    this.height = 48,
    this.fontSize = 16,
    this.iconSize = 20,
    this.borderRadius = 12,
    this.borderWidth = 1,
    this.elevation = 0,
    this.loaderSize = 20,
    this.loaderStrokeWidth = 2,
    this.iconSpacing = 8,
    this.backgroundColor = AppColor.stockTitleColor,
    this.textColor = AppColor.white,
    this.borderColor,
    this.iconColor,
    this.loaderColor,
    this.disabledBackgroundColor,
    this.icon,
    this.iconOnLeft = true,
    this.fontWeight = FontWeight.w600,
    this.fontFamily,
    this.shape,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    this.fullWidth = true,
    this.isLoading = false,
    this.loadingWidget,
    this.loadingText,
    this.disableWhileLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveShape = shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );

    final Color effectiveBorderColor =
        borderColor ?? backgroundColor;

    final Color effectiveLoaderColor =
        loaderColor ??
            (type == CustomButtonType.filled
                ? textColor
                : backgroundColor);

    final Color effectiveTextColor =
    type == CustomButtonType.filled
        ? textColor
        : (onPressed == null
        ? textColor.withValues(alpha: 0.5)
        : textColor);

    Widget content;

    if (isLoading) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loadingWidget ??
              SizedBox(
                width: loaderSize,
                height: loaderSize,
                child: CircularProgressIndicator(
                  strokeWidth: loaderStrokeWidth,
                  color: effectiveLoaderColor,
                ),
              ),
          if (loadingText != null) ...[
            SizedBox(width: iconSpacing),
            Flexible(
              child: Text(
                loadingText!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                  color: effectiveTextColor,
                ),
              ),
            ),
          ],
        ],
      );
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && iconOnLeft) ...[
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? effectiveTextColor,
            ),
            SizedBox(width: iconSpacing),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                color: effectiveTextColor,
              ),
            ),
          ),
          if (icon != null && !iconOnLeft) ...[
            SizedBox(width: iconSpacing),
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? effectiveTextColor,
            ),
          ],
        ],
      );
    }

    final ButtonStyle buttonStyle = ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        Size(0, height),
      ),
      maximumSize: WidgetStateProperty.all(
        Size(double.infinity, height),
      ),
      padding: WidgetStateProperty.all(padding),
      shape: WidgetStateProperty.all(effectiveShape),
      elevation: WidgetStateProperty.all(
        type == CustomButtonType.filled ? elevation : 0,
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
          if (type != CustomButtonType.filled) {
            return Colors.transparent;
          }

          if (states.contains(WidgetState.disabled)) {
            return disabledBackgroundColor ??
                backgroundColor.withValues(alpha: 0.5);
          }

          return backgroundColor;
        },
      ),
      foregroundColor: WidgetStateProperty.all(
        effectiveTextColor,
      ),
      side: WidgetStateProperty.all(
        type == CustomButtonType.outlined
            ? BorderSide(
          color: effectiveBorderColor,
          width: borderWidth,
        )
            : BorderSide.none,
      ),
      overlayColor: WidgetStateProperty.all(
        effectiveTextColor.withValues(alpha: 0.08),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    final Widget button;

    switch (type) {
      case CustomButtonType.filled:
        button = ElevatedButton(
          onPressed: (isLoading && disableWhileLoading)
              ? null
              : onPressed,
          style: buttonStyle,
          child: content,
        );
        break;

      case CustomButtonType.outlined:
        button = OutlinedButton(
          onPressed: (isLoading && disableWhileLoading)
              ? null
              : onPressed,
          style: buttonStyle,
          child: content,
        );
        break;

      case CustomButtonType.text:
        button = TextButton(
          onPressed: (isLoading && disableWhileLoading)
              ? null
              : onPressed,
          style: buttonStyle,
          child: content,
        );
        break;
    }

    return SizedBox(
      width: fullWidth ? (width ?? double.infinity) : width,
      height: height,
      child: button,
    );
  }
}