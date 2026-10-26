import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constant/Constantpaymentcard.dart';
import 'Constant/Sizes.dart';

class Viewproductdetails extends StatefulWidget {
  Viewproductdetails({super.key});

  @override
  State<Viewproductdetails> createState() => _ViewproductdetailsState();
}

class _ViewproductdetailsState extends State<Viewproductdetails> {
  String selectedStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfef6f3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35),
            Container(
              height: Sizes.screenWidth * 0.12,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF702B1C),
                      size: 27,
                    ),
                  ),

                  SizedBox(width: 40),
                  Container(
                    height: Sizes.screenWidth * 0.094,
                    width: Sizes.screenWidth * 0.094,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFB58B76)),
                    ),
                    child: ClipOval(
                      child: Image.asset('assets/logo.jpg', fit: BoxFit.cover),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'MAHINDRA BRICKS',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF702B1C),
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'P A V E R   B L O C K S',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            color: Color(0xFF702B1C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: Color(0xFFfef6f3),
              child: Row(
                children: [
                  // Left side
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Order Details',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF702B1C),
                            ),
                          ),
                          Text(
                            'Order information and status',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFDF9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ORD-2026-0010',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF263238),
                          ),
                        ),
                        Text(
                          '16 Oct 2026, 10:30 AM',
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 4),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 12,
                                color: Color(0xFFF59E0B),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Pending',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFF59E0B),
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 15,
                                color: Color(0xFF702B1C),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCF9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF5EDE7)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Icon
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      width: Sizes.screenWidth * 0.105,
                      decoration: BoxDecoration(
                        color: Color(0XFFfbf8f3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Color(0xFF8B251D),
                      ),
                    ),

                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Client Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF702B1C),
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'ROYAL BROTHERS GROUP OF COMPANY',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF17212B),
                            ),
                          ),

                          SizedBox(height: 5),

                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 18,
                                color: Color(0xFF737B83),
                              ),
                              SizedBox(width: 12),
                              Text(
                                '9685538768',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Color(0xFF17212B),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 4),

                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 19,
                                color: Color(0xFF737B83),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'kolgarh',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Color(0xFF17212B),
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBF7), // Light cream
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF5EDE6), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.047,
                          width: Sizes.screenWidth * 0.095,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCEAE5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.local_shipping,
                            color: Color(0xFF702B1C),
                            size: 23,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          'Delivery Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF702B1C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vehicle Number',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF737B83),
                                  ),
                                ),
                                Text(
                                  'MP532G8604',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF17212B),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Delivery Date',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF737B83),
                                  ),
                                ),
                                Text(
                                  '16 Oct 2026',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF17212B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 1,
                          color: Color(0xFFE8DED5),
                        ),

                        SizedBox(width: 20),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF737B83),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery Location',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Color(0xFF737B83),
                                      ),
                                    ),
                                    Text(
                                      'kolgarh',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF17212B),
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
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBF7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF5EDE6), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.043,
                          width: Sizes.screenWidth * 0.095,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCEAE5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.receipt_long,
                            color: Color(0xFF702B1C),
                            size: 23,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Invoice Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF702B1C),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),

                    // Details
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Invoice Number
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 48),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Invoice No.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF737B83),
                                  ),
                                ),
                                Text(
                                  '10',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF17212B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Divider
                        Container(
                          height: 32,
                          width: 1,
                          color: Color(0xFFE8DED5),
                        ),

                        SizedBox(width: 16),

                        // Order Date
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 19,
                                color: Color(0xFF737B83),
                              ),
                              SizedBox(width: 7),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order Date',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Color(0xFF737B83),
                                      ),
                                    ),
                                    Text(
                                      '16 Oct 2026',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF17212B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10),

                        // Order Type
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.point_of_sale,
                                size: 19,
                                color: Color(0xFF737B83),
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order Type',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Color(0xFF737B83),
                                      ),
                                    ),
                                    Text(
                                      'Sales Order',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF17212B),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBF7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF5EDE6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.047,
                          width: Sizes.screenWidth * 0.095,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCEAE5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.view_in_ar,
                            color: Color(0xFF702B1C),
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Product Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF702B1C),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    // Table
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                          color: Color(0xFFF0E6DF),
                          width: 0.7,
                        ),
                        columnWidths: {
                          0: FixedColumnWidth(30),
                          1: FixedColumnWidth(155),
                          2: FixedColumnWidth(75),
                          3: FixedColumnWidth(55),
                          4: FixedColumnWidth(60),
                          5: FixedColumnWidth(65),
                          6: FixedColumnWidth(75),
                        },
                        children: [
                          // Table heading
                          TableRow(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEFEB),
                            ),
                            children:
                                [
                                  '#',
                                  'Product',
                                  'Size',
                                  'Colour',
                                  'Quantity',
                                  'Rate (₹)',
                                  'Amount (₹)',
                                ].map((heading) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      heading,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF702B1C),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),

                          // Product row
                          TableRow(
                            children: [
                              // Number
                              _productCell('1'),

                              // Image and name
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: Sizes.screenHeight * 0.042,
                                      width: Sizes.screenWidth * 0.17,
                                      child: Image.asset(
                                        'assets/bricks.jpg',
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stack) {
                                          return Icon(
                                            Icons.image_outlined,
                                            size: 30,
                                            color: Color(0xFFB58B76),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Red Bricks\n(Standard)',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF17212B),
                                            ),
                                          ),
                                          Text(
                                            'Code: RB-001',
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              _productCell('230 × 110 ×\n70 mm'),
                              _productCell('Red'),
                              _productCell('3,000\npcs'),
                              _productCell('5.00'),
                              _productCell('15,000.00'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            CustomAmountPaymentCard(
              icon: Icons.calculate,
              title: 'Amount Details',
              details: [
                {'label': 'Sub Total', 'value': '₹ 15,000.00'},
                {'label': 'Transport Charge', 'value': '₹ 4,100.00'},
                {'label': 'Labour Charge', 'value': '₹ 900.00'},
                {
                  'label': 'Total Amount',
                  'value': '₹ 20,000.00',
                  'highlight': 'true',
                },
              ],
              showFooter: true,
              footerTitle: 'Amount In Words',
              footerValue: 'Twenty Thousand Rupees only',
            ),
            CustomAmountPaymentCard(
              icon: Icons.account_balance_wallet,
              title: 'Payment Details',
              details: [
                {'label': 'Total Amount', 'value': '₹ 20,000.00'},
                {'label': 'Advance Amount', 'value': '₹ 0.00'},
                {'label': 'Amount Paid', 'value': '₹ 0.00'},
                {
                  'label': 'Remaining Balance',
                  'value': '₹ 20,000.00',
                  'highlight': 'true',
                },
                {'label': 'Payment Mode', 'value': 'Credit'},
              ],
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFFFFBF7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFF5EDE6)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: Sizes.screenHeight * 0.044,
                        width: Sizes.screenWidth * 0.09,
                        decoration: BoxDecoration(
                          color: Color(0xFFFCEAE5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: Color(0xFF702B1C),
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 9),

                      Expanded(
                        child: Text(
                          'Update Order Status',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF702B1C),
                          ),
                        ),
                      ),

                      Container(
                        height: Sizes.screenHeight * 0.047,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE8BD72)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedStatus,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF702B1C),
                              size: 20,
                            ),
                            items:
                                [
                                  'Pending',
                                  'Processing',
                                  'Completed',
                                  'Cancelled',
                                ].map((status) {
                                  return DropdownMenuItem(
                                    value: status,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Color(0xFFE99A20),
                                          size: 17,
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          status,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFFE99A20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: Sizes.screenHeight * 0.045,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8D2B17),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        'Update Status',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCell(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10,
            color: Color(0xFF17212B),
          ),
        ),
      ),
    );
  }
}
