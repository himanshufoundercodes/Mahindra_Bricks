import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/customesamrycard.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

import 'Constant/ConstantOrderhistory.dart';
import 'model/clistlist_model.dart';

class Clientdetails extends StatefulWidget {
  final Data data;

  const Clientdetails({
    super.key,
    required this.data,
  });

  //Clientdetails({super.key});
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
                        height: Sizes.screenHeight * 0.05,
                        width: Sizes.screenWidth * 0.1,
                        decoration: BoxDecoration(
                          color: AppColor.lightredbg,
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
                                    widget.data.companyName.toString(),
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
                                    horizontal: Sizes.screenWidth * 0.015,
                                    vertical: Sizes.screenHeight * 0.00375,
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
                            SizedBox(height: Sizes.screenHeight * 0.0025),
                            Text(
                                widget.data.clientCode.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Color(0xFF757575),
                              ),
                            ),
                            SizedBox(height: Sizes.screenHeight * 0.005),
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 12,
                                  color: AppColor.gey,
                                ),
                                SizedBox(width: Sizes.screenWidth * 0.01),
                                Text(
                                    widget.data.mobile.toString(),
                                    style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black87,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.call,
                                  size: 12,
                                  color: AppColor.gey,
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    widget.data.alternateMobile.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Sizes.screenWidth * 0.02),
                      Container(
                        height: Sizes.screenHeight * 0.075,
                        width: Sizes.screenWidth * 0.075,
                        decoration: BoxDecoration(
                          color: AppColor.stockAmountColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            launchUrl(Uri.parse('tel:${widget.data.mobile}'));
                          },
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
              SizedBox(height: Sizes.screenHeight * 0.006),
              HorizontalSummaryCards(
                businessSummary: widget.data.businessSummary,
              ),
              SizedBox(height: Sizes.screenHeight * 0.006),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.025,
                ),
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
                                widget.data.totalOrders.toString(),
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
                                widget.data.totalPurchaseQty.toString(),
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
                                widget.data.totalOrderAmount.toString(),
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
                              widget.data.totalPaidAmount.toString(),
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
                                widget.data.pendingBalance.toString(),
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
                  orders: widget.data.orderHistory != null && widget.data.orderHistory!.isNotEmpty
                      ? widget.data.orderHistory!.map((order) {
                          final productName = (order.items != null && order.items!.isNotEmpty)
                              ? order.items!.first.productName?.toString() ?? 'Product'
                              : 'Product';
                          final quantity = (order.items != null && order.items!.isNotEmpty)
                              ? '${order.items!.first.quantity ?? ''} pcs'
                              : '';
                          return OrderHistoryItem(
                            orderNo: order.orderNumber?.toString() ?? '',
                            date: order.orderDate?.toString() ?? '',
                            product: productName,
                            quantity: quantity,
                            totalAmount: '₹ ${order.totalAmount ?? '0'}',
                            paidAmount: '₹ ${order.amountPaid ?? '0'}',
                            pendingAmount: '₹ ${order.remainingBalance ?? '0'}',
                            status: order.orderStatus?.toString() ?? 'Pending',
                          );
                        }).toList()
                      : [],
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
