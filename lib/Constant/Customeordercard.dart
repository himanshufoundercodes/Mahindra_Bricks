import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Sizes.dart';

class CustomOrderCard extends StatelessWidget {
  final String orderId;
  final String dateTime;
  final String image;
  final String productName;
  final String quantity;
  final String customer;
  final String price;
  final String orderStatus;
  final String dispatchStatus;
  final VoidCallback? onViewDetails;

  final Color backgroundColor;
  final Color statusColor;
  final Color statusTextColor;

  CustomOrderCard({
    super.key,
    required this.orderId,
    required this.dateTime,
    required this.image,
    required this.productName,
    required this.quantity,
    required this.customer,
    required this.price,
    required this.orderStatus,
    required this.dispatchStatus,
    this.onViewDetails,
    this.backgroundColor = const Color(0xFFFFFCFA),
    this.statusColor = const Color(0xFFFFE7B5),
    this.statusTextColor = const Color(0xFF98500A),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFEDE3DD),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF963A20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Order #$orderId',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 15,
                    color: Color(0xFF782A17),
                  ),
                  SizedBox(width: 4),
                  Text(
                    dateTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF514944),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Sizes.screenWidth * 0.155,
                width: Sizes.screenWidth * 0.203,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color(0xFFF8EFEB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      quantity,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Customer: $customer',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Color(0xFF514944),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Color(0xFF98500A),
                    ),
                    SizedBox(width: 3),
                    Text(
                      orderStatus,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: statusTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            children: [
              Icon(
                Icons.currency_rupee,
                size: 17,
                color: Color(0xFF782A17),
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 24,
                width: 1,
                color: Color(0xFFE4D6CE),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.local_shipping_outlined,
                size: 17,
                color: Color(0xFF963A20),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  dispatchStatus,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Color(0xFF514944),
                  ),
                ),
              ),
              SizedBox(
                height: Sizes.screenWidth * 0.086,
                child: ElevatedButton(
                  onPressed: onViewDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF963A20),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Details',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.chevron_right,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
