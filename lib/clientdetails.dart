import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/customesamrycard.dart';

import 'Constant/ConstantOrderhistory.dart';

class Clientdetails extends StatefulWidget {
  Clientdetails({super.key});

  @override
  State<Clientdetails> createState() => _ClientdetailsState();
}

class _ClientdetailsState extends State<Clientdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF3EF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Sizes.screenHeight * 0.083,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 27,
                          color: Color(0xFF81241B),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Sizes.screenWidth * 0.12,
                          width: Sizes.screenWidth * 0.12,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFB88C7B),
                              width: 1.5,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logo.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 7),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MAHINDRA BRICKS',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF81241B),
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'P A V E R   B L O C K S',
                              style: GoogleFonts.poppins(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF81241B),
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Client Details',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF81241B),
                      ),
                    ),
                    Text(
                      'View customer information and orders',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Color(0xFF687078),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFF1E5DF),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFFDEEEB),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.location_city,
                          size: 22,
                          color: Color(0xFF81241B),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ROYAL BROTHERS GROUP OF COMPANY',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0F1E36),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE0F5E5),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Active Client',
                                    style: GoogleFonts.poppins(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF26753B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Client ID: C-001',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Color(0xFF757575),
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 12,
                                  color: Color(0xFF55606E),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '9685538768',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF0F1E36),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.call,
                                  size: 12,
                                  color: Color(0xFF55606E),
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    '9300123456 (Alternate)',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0F1E36),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: Sizes.screenHeight * 0.075,
                        width: Sizes.screenWidth * 0.075,
                        decoration: BoxDecoration(
                          color: Color(0xFF81241B),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              HorizontalSummaryCards(),
              SizedBox(height: 5),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.049,
                            width: Sizes.screenWidth * 0.10,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9E6DF),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Icon(
                              Icons.bar_chart,
                              size: 27,
                              color: Color(0xFF8B2418),
                            ),
                          ),

                          SizedBox(width: 12),

                          Text(
                            'Business Summary',
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B2418),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4),

                      Divider(
                        height: 1,
                        color: Color(0xFFE9E1DC),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Orders',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            Text(
                              '12',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF172A40),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(height: 1, color: Color(0xFFE9E1DC)),

                      // Total Purchase Quantity
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Purchase Quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            Text(
                              '36,000 pcs',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF172A40),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(height: 1, color: Color(0xFFE9E1DC)),

                      // Total Order Amount
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Order Amount',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            Text(
                              '₹ 1,80,000',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF172A40),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(height: 1, color: Color(0xFFE9E1DC)),

                      // Total Paid Amount
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Paid Amount',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            Text(
                              '₹ 1,60,000',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF172A40),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2),

                      // Pending Balance
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pending Balance',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFAA201B),
                              ),
                            ),
                            Text(
                              '₹ 20,000',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE53935),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: OrderHistoryTable(
                  orders: [
                    OrderHistoryItem(
                      orderNo: 'ORD-2026-0010',
                      date: '16 Oct 2026',
                      product: 'Bricks',
                      quantity: '3,000 pcs',
                      totalAmount: '₹ 20,000',
                      paidAmount: '₹ 0',
                      pendingAmount: '₹ 20,000',
                      status: 'Pending',
                    ),
                    OrderHistoryItem(
                      orderNo: 'ORD-2026-0009',
                      date: '10 Oct 2026',
                      product: 'Bricks',
                      quantity: '2,000 pcs',
                      totalAmount: '₹ 12,500',
                      paidAmount: '₹ 12,500',
                      pendingAmount: '₹ 0',
                      status: 'Dispatched',
                    ),
                    OrderHistoryItem(
                      orderNo: 'ORD-2026-0008',
                      date: '28 Sep 2026',
                      product: 'Paver Block',
                      quantity: '5,000 pcs',
                      totalAmount: '₹ 30,000',
                      paidAmount: '₹ 30,000',
                      pendingAmount: '₹ 0',
                      status: 'Completed',
                    ),
                    OrderHistoryItem(
                      orderNo: 'ORD-2026-0007',
                      date: '15 Sep 2026',
                      product: 'Bricks',
                      quantity: '4,000 pcs',
                      totalAmount: '₹ 24,000',
                      paidAmount: '₹ 14,000',
                      pendingAmount: '₹ 10,000',
                      status: 'Pending',
                    ),
                    OrderHistoryItem(
                      orderNo: 'ORD-2026-0006',
                      date: '02 Sep 2026',
                      product: 'Bricks',
                      quantity: '2,500 pcs',
                      totalAmount: '₹ 15,000',
                      paidAmount: '₹ 15,000',
                      pendingAmount: '₹ 0',
                      status: 'Completed',
                    ),
                  ],
                  onOrderTap: (order) {
                    debugPrint('Selected Order: ${order.orderNo}');
                  },
                ),
              ),

              SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }
}
