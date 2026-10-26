import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Sizes.dart';

class DashboardCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? unit;
  final String subtitle;
  final IconData? icon;
  final String? leftImage;
  final Widget? leftWidget;
  final Color color;
  final Color? titleColor;
  final Color? valueColor;
  final Color? unitColor;
  final Color? subtitleColor;
  final Color background;
  final Widget? rightWidget;
  final String? rightImage;
  final VoidCallback? onTap;

  const DashboardCardWidget({
    super.key,
    required this.title,
    required this.value,
    this.unit,
    required this.subtitle,
    this.icon,
    this.leftImage,
    this.leftWidget,
    required this.color,
    required this.background,
    this.rightWidget,
    this.rightImage,
    this.onTap,

    // Individual text colors
    this.titleColor,
    this.valueColor,
    this.unitColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              spreadRadius: 1,
              offset:  Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (leftWidget != null)
                  leftWidget!
                else if (leftImage != null)
                  Image.asset(
                    leftImage!,
                    height: Sizes.screenWidth * 0.065,
                    width: Sizes.screenWidth * 0.065,
                    fit: BoxFit.contain,
                  )
                else if (icon != null)
                  Icon(icon, size: 22, color: color),

                const SizedBox(width: 6),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w600,
                          color: titleColor ?? Colors.black87,
                        ),
                      ),

                       SizedBox(height: 1),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: valueColor ?? color,
                          ),
                        ),
                      ),
                      if (unit != null)
                        Text(
                          unit!,
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            color: unitColor ?? Colors.black54,
                            height: 1.0,
                          ),
                        ),
                    ],
                  ),
                ),

                if (rightWidget != null)
                  rightWidget!
                else if (rightImage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Image.asset(
                      rightImage!,
                      height: Sizes.screenWidth * 0.14,
                      width: Sizes.screenWidth * 0.14,
                      fit: BoxFit.contain,
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: subtitleColor ?? color,
                    ),
                  ),
                ),

                Icon(Icons.chevron_right, size: 22, color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
