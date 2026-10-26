import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomReportCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final List<Map<String, String>> details;
  final VoidCallback? onTap;

  const CustomReportCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.details,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: backgroundColor),
        ),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFAD2018),
                        ),
                      ),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: const Color(0xFF788394),
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFB22222),
                  size: 25,
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Details
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.65),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: List.generate(details.length, (index) {
                  final item = details[index];

                  return Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                item["label"] ?? "",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  color: const Color(0xFF586475),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                item["value"] ?? "",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(
                                    int.parse(
                                      item["color"] ?? "FFAD2018",
                                      radix: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (index != details.length - 1)
                          Container(
                            height: 29,
                            width: 1,
                            color: const Color(0xFFE7DFDC),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
