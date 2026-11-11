import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
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
  final VoidCallback? onArrowTap;

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
    this.onArrowTap,
  });

  Widget _buildImage() {
    if (image.startsWith('http://') || image.startsWith('https://')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/bricks.jpg',
              fit: BoxFit.contain,
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColor.stockAmountColor,
                ),
              ),
            );
          },
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        image.isNotEmpty ? image : 'assets/bricks.jpg',
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/bricks.jpg',
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: Sizes.screenHeight * 0.094,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: Sizes.screenWidth * 0.027,
          vertical: Sizes.screenHeight * 0.005,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: Sizes.screenHeight * 0.079,
              width: Sizes.screenWidth * 0.203,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColor.imgbg,
                borderRadius: BorderRadius.circular(9),
              ),
              child: _buildImage(),
            ),

            SizedBox(width: Sizes.screenWidth * 0.027),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),

                  SizedBox(height: Sizes.screenHeight * 0.004),

                  Text(
                    'Size: $size',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: AppColor.gey,
                    ),
                  ),
                  SizedBox(height: Sizes.screenHeight * 0.0025),

                  Text(
                    'Code: $code',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: AppColor.gey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: Sizes.screenWidth * 0.016),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  price,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: Sizes.screenHeight * 0.0012),
                Text(
                  'Pieces',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColor.gey,
                  ),
                ),

                SizedBox(height: Sizes.screenHeight * 0.0025),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.024,
                    vertical: Sizes.screenHeight * 0.004,
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

            SizedBox(width: Sizes.screenWidth * 0.013),
            GestureDetector(
              onTap: onArrowTap ?? onTap,
              child: const Icon(
                Icons.chevron_right,
                size: 22,
                color: AppColor.gey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
