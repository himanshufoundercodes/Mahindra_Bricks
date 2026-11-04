
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAttendanceCard extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color valueColor;
  final Color textColor;

  final String value;
  final String text;

  final double? width;
  final double height;
  final double iconRadius;
  final double valueFontSize;
  final double textFontSize;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomAttendanceCard({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.valueColor,
    required this.textColor,
    required this.value,
    required this.text,
    this.width,
    this.height = 65,
    this.iconRadius = 13,
    this.valueFontSize = 15,
    this.textFontSize = 10,
    this.borderRadius = 9,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 8,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: iconRadius,
            backgroundColor: iconBackgroundColor,
            child: Icon(
              icon,
              color: iconColor,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),
                Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: textFontSize,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
