import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constantstockcard.dart';
import 'Constant/Constnat_Appbutton.dart';

class Addproduct extends StatefulWidget {
  final dynamic image;
  final dynamic name;
  final dynamic size;
  final dynamic code;
  final dynamic price;
  final dynamic stockStatus;
  final dynamic category;
  final dynamic AvaibleStock;
  final dynamic MinimumStockAlert;
  final dynamic TotalProduction;
  final dynamic TotalDispatched;
  final dynamic TotalSold;
  final dynamic CurrentStockValue;
  final dynamic CostPrice;
  final dynamic SellingPrice;

  Addproduct({
    super.key,
    this.image,
    this.name,
    this.size,
    this.code,
    this.price,
    this.stockStatus,
    this.category,
    this.AvaibleStock,
    this.MinimumStockAlert,
    this.TotalProduction,
    this.TotalDispatched,
    this.TotalSold,
    this.CurrentStockValue,
    this.CostPrice,
    this.SellingPrice,
  });

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  Color _getStatusTextColor(String? status) {
    final statusLower = (status ?? '').toLowerCase();
    if (statusLower.contains('low') ||
        statusLower.contains('out') ||
        statusLower.contains('alert') ||
        statusLower.contains('critical')) {
      return const Color(0xFFD32F2F);
    } else if (statusLower.contains('medium') ||
        statusLower.contains('pending') ||
        statusLower.contains('warning')) {
      return const Color(0xFFE58A00);
    } else {
      return const Color(0xFF2E9B59);
    }
  }

  Color _getStatusBgColor(String? status) {
    return _getStatusTextColor(status).withValues(alpha: 0.13);
  }

