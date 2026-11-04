import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constantstockcard.dart';
import 'Constant/Constnat_Appbutton.dart';

class Addproduct extends StatefulWidget {
  final image;
  final name;
  final size;
  final code;
  final price;
  final stockStatus;
  final category;

  Addproduct({
    super.key,
    required this.image,
    required this.name,
    required this.size,
    required this.code,
    required this.price,
    required this.stockStatus, this.category,
  });

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {

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
      body: Column(
        children: [
          _buildHeader(),
          Card(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Sizes.screenWidth * 0.385,
                    decoration: BoxDecoration(
                      color: AppColor.imgbg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.contain,
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
                                widget.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.stockTitleColor,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.screenWidth * 0.016,
                                vertical: Sizes.screenHeight * 0.004,
                              ),
                              decoration: BoxDecoration(
                                color:AppColor.lightgreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                widget.stockStatus,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 4),

                        Row(
                          children: [
                            Text(
                              "Code : ${widget.code}",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: AppColor.gey,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.copy,
                              size: 11,
                              color:AppColor.stockUnitColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Standard red clay bricks suitable for construction. High strength and durable.',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            color:AppColor.gey,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 8),

                        Column(
                          children: [
                            Row(
                              children: [
                                product(title: 'Category', subtitle: 'Bricks', icon: Icons.eighteen_mp),
                                SizedBox(width: 4),
                                product(title: 'Size (L × W × H)', subtitle: '230 × 110 × 70 mm', icon: Icons.straighten),
                              ],
                            ),
                           SizedBox(height: 10),
                           Row(
                             children: [
                               product(title: 'Colour', subtitle: 'Red', icon: Icons.view_in_ar),
                               SizedBox(width: 18),
                               product(title: 'Product Type', subtitle: 'Standard', icon: Icons.straighten)
                             ],
                           )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
                  backgroundColor: AppColor.lightred,
                  iconBackgroundColor: AppColor.lightredbg,
                  iconColor: AppColor.stockUnitColor,
                  titleColor: AppColor.gey,
                  valueColor: AppColor.stockAmountColor,
                  subtitleColor: AppColor.stockUnitColor,
                ),
                StockCard(
                  title: 'Minimum Stock Alert',
                  value: '1,000',
                  icon: Icons.notifications,
                  backgroundColor: AppColor.lightred,
                  iconBackgroundColor: AppColor.lightredbg,
                  iconColor: AppColor.stockUnitColor,
                  titleColor: AppColor.gey,
                  valueColor: AppColor.stockAmountColor,
                  subtitleColor: AppColor.stockUnitColor,
                ),
                StockCard(
                  title: 'Total Production',
                  value: '45,000',
                  icon: Icons.settings,
                  backgroundColor: AppColor.productbackgroundColor,
                  iconBackgroundColor: AppColor.bgicon,
                  iconColor: AppColor.productionUnitColor,
                  valueColor: AppColor.productionAmountColor,
                  titleColor: AppColor.green,
                ),
                StockCard(
                  title: 'Total Dispatched',
                  value: '28,500',
                  icon: Icons.local_shipping,
                  backgroundColor: AppColor.dispatchBackgroundColor,
                  iconBackgroundColor: AppColor.dispatcheColor,
                  iconColor: AppColor.dispatchiconcolore,
                  valueColor: AppColor.productionAmountColor,
                  titleColor: AppColor.blueAccent,
                ),
                StockCard(
                  title: 'Total Sold',
                  value: '25,000',
                  icon: Icons.shopping_cart,
                  backgroundColor: AppColor.lightyellow,
                  iconBackgroundColor: AppColor.lightmediumyellow,
                  iconColor: AppColor.darkyellow,
                  valueColor: AppColor.black,
                ),
                StockCard(
                  title: 'Current Stock Value',
                  value: '₹ 1,20,000',
                  subtitle: '(at selling price)',
                  icon: Icons.widgets,
                  backgroundColor: AppColor.lightred,
                  iconBackgroundColor: AppColor.lightredbg,
                  iconColor: AppColor.stockUnitColor,
                  titleColor: AppColor.gey,
                  valueColor: AppColor.stockAmountColor,
                  subtitleColor: AppColor.gey,
                ),
                StockCard(
                  title: 'Cost Price',
                  value: '₹ 5.00',
                  subtitle: '(per piece)',
                  icon: Icons.currency_rupee,
                  backgroundColor: AppColor.lightbgcolor,
                  iconBackgroundColor: AppColor.lightredbg,
                  iconColor: AppColor.stockUnitColor,
                  titleColor: AppColor.gey,
                  valueColor: AppColor.stockAmountColor,
                  subtitleColor: AppColor.gey,
                ),
                StockCard(
                  title: 'Selling Price',
                  value: '₹ 8.00',
                  subtitle: '(per piece)',
                  icon: Icons.currency_rupee,
                  backgroundColor: AppColor.lightbgcolor,
                  iconBackgroundColor: AppColor.lightredbg,
                  iconColor: AppColor.stockUnitColor,
                  titleColor: AppColor.gey,
                  valueColor: AppColor.stockAmountColor,
                  subtitleColor: AppColor.gey,
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: Sizes.screenWidth * 0.33,
          //           child: ElevatedButton(
          //             onPressed: () {},
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: Color(0xFF963A20),
          //               foregroundColor: Colors.white,
          //               elevation: 0,
          //               padding: EdgeInsets.symmetric(vertical: 12),
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(7),
          //               ),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.settings, size: 18),
          //                 SizedBox(width: 7),
          //                 Flexible(
          //                   child: Text(
          //                     'Add Production',
          //                     maxLines: 1,
          //                     style: GoogleFonts.poppins(
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //
          //         SizedBox(width: 6),
          //
          //         SizedBox(
          //           width: Sizes.screenWidth * 0.33,
          //           child: OutlinedButton(
          //             onPressed: () {},
          //             style: OutlinedButton.styleFrom(
          //               foregroundColor: Color(0xFF963A20),
          //               side: BorderSide(color: Color(0xFF963A20)),
          //               padding: EdgeInsets.symmetric(vertical: 12),
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(7),
          //               ),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.swap_vert, size: 18),
          //                 SizedBox(width: 5),
          //                 Flexible(
          //                   child: Text(
          //                     'Stock Adjustment',
          //                     maxLines: 1,
          //                     style: GoogleFonts.poppins(
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //
          //         SizedBox(width: 6),
          //
          //         SizedBox(
          //           width: Sizes.screenWidth * 0.33,
          //           child: OutlinedButton(
          //             onPressed: () {},
          //             style: OutlinedButton.styleFrom(
          //               foregroundColor: Color(0xFF963A20),
          //               side: BorderSide(color: Color(0xFF963A20)),
          //               padding: EdgeInsets.symmetric(vertical: 12),
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(7),
          //               ),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.local_shipping, size: 16),
          //                 SizedBox(width: 5),
          //                 Flexible(
          //                   child: Text(
          //                     'Create Dispatch',
          //                     maxLines: 1,
          //                     style: GoogleFonts.poppins(
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
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
                  'Product Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'View product information and stock details',
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

            SizedBox(width: 8),

            CustomButton(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              height: 35,
              width: 100,
              text: 'Edit Product',
              fontSize:  12,
              fontWeight: .w500,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddProductPage()),
                // );
              },
              iconOnLeft: true,
              icon: Icons.edit,
              iconSize: 15,
              iconSpacing: 2,
            ),

          ],
        ),
      ),
    );
  }

  Widget product({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color:AppColor.imgbg,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppColor.stockTitleColor,
          ),
        ),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
