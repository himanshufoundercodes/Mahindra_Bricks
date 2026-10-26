import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewproductdetails.dart';

import 'Constant/Customeordercard.dart';

class Orders extends StatefulWidget {
  Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedOrderTab = 0;

  final List<String> orderTabs = [
    'All Orders (18)',
    'Pending (6)',
    'Processing (5)',
    'Dispatched (7)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Color(0xFFFFF8F5),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 2,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Orders',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF782A17),
                      height: 1.2,
                    ),
                  ),
                  Text(
                    'Manage your orders and dispatches',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF625D59),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Row(
                children: List.generate(orderTabs.length, (index) {
                  final bool isSelected = selectedOrderTab == index;
        
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOrderTab = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xFF963A20)
                            : Color(0xFFF5ECE7),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        orderTabs[index],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : Color(0xFF54291E),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: Sizes.screenHeight * 0.052,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFC),
                        border: Border.all(
                          color: Color(0xFFE8E0DA),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 22,
                            color: Color(0xFF625D59),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search by Order ID, Customer or Product...',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Color(0xFF77716D),
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        
                  SizedBox(width: 10),
        
                  Container(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.093,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFDFC),
                      border: Border.all(
                        color: Color(0xFFE8E0DA),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.tune,
                        size: 21,
                        color: Color(0xFF782A17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: [
                CustomOrderCard(
                  orderId: 'ORD-0018',
                  dateTime: '17 Oct 2026, 04:30 PM',
                  image: 'assets/bricks.jpg',
                  productName: 'Red Bricks (Standard)',
                  quantity: '5000 Pieces',
                  customer: 'Sharma Construction',
                  price: '25,000',
                  orderStatus: 'Pending',
                  dispatchStatus: 'Not Dispatched',
                  onViewDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Viewproductdetails(),
                      ),
                    );
                  },
                ),
        
                CustomOrderCard(
                  orderId: 'ORD-0017',
                  dateTime: '18 Oct 2026, 10:00 AM',
                  image: 'assets/bricks2.jpg',
                  productName: 'Paver Blocks(Grey)',
                  quantity: '3000 Pieces',
                  customer: 'Green Build Pvt.Ltd.',
                  price: '18,000',
                  orderStatus: 'Dispatched',
                  dispatchStatus: 'Dispatched on 16 Oct',
                  statusColor: const Color(0xFFDCEBFF),
                  statusTextColor: const Color(0xFF245BA8),
                  onViewDetails: () {
                  },
                ),
                CustomOrderCard(
                  orderId: 'ORD-0016',
                  dateTime: '16 Oct 2026, 02:15 PM',
                  image: 'assets/bricls3.jpg',
                  productName: 'Paver Blocks(Red)',
                  quantity: '2000 Pieces',
                  customer: 'Buildwell Developers',
                  price: '12,000',
                  orderStatus: 'Processing',
                  dispatchStatus: 'In Processing',
                  onViewDetails: () {
                  },
                ),
        
                CustomOrderCard(
                  orderId: 'ORD-0019',
                  dateTime: '18 Oct 2026, 10:00 AM',
                  image: 'assets/bricks4.jpg',
                  productName: 'Paver Blocks',
                  quantity: '2000 Pieces',
                  customer: 'Gupta Builders',
                  price: '18,500',
                  orderStatus: 'Processing',
                  dispatchStatus: 'Not Dispatched',
                  statusColor: const Color(0xFFDCEBFF),
                  statusTextColor: const Color(0xFF245BA8),
                  onViewDetails: () {
                  },
                ),
        
              ],
            )
        
          ],
        ),
      ),
    );
  }
}