  @override
  Widget build(BuildContext context) {
    final String imageStr = widget.image?.toString() ?? '';
    final String nameStr = (widget.name != null && widget.name.toString().trim().isNotEmpty)
        ? widget.name.toString().trim()
        : 'Product Details';
    final String sizeStr = (widget.size != null && widget.size.toString().trim().isNotEmpty)
        ? widget.size.toString().trim()
        : '230 × 110 × 70 mm';
    final String codeStr = (widget.code != null && widget.code.toString().trim().isNotEmpty)
        ? widget.code.toString().trim()
        : 'N/A';
    final String categoryStr = (widget.category != null && widget.category.toString().trim().isNotEmpty)
        ? widget.category.toString().trim()
        : 'Bricks';
    final String displayStatus = (widget.stockStatus != null && widget.stockStatus.toString().trim().isNotEmpty)
        ? widget.stockStatus.toString().trim()
        : 'In Stock';

    final String availableStockStr = widget.AvaibleStock?.toString() ?? '0';
    final String minStockAlertStr = widget.MinimumStockAlert?.toString() ?? '0';
    final String totalProductionStr = widget.TotalProduction?.toString() ?? '0';
    final String totalDispatchedStr = widget.TotalDispatched?.toString() ?? '0';
    final String totalSoldStr = widget.TotalSold?.toString() ?? '0';
    final String currentStockValueStr = widget.CurrentStockValue?.toString() ?? '0';
    final String costPriceStr = widget.CostPrice?.toString() ?? '0';
    final String sellingPriceStr = widget.SellingPrice?.toString() ?? '0';

    final Color statusTextColor = _getStatusTextColor(displayStatus);
    final Color statusBgColor = _getStatusBgColor(displayStatus);

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
            _buildHeader(),
            Card(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Sizes.screenWidth * 0.335,
                      decoration: BoxDecoration(
                        color: AppColor.imgbg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: imageStr.startsWith('http')
                          ? Image.network(
                              imageStr,
                              height: Sizes.screenHeight * 0.16,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: Sizes.screenHeight * 0.16,
                                color: AppColor.imgbg,
                                child: Icon(Icons.inventory_2,
                                    size: 40, color: AppColor.stockUnitColor),
                              ),
                            )
                          : Image.asset(
                              imageStr.isNotEmpty ? imageStr : 'assets/bricks.jpg',
                              height: Sizes.screenHeight * 0.16,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: Sizes.screenHeight * 0.16,
                                color: AppColor.imgbg,
                                child: Icon(Icons.inventory_2,
                                    size: 40, color: AppColor.stockUnitColor),
                              ),
                            ),
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.025),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  nameStr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.stockTitleColor,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.screenWidth * 0.020,
                                  vertical: Sizes.screenHeight * 0.004,
                                ),
                                decoration: BoxDecoration(
                                  color: statusBgColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  displayStatus,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: statusTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.005),
                          Row(
                            children: [
                              Text(
                                "Code : $codeStr",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: AppColor.gey,
                                ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.015),
                              Icon(
                                Icons.copy,
                                size: 11,
                                color: AppColor.stockUnitColor,
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.005),
                          Text(
                            'Standard red clay bricks suitable for construction. High strength and durable.',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              color: AppColor.gey,
                              height: Sizes.screenHeight * 0.0016,
                            ),
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.01),
                          Column(
                            children: [
                              Row(
                                children: [
                                  product(
                                    title: 'Category',
                                    subtitle: categoryStr,
                                    icon: Icons.eighteen_mp,
                                  ),
                                  SizedBox(width: Sizes.screenWidth * 0.005),
                                  product(
                                    title: 'Size (L × W × H)',
                                    subtitle: sizeStr,
                                    icon: Icons.straighten,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  product(
                                    title: 'Colour',
                                    subtitle: 'Red',
                                    icon: Icons.view_in_ar,
                                  ),
                                  const SizedBox(width: 18),
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
            Column(
              children: [
                const SizedBox(height: 15),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 2.1,
                  children: [
                    // Available Stock
                    StockCard(
                      title: 'Available Stock',
                      value: availableStockStr,
                      subtitle: 'Pieces',
                      icon: Icons.inventory_2,
                      backgroundColor: AppColor.lightred,
                      iconBackgroundColor: AppColor.lightredbg,
                      iconColor: AppColor.stockUnitColor,
                      titleColor: AppColor.gey,
                      valueColor: AppColor.stockAmountColor,
                      subtitleColor: AppColor.stockUnitColor,
                    ),

                    // Minimum Stock Alert
                    StockCard(
                      title: 'Minimum Stock Alert',
                      value: minStockAlertStr,
                      icon: Icons.notifications,
                      backgroundColor: AppColor.lightred,
                      iconBackgroundColor: AppColor.lightredbg,
                      iconColor: AppColor.stockUnitColor,
                      titleColor: AppColor.gey,
                      valueColor: AppColor.stockAmountColor,
                    ),

                    // Total Production
                    StockCard(
                      title: 'Total Production',
                      value: totalProductionStr,
                      icon: Icons.settings,
                      backgroundColor: AppColor.productbackgroundColor,
                      iconBackgroundColor: AppColor.bgicon,
                      iconColor: AppColor.productionUnitColor,
                      valueColor: AppColor.productionAmountColor,
                      titleColor: AppColor.green,
                    ),

                      // Total Sold
                      StockCard(
                        title: 'Total Sold',
                        value: widget.TotalSold,
                        icon: Icons.shopping_cart,
                        backgroundColor: AppColor.lightyellow,
                        iconBackgroundColor: AppColor.lightmediumyellow,
                        iconColor: AppColor.darkyellow,
                        valueColor: AppColor.black,
                      ),

                      // Current Stock Value
                      StockCard(
                        title: 'Current Stock Value',
                        value: '₹ ${widget.CurrentStockValue.toString()}',
                        subtitle: '(at selling price)',
                        icon: Icons.widgets,
                        backgroundColor: AppColor.lightred,
                        iconBackgroundColor: AppColor.lightredbg,
                        iconColor: AppColor.stockUnitColor,
                        titleColor: AppColor.gey,
                        valueColor: AppColor.stockAmountColor,
                        subtitleColor: AppColor.gey,
                      ),

                      // Cost Price
                      StockCard(
                        title: 'Cost Price',
                        value: '₹ ${widget.CostPrice.toString()}',
                        subtitle: '(per piece)',
                        icon: Icons.currency_rupee,
                        backgroundColor: AppColor.lightbgcolor,
                        iconBackgroundColor: AppColor.lightredbg,
                        iconColor: AppColor.stockUnitColor,
                        titleColor: AppColor.gey,
                        valueColor: AppColor.stockAmountColor,
                        subtitleColor: AppColor.gey,
                      ),

                      // Selling Price
                      StockCard(
                        title: 'Selling Price',
                        value: '₹ ${widget.SellingPrice}',
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
                  )
              ],
            ),
          ],
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
