import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';

import 'Sizes.dart';

class CustomLabourCard extends StatelessWidget {
  final String name;
  final int dailyRate;
  final int presentDays;
  final int halfDays;
  final int amount;
  final int advance;
  final bool isNoAdvance;
  final IconData icon;
  final VoidCallback? onTap;

  CustomLabourCard({
    super.key,
    required this.name,
    required this.dailyRate,
    required this.presentDays,
    required this.halfDays,
    required this.amount,
    required this.advance,
    this.isNoAdvance = false,
    this.icon = Icons.person,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 4,
        bottom: 4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFFCFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFF4EAE5),
          width: 0.8,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: Sizes.screenHeight * 0.049,
            width: Sizes.screenWidth * 0.107,
            decoration: BoxDecoration(
              color: Color(0xFFFFEAE1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Color(0xFFAC160F),
              size: 20,
            ),
          ),

          SizedBox(width: 8),

          // Labour Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525),
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  "₹ $dailyRate / day",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Color(0xFF626262),
                  ),
                ),

                Text(
                  "$presentDays Present • $halfDays Half Day",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Color(0xFF626262),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹ ${amount.toStringAsFixed(0).replaceAllMapped(
                  RegExp(r'\B(?=(\d{3})+(?!\d))'),
                      (match) => ',',
                )}",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB51212),
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Payable",
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  color: Color(0xFF777777),
                ),
              ),

              SizedBox(height: 5),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: isNoAdvance
                      ? Color(0xFFEAF7EE)
                      : Color(0xFFFFEED6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  isNoAdvance
                      ? "No Advance"
                      : "₹ ${advance.toStringAsFixed(0).replaceAllMapped(
                    RegExp(r'\B(?=(\d{3})+(?!\d))'),
                        (match) => ',',
                  )} Advance",
                  style: GoogleFonts.poppins(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w500,
                    color: isNoAdvance
                        ? Color(0xFF25864A)
                        : Color(0xFF8E4318),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 4),
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.chevron_right,
              size: 22,
              color: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }
}
