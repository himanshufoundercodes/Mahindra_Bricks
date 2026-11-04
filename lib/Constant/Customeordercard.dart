import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';

import '../viewproductdetails.dart';
import 'Constnat_Appbutton.dart';
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
    this.statusTextColor = const Color(0xFF98500A), required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.screenWidth * 0.027,
        vertical: Sizes.screenHeight * 0.006,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.grey,
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
                    horizontal: Sizes.screenWidth * 0.027,
                    vertical: Sizes.screenHeight * 0.005,
                  ),
                  decoration: BoxDecoration(
                    color:AppColor.stockTitleColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Order #$orderId',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: AppColor.white,
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
                    color: AppColor.stockTitleColor,
                  ),
                  SizedBox(width: Sizes.screenWidth * 0.011,),
                  Text(
                    dateTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColor.gey,
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
                  color: AppColor.imgbg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: Sizes.screenWidth * 0.022),
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
                        color: AppColor.black,
                      ),
                    ),
                    Text(
                      quantity,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColor.black,
                      ),
                    ),
                    Text(
                      'Customer: $customer',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: AppColor.gey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Sizes.screenWidth * 0.05),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.021,
                  vertical: Sizes.screenHeight * 0.006,
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
              CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                height: 35,
                width: 100,
                text: 'View Details',
                fontSize:  12,
                fontWeight: .w500,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Viewproductdetails(),
                    ),
                  );
                },
                iconOnLeft: false,
                icon: Icons.arrow_forward_ios_sharp,
                iconSize: 12,
                iconSpacing: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
