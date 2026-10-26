import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color background;
  final VoidCallback? onTap;

  const QuickActionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.background,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              height: 43,
              width: 45,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 25,
                color: color,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontSize: 8.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
