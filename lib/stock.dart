import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant_Color.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFf6efe9),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildStockContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Stock Management',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF782A17),
                    ),
                  ),
                  Text(
                    'Manage your bricks and paver blocks inventory',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF66615D),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Navigation code to open AddProductPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF963A20),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 9,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 15),
                  SizedBox(width: 3),
                  Text(
                    'Add Product',
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
    );
  }

  Widget _buildStockContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Sizes.screenWidth * 0.29,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFfaf1ee),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.08),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Row(
                children: [
                  SizedBox(
                    width: 95,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/cleft.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Stock',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF782A17),
                          ),
                        ),
                        Text(
                          '24,560',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color: Color(0xFF782A17),
                          ),
                        ),
                        Text(
                          'Pieces',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xFF77716D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 68,
                    color: Color(0xFFE5CFC4),
                  ),

                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        'assets/cright.jpg',
                        fit: BoxFit.fill,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryTab('All (12)', 0),
                    _buildCategoryTab('Bricks (6)', 1),
                    _buildCategoryTab('Paver Blocks (5)', 2),
                    _buildCategoryTab('Other (1)', 3),
                  ],
                ),
              ),

              SizedBox(height: 12),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: Sizes.screenHeight * 0.05,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFE8E0DA),
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 20,
                              color: Color(0xFF77716D),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search product by name, size or code...',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF89837E),
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
                    SizedBox(width: 8),
                    Container(
                      height: Sizes.screenHeight * 0.048,
                      width: Sizes.screenWidth * 0.09,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF8F5),
                        border: Border.all(
                          color: Color(0xFFE8E0DA),
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
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
            ],
          ),
          SizedBox(height: 5),

          CustomProductCard(
            image: 'assets/bricks.jpg',
            name: 'Red Bricks (Standard)',
            size: '230 × 110 × 70 mm',
            code: 'RB-001',
            price: '15,000',
            stockStatus: 'In Stock',
            backgroundColor:AppColor.tilesColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addproduct()),
              );
            },
          ),

          CustomProductCard(
            image: 'assets/bricks2.jpg',
            name: 'Paver Block (Grey)',
            size: '200 × 100 × 60 mm',
            code: 'PB-001',
            price: '4250',
            stockStatus: 'In Stock',
            backgroundColor:AppColor.tilesColor,
            onTap: () {
              print('Paver Blocks clicked');
            },
          ),
          CustomProductCard(
            image: 'assets/bricls3.jpg',
            name: 'Paver Block (Red)',
            size: '230 × 110 × 60 mm',
            code: 'RB-002',
            price: '3600',
            stockStatus: 'In Stock',
            backgroundColor:AppColor.tilesColor,
            onTap: () {
              print('Red Bricks clicked');
            },
          ),
          CustomProductCard(
            image: 'assets/bricks4.jpg',
            name: 'Hollow Block',
            size: '400 × 200 × 150 mm',
            code: 'HB -001',
            price: '850',
            stockStatus: 'Low Stock',
            stockColor: Colors.orange,
            backgroundColor:AppColor.tilesColor,
            onTap: () {
              print('Red Bricks clicked');
            },
          ),
          CustomProductCard(
            image: 'assets/bricls3.jpg',
            name: 'Hollow Block',
            size: '400 × 200 × 150 mm',
            code: 'HB -001',
            price: '850',
            stockStatus: 'Low Stock',
            stockColor: Colors.orange,
            backgroundColor:AppColor.tilesColor,
            onTap: () {
              print('Red Bricks clicked');
            },
          ),
          CustomProductCard(
            image: 'assets/bricks6.jpg',
            name: 'Hollow Block',
            size: '400 × 200 × 150 mm',
            code: 'HB -001',
            price: '850',
            stockStatus: 'Low Stock',
            stockColor: Colors.orange,
            backgroundColor:AppColor.tilesColor,
            onTap: () {
              print('Red Bricks clicked');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, int index) {
    final bool isSelected = selectedCategory == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFF963A20)
              : Color(0xFFF3EEEA),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: isSelected
                ? FontWeight.w600
                : FontWeight.normal,
            color: isSelected
                ? Colors.white
                : Color(0xFF77716D),
          ),
        ),
      ),
    );
  }

}