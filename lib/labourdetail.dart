import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constant/Constantheader.dart';

class Labourdetail extends StatefulWidget {
  Labourdetail({super.key});

  @override
  State<Labourdetail> createState() => _LabourdetailState();
}

class _LabourdetailState extends State<Labourdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          CustomHeader(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Labour Details",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF991B12),
                        ),
                      ),
                      Text(
                        "View labour information and summary",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF777777),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFF0E5E0)),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF3F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE3DA),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Color(0xFF9E2418),
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          'Labour Information',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF9E2418),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF9E2418),
                          side: BorderSide(
                            color: Color(0xFFDDA99D),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.edit, size: 15),
                            SizedBox(width: 6),
                            Text('Edit', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Labour ID',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        'LAB-001',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Labour Name',
                          style: TextStyle(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        'Rajesh Kumar',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Text(
                          '9876543210',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF08783B),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.call, size: 15),
                            SizedBox(width: 7),
                            Text('Call', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 7,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Daily Rate (₹)',
                          style: TextStyle(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '600',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF1E7E2)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF2EF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Color(0xFF922216),
                              size: 22,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Attendance Summary',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF922216),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE3D9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'This Month',
                                style: GoogleFonts.poppins(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFF0FAF3),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color(0xFFD5F4DE),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF08783B),
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '18',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF12652C),
                                          ),
                                        ),
                                        Text(
                                          'Present Days',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF8EB),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color(0xFFFFEAC5),
                                    child: Icon(
                                      Icons.timelapse,
                                      color: Color(0xFFB75B00),
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '3',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF853A00),
                                          ),
                                        ),
                                        Text(
                                          'Half Days',
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF0F0),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color(0xFFFFDADA),
                                    child: Icon(
                                      Icons.close,
                                      color: Color(0xFFBD1717),
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '2',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFBD1717),
                                          ),
                                        ),
                                        Text(
                                          'Absent Days',
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF1E7E2)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF0ED),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Color(0xFF922216),
                              size: 22,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Overtime Summary',
                              style: TextStyle(
                                color: Color(0xFF922216),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFEEF7FD),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Color(0xFFD4EDFF),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Color(0xFF07599C),
                                      size: 17,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '12',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF172B4D),
                                          ),
                                        ),
                                        Text(
                                          'Total Overtime Hours',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF6EFFF),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Color(0xFFEBD9FF),
                                    child: Icon(
                                      Icons.currency_rupee,
                                      color: Color(0xFF7916A5),
                                      size: 17,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '3,600',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF32134D),
                                          ),
                                        ),
                                        Text(
                                          'Approved Overtime Amount',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF1E7E2)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF0ED),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: Color(0xFF922216),
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Payout Summary',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF922216),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFF0FAF3),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color(0xFFD5F4DE),
                                    child: Icon(
                                      Icons.currency_rupee,
                                      color: Color(0xFF08783B),
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '18,600',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF12652C),
                                          ),
                                        ),
                                        Text(
                                          'Total Earned',
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFEEF7FD),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color(0xFFD4EDFF),
                                    child: Icon(
                                      Icons.currency_rupee,
                                      color: Color(0xFF07599C),
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '12,000',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF172B4D),
                                          ),
                                        ),
                                        Text(
                                          'Total Paid',
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF0F0),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color(0xFFFFDADA),
                                    child: Icon(
                                      Icons.currency_rupee,
                                      color: Color(0xFFBD1717),
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '6,600',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFBD1717),
                                          ),
                                        ),
                                        Text(
                                          'Remaining Amount',
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            color: Color(0xFF526577),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF9B2618),
                          side: BorderSide(
                            color: Color(0xFFB9362C),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call, size: 20),
                            SizedBox(width: 12),
                            Text(
                              'Call Labour',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF9B2618),
                          side: BorderSide(
                            color: Color(0xFFB9362C),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit, size: 20),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Edit Labour Details',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF982714),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month, size: 21),
                            SizedBox(width: 12),
                            Text(
                              'Mark Attendance',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF982714),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.account_balance_wallet, size: 21),
                            SizedBox(width: 10),
                            Text(
                              'Add Payout',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
