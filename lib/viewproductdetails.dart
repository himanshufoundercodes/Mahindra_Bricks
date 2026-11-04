import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantpaymentcard.dart';
import 'Constant/Constnat_Appbutton.dart';
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
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.021,
                vertical: Sizes.screenHeight * 0.012),
              color: AppColor.lightredbg,
              child: Row(
                children: [
                  _buildHeader(),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ORD-2026-0010',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          ),
                        ),
                        Text(
                          '16 Oct 2026, 10:30 AM',
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: AppColor.gey,
                          ),
                        ),
                        SizedBox(height: Sizes.screenHeight * 0.005,),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.screenWidth * 0.021,
                                vertical: Sizes.screenHeight * 0.012),
                          decoration: BoxDecoration(
                            color: AppColor.lightyellow,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 12,
                                color: AppColor.yellow,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.011,),
                              Text(
                                'Pending',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.yellow,
                                ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.013,),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 15,
                                color: AppColor.black,
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
            SizedBox(height: Sizes.screenHeight * 0.01,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.021,),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      width: Sizes.screenWidth * 0.105,
                      decoration: BoxDecoration(
                        color:AppColor.lightredbg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: AppColor.stockUnitColor,
                      ),
                    ),

                    SizedBox(width: Sizes.screenWidth * 0.037),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Client Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),

                          SizedBox(height: Sizes.screenHeight * 0.006),

                          Text(
                            'ROYAL BROTHERS GROUP OF COMPANY',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.gey,
                            ),
                          ),

                          SizedBox(height: Sizes.screenHeight * 0.006),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 18,
                                color: AppColor.gey,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.032,),
                              Text(
                                '9685538768',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.005,),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 19,
                                color: AppColor.gey,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.032,),
                              Text(
                                'kolgarh',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: AppColor.black,
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
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027,
                vertical: Sizes.screenHeight * 0.010,),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey, width: Sizes.screenWidth * 0.003,),
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
                            color: AppColor.lightredbg,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.local_shipping,
                            color: AppColor.stockUnitColor,
                            size: 23,
                          ),
                        ),

                        SizedBox(width: Sizes.screenWidth * 0.027,),

                        Text(
                          'Delivery Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockUnitColor,
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
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  'MP532G8604',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                                SizedBox(height: Sizes.screenHeight * 0.0025,),
                                Text(
                                  'Delivery Date',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  '16 Oct 2026',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Sizes.screenHeight * 0.089,
                          width: Sizes.screenWidth * 0.003,
                          color: AppColor.grey,
                        ),

                        SizedBox(width: Sizes.screenWidth * 0.053,),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.gey,
                                size: 20,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.021,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery Location',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.gey,
                                      ),
                                    ),
                                    Text(
                                      'kolgarh',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.black,
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
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027,),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey, width: Sizes.screenWidth * 0.003,),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.043,
                          width: Sizes.screenWidth * 0.095,
                          decoration: BoxDecoration(
                            color: AppColor.bgback,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.receipt_long,
                            color: AppColor.stockTitleColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027,),
                        Text(
                          'Invoice Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.004,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 48),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Invoice No.',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: AppColor.gey,
                                ),
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027,),
                        Container(
                          height: Sizes.screenHeight * 0.039,
                          width: Sizes.screenWidth * 0.003,
                          color: AppColor.grey,
                        ),

                        SizedBox(width: Sizes.screenWidth * 0.030),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 19,
                              color: AppColor.gey,
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.022),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Date',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  '16 Oct 2026',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.013),
                        Container(
                          height: Sizes.screenHeight * 0.039,
                          width: Sizes.screenWidth * 0.003,
                          color: AppColor.grey,
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.020),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.point_of_sale,
                              size: 19,
                              color: AppColor.gey,
                            ),
                            SizedBox(width: 6),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Type',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  'Sales Order',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey),
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
                            color: AppColor.bgback,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.view_in_ar,
                            color: AppColor.stockTitleColor,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027),
                        Text(
                          'Product Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Sizes.screenHeight * 0.012,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                          color: AppColor.grey,
                            width: Sizes.screenWidth * 0.0019,
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
                          TableRow(
                            decoration: BoxDecoration(
                              color: AppColor.bgbacklight,
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
                                      horizontal: Sizes.screenWidth * 0.011,
                                      vertical: Sizes.screenHeight * 0.010,
                                    ),
                                    child: Text(
                                      heading,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.stockTitleColor,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                          TableRow(
                            children: [
                              _productCell('1'),
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
                                            color: AppColor.red,
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: Sizes.screenWidth * 0.013),
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
                                              color: AppColor.black,
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
            SizedBox(height: Sizes.screenHeight * 0.01),
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
              margin: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027,
                vertical: Sizes.screenHeight * 0.006,),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white38,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.grey),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: Sizes.screenHeight * 0.044,
                        width: Sizes.screenWidth * 0.09,
                        decoration: BoxDecoration(
                          color: AppColor.bgback,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: AppColor.stockTitleColor,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: Sizes.screenWidth * 0.024,),

                      Expanded(
                        child: Text(
                          'Update Order Status',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                      ),

                      Container(
                        height: Sizes.screenHeight * 0.047,
                        padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.021),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedStatus,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.black,
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
                                          color: AppColor.yellow,
                                          size: 17,
                                        ),
                                        SizedBox(width: Sizes.screenWidth * 0.019),
                                        Text(
                                          status,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: AppColor.yellow,
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
                  SizedBox(height: Sizes.screenHeight * 0.012),
                  CustomButton(
                    text: 'Update Status',
                    height: Sizes.screenHeight * 0.049,
                    fontWeight: .w500,
                    onPressed: () {
                  },),
                  SizedBox(height: Sizes.screenHeight * 0.025),
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
      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.008,
        vertical: Sizes.screenHeight * 0.012,),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10,
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.screenHeight * 0.010,
          vertical: Sizes.screenHeight * 0.010
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.010),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Order Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Order information and status',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gey,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
