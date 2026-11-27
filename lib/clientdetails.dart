import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/customesamrycard.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

import 'Constant/ConstantOrderhistory.dart';
import 'Constant/Constant_Appbar.dart';
import 'model/clistlist_model.dart';

class Clientdetails extends StatefulWidget {
  final Data data;

  const Clientdetails({
    super.key,
    required this.data,
  });

  @override
  State<Clientdetails> createState() => _ClientdetailsState();
}

class _ClientdetailsState extends State<Clientdetails> {
  String _formatOrderDateTime(dynamic createdAt, dynamic orderDate) {
    String rawStr = '';
    if (createdAt != null &&
        createdAt.toString().trim().isNotEmpty &&
        createdAt.toString().toLowerCase() != 'null') {
      rawStr = createdAt.toString().trim();
    } else if (orderDate != null &&
        orderDate.toString().trim().isNotEmpty &&
        orderDate.toString().toLowerCase() != 'null') {
      rawStr = orderDate.toString().trim();
    }

    if (rawStr.isEmpty) return '-';

    try {
      DateTime dt = DateTime.parse(rawStr).toLocal();
      String formattedDate = DateFormat('dd-MM-yyyy').format(dt);
      String formattedTime = DateFormat('hh:mm a').format(dt);
      return '$formattedDate\n$formattedTime';
    } catch (e) {
      return rawStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
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
                            date: _formatOrderDateTime(order.createdAt, order.orderDate),
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
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenHeight * 0.010,
        vertical: Sizes.screenHeight * 0.010,
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
                  'Client Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'View customer information and orders',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gey,
                  ),
                ),
              ],
            ),

            SizedBox(width: 8),

            // CustomButton(
            //   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            //   height: 35,
            //   width: 100,
            //   text: 'Add Client',
            //   fontSize: 12,
            //   fontWeight: .w500,
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Addclient()),
            //     );
            //   },
            //   iconOnLeft: true,
            //   icon: Icons.add,
            //   iconSize: 15,
            //   iconSpacing: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
