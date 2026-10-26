
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.screenHeight * 0.05,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Sizes.screenHeight * 0.093,
                width: Sizes.screenWidth * 0.093,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFB88A7B),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.contain,
                    width: Sizes.screenWidth,
                    height: Sizes.screenHeight,
                  ),
                ),
              ),

              const SizedBox(width: 7),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MAHINDRA BRICKS',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF941B16),
                      letterSpacing: 0.2,
                    ),
                  ),
                  Text(
                    'P A V E R   B L O C K S',
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color:  Color(0xFF941B16),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            left: 10,
            child: IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon:  Icon(
                Icons.arrow_back,
                color: Color(0xFF941B16),
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
