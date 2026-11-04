import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/customeproductcard.dart';
import 'addproduct.dart';
import 'addproductdetails.dart';

class Stock extends StatefulWidget {
  Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  int selectedCategory = 0;
  List<Map<String, dynamic>> productList = [
    {
      'image': 'assets/bricks.jpg',
      'name': 'Red Bricks (Standard)',
      'size': '230 × 110 × 70 mm',
      'code': 'RB-001',
      'price': '15,000',
      'stockStatus': 'In Stock',
    },
    {
      'image': 'assets/bricks2.jpg',
      'name': 'Premium Bricks',
      'size': '230 × 110 × 70 mm',
      'code': 'RB-002',
      'price': '18,000',
      'stockStatus': 'In Stock',
    },
    {
      'image': 'assets/bricls3.jpg',
      'name': 'Paver Block (Red)',
      'size': '300 × 110 × 70 mm',
      'code': 'RB-003',
      'price': '18,000',
      'stockStatus': 'In Stock',
    },
    {
      'image': 'assets/bricks4.jpg',
      'name': 'Hollow Bricks',
      'size': '300 × 110 × 70 mm',
      'code': 'RB-003',
      'price': '18,000',
      'stockStatus': 'In Stock',
    },
    {
      'image': 'assets/bricks5.jpg',
      'name': 'Zigzag Pavan',
      'size': '300 × 110 × 70 mm',
      'code': 'RB-003',
      'price': '18,000',
      'stockStatus': 'In Stock',
    },
    {
      'image': 'assets/bricks6.jpg',
      'name': 'Cemented Bricks',
      'size': '300 × 110 × 70 mm',
      'code': 'RB-003',
      'price': '18,000',
      'stockStatus': 'In Stock',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            StockContente(),
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
                  'Stock Management',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Manage your bricks and paver blocks inventory',
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
              text: 'Add Product',
              fontSize:  12,
              fontWeight: .w500,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              iconOnLeft: true,
              icon: Icons.add,
              iconSize: 15,
              iconSpacing: 2,
            ),

          ],
        ),
      ),
    );
  }

  Widget StockContente(){
    return Container(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.bglighttext,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.08),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Image.asset(
                       'assets/cleft.jpg',
                       fit: BoxFit.fill,
                       height: Sizes.screenHeight * 0.068,
                       width: Sizes.screenWidth * 0.187,
                     ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Stock',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                        Text(
                          '24,560',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color:AppColor.stockAmountColor,
                          ),
                        ),
                        Text(
                          'Pieces',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: AppColor.gey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: Sizes.screenWidth * 0.0025,
                      height: Sizes.screenHeight * 0.080,
                      color: AppColor.grey,
                    ),
                    Image.asset(
                      'assets/cright.jpg',
                      fit: BoxFit.fill,
                      height: Sizes.screenHeight * 0.085,
                      width: Sizes.screenWidth * 0.35,
                      alignment: Alignment.bottomRight,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return  CustomProductCard(
                      image: productList[index]['image'],
                      name: productList[index]['name'],
                  size: productList[index]['size'],
                  code: productList[index]['code'],
                  price: productList[index]['price'],
                  stockStatus: productList[index]['stockStatus'],
                      backgroundColor: AppColor.tilesColor,
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Addproduct(
                          image:  productList[index]['image'],
                          name: productList[index]['name'], size: productList[index]['size'],
                          code: productList[index]['code'],
                          price:  productList[index]['price'],
                          stockStatus: productList[index]['stockStatus'],)));
                     },
                  );
                },
              )
            ],
          ),
          SizedBox(height: Sizes.screenHeight * 0.006),
        ],
      ),
    );
  }

}