
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Sizes.dart';

class StockCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color valueColor;
  final Color? titleColor;
  final Color? subtitleColor;

  StockCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle = 'Pieces',
    required this.icon,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.valueColor,
    this.titleColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: Sizes.screenHeight * 0.09,
            width: Sizes.screenWidth * 0.09,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 22,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10.5,
                    fontWeight: .w500,
                    color: titleColor ?? const Color(0xFF555555),
                  ),
                ),

                const SizedBox(height: 1),

                // Amount
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),

                // Subtitle
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: subtitleColor ?? const Color(0xFF666666),
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
