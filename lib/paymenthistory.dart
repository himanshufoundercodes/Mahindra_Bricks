import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class Paymenthistory extends StatefulWidget {
  const Paymenthistory({super.key});

  @override
  State<Paymenthistory> createState() => _PaymenthistoryState();
}

class _PaymenthistoryState extends State<Paymenthistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 25),
          Container(
            height: Sizes.screenHeight * 0.060,
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF782A17),
                size: 24,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                color: Color(0xFFF0E8E3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment History',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF782A17),
                      ),
                    ),
                    Text(
                      'View All',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF782A17),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Date',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF687386),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Amount',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF687386),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Mode',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF687386),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Notes',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF687386),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Added By',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF687386),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFEAEAEA),
                        width: 0.6,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          '15 Oct 2026',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '₹ 800',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Cash',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '-',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Admin',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFEAEAEA),
                        width: 0.6,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          '10 Oct 2026',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '₹ 600',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'UPI',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Advance',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Admin',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          '01 Oct 2026',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '₹ 1,200',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Cash',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Salary',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Admin',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF45505E),
                          ),
                        ),
                      ),
                    ],
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
