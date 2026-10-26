import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant_Color.dart';

import 'Constant/Constantstockcard.dart';

class Addproduct extends StatelessWidget {
  Addproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Sizes.screenWidth * 0.12,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Color(0xFFFFF9F0),
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
                    SizedBox(width: 20),
                    Container(
                      height: Sizes.screenWidth * 0.094,
                      width: Sizes.screenWidth * 0.094,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFB58B76),
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Color(0xFFFFF8F3)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Product Details',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF782A17),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'View product information and stock details',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF77716D),
                        ),
                      ),
                    ],
                  ),
                ),
      
                SizedBox(width: 8),
      
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF963A20),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Edit Product',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFFFFBF8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFEDE5DF)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        height: Sizes.screenWidth * 0.292,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAEFEB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/bricks.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
      
                      SizedBox(height: 5),
      
                      Row(
                        children: [
                          for (int i = 1; i <= 4; i++)
                            Expanded(
                              child: Container(
                                height: 32,
                                margin: EdgeInsets.only(right: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: i == 1
                                        ? Color(0xFF963A20)
                                        : Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Image.asset(
                                  'assets/bricks.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
      
                SizedBox(width: 10),
      
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Red Bricks (Standard)',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF782A17),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE0F4E4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Active',
                              style: GoogleFonts.poppins(fontSize: 10, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
      
                      SizedBox(height: 4),
      
                      Row(
                        children: [
                          Text(
                            'Code: RB-001',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.copy, size: 11, color: Color(0xFF963A20)),
                        ],
                      ),
      
                      SizedBox(height: 4),
      
                      Text(
                        'Standard red clay bricks suitable for construction. High strength and durable.',
                        style: GoogleFonts.poppins(
                          fontSize: 9,
                          color: Colors.blueGrey,
                          height: 1.3,
                        ),
                      ),
      
                      SizedBox(height: 6),
      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFFFAEFEB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.category,
                              size: 16,
                              color: Color(0xFF963A20),
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Category',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                'Bricks',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
      
                      SizedBox(height: 4),
      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFFFAEFEB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.straighten,
                              size: 16,
                              color: Color(0xFF963A20),
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Size (L × W × H)',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                '230 × 110 × 70 mm',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
      
                      SizedBox(height: 4),
      
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFFFAEFEB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.palette,
                              size: 16,
                              color: Color(0xFF963A20),
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Colour',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                'Red',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
      
                      SizedBox(height: 4),
      
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFFFAEFEB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.view_in_ar,
                              size: 16,
                              color: Color(0xFF963A20),
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Type',
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                'Standard',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 2.1,
              children: [
                StockCard(
                  title: 'Available Stock',
                  value: '15,000',
                  subtitle: 'Pieces',
                  icon: Icons.inventory_2,
                  backgroundColor:  Color(0xFFFFF0EC),
                  iconBackgroundColor:  Color(0xFFFCE0D8),
                  iconColor:  Color(0xFF9D2417),
                  titleColor:  Color(0xFF555555),
                  valueColor:  AppColor.stockAmountColor,
                  subtitleColor:  AppColor.stockUnitColor,
                ),
                StockCard(
                  title: 'Minimum Stock Alert',
                  value: '1,000',
                  icon: Icons.notifications,
                  backgroundColor: Color(0xFFFFF0EC),
                  iconBackgroundColor: Color(0xFFFCE0D8),
                  iconColor: Color(0xFF9D2417),
                  valueColor:  AppColor.stockAmountColor,
                  subtitleColor:  AppColor.stockUnitColor,
                ),
                StockCard(
                  title: 'Total Production',
                  value: '45,000',
                  icon: Icons.settings,
                  backgroundColor: Color(0xFFEEF8F0),
                  iconBackgroundColor: Color(0xFFDDF1E3),
                  iconColor: Color(0xFF16804A),
                  valueColor:  AppColor.productionAmountColor,
                  titleColor:  AppColor.green
                ),
                StockCard(
                  title: 'Total Dispatched',
                  value: '28,500',
                  icon: Icons.local_shipping,
                  backgroundColor: Color(0xFFEBF5FF),
                  iconBackgroundColor: Color(0xFFD8ECFF),
                  iconColor: Color(0xFF0864B5),
                    valueColor:  AppColor.productionAmountColor,
                    titleColor:  AppColor.blueAccent
                ),
                StockCard(
                  title: 'Total Sold',
                  value: '25,000',
                  icon: Icons.shopping_cart,
                  backgroundColor: Color(0xFFFFF9E9),
                  iconBackgroundColor: Color(0xFFFFF0D0),
                  iconColor: Color(0xFFAA6800),
                  valueColor: Colors.black,
                ),
                StockCard(
                  title: 'Current Stock Value',
                  value: '₹ 1,20,000',
                  subtitle: '(at selling price)',
                  icon: Icons.widgets,
                  backgroundColor: Color(0xFFFFF0EC),
                  iconBackgroundColor: Color(0xFFFCE0D8),
                  iconColor: Color(0xFF9D2417),
                  valueColor:  AppColor.stockAmountColor,
                ),
                StockCard(
                  title: 'Cost Price',
                  value: '₹ 5.00',
                  subtitle: '(per piece)',
                  icon: Icons.currency_rupee,
                  backgroundColor: Color(0xFFFFFBF8),
                  iconBackgroundColor: Color(0xFFFCE7DF),
                  iconColor: Color(0xFF9D2417),
                  valueColor:  AppColor.stockAmountColor,
                ),
                StockCard(
                  title: 'Selling Price',
                  value: '₹ 8.00',
                  subtitle: '(per piece)',
                  icon: Icons.currency_rupee,
                  backgroundColor: Color(0xFFFFFBF8),
                  iconBackgroundColor: Color(0xFFFCE7DF),
                  iconColor: Color(0xFF9D2417),
                  valueColor:  AppColor.stockAmountColor,
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: Sizes.screenWidth * 0.33,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF963A20),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, size: 18),
                          SizedBox(width: 7),
                          Flexible(
                            child: Text(
                              'Add Production',
                              maxLines: 1,
                              style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 6),

                  SizedBox(
                    width: Sizes.screenWidth * 0.33,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF963A20),
                        side: BorderSide(
                          color: Color(0xFF963A20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.swap_vert, size: 18),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              'Stock Adjustment',
                              maxLines: 1,
                              style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 6),

                  SizedBox(
                    width: Sizes.screenWidth * 0.33,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF963A20),
                        side: BorderSide(
                          color: Color(0xFF963A20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_shipping, size: 16),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              'Create Dispatch',
                              maxLines: 1,
                              style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      ),
    ),
    );
  }
}


