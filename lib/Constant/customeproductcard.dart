
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class CustomProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String size;
  final String code;
  final String price;
  final String stockStatus;

  final Color backgroundColor;
  final Color stockColor;

  final VoidCallback? onTap;

  const CustomProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.size,
    required this.code,
    required this.price,
    required this.stockStatus,
    this.backgroundColor = const Color(0xFFFFFCFA),
    this.stockColor = const Color(0xFF2E9B59),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: Sizes.screenHeight * 0.094,
        width: double.infinity,
        margin:  EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        padding:  EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.05),
              blurRadius: 6,
              offset:  Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 64,
              width: 76,
              padding:  EdgeInsets.all(4),
              decoration: BoxDecoration(
                color:  Color(0xFFF8EFEB),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),

             SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF292321),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    'Size: $size',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  GoogleFonts.poppins(
                      fontSize: 11,
                      color: Color(0xFF77716D),
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    'Code: $code',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  GoogleFonts.poppins(
                      fontSize: 11,
                      color: Color(0xFF77716D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 6),

            // PRICE AND STOCK
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  price,
                  maxLines: 1,
                  style:  GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF171413),
                  ),
                ),SizedBox(height: 1),
                 Text(
                  'Pieces',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Color(0xFF77716D),
                  ),
                ),

                 SizedBox(height: 2),

                Container(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: stockColor.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    stockStatus,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      fontSize: 7,
                      fontWeight: FontWeight.w600,
                      color: stockColor,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 5),

            // RIGHT ARROW
            Icon(
              Icons.chevron_right,
              size: 22,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
