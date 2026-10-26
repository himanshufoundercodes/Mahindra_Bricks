
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAmountPaymentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Map<String, String>> details;
  final String? footerTitle;
  final String? footerValue;
  final bool showFooter;
  final Color? iconColor;
  final Color? highlightColor;

  const CustomAmountPaymentCard({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
    this.footerTitle,
    this.footerValue,
    this.showFooter = false,
    this.iconColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF702B1C);
    const cream = Color(0xFFFFFBF7);
    const grey = Color(0xFF737B83);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cream,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFF5EDE6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCEAE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 23,
                    color: iconColor ?? brown,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: brown,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // Rows
            ...details.map((item) {
              final isHighlight = item['highlight'] == 'true';

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: isHighlight
                      ? (highlightColor ?? const Color(0xFFFCEAE8))
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item['label'] ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: isHighlight
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: isHighlight ? brown : grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item['value'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: isHighlight
                            ? FontWeight.bold
                            : FontWeight.w600,
                        color: isHighlight ? brown : const Color(0xFF17212B),
                      ),
                    ),
                  ],
                ),
              );
            }),

            // Optional footer
            if (showFooter) ...[
              const SizedBox(height: 6),
              Text(
                footerTitle ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: grey,
                ),
              ),
              const SizedBox(height: 3),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: highlightColor ?? const Color(0xFFFCEAE8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  footerValue ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: brown,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
