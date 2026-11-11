import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/viewmodel/stocklist_viewmodel.dart';
import 'package:provider/provider.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/customeproductcard.dart';
import 'addproduct.dart';
import 'viewproductdetails.dart';
import 'circularprogressindicator.dart';

class Stock extends StatefulWidget {
  Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StocklistViewmodel>(
        context,
        listen: false,
      ).StockListApi();
    });
  }
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    final stockList = Provider.of<StocklistViewmodel>(context);
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
            StockContente(stockList),
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
          ],
        ),
      ),
    );
  }

  Widget StockContente(dynamic stockList){
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
              SizedBox(height: 15),

              if (stockList.loading)
                Center(
                  child: Circularprogressindicator(),
                )
              else if (stockList.stockList.isEmpty)
                Center(
                  child: Text('No Stock Found'),
                )
              else
                ListView.builder(
                  itemCount: stockList.stockList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final stock = stockList.stockList[index];
                    return CustomProductCard(
                      image: stock.image,
                      name: stock.name?.toString() ?? '',
                      size: stock.size,
                      code: stock.code,
                      price: stock.price,
                      stockStatus: stock.stockStatus,
                      backgroundColor: AppColor.tilesColor,
                      onArrowTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Viewproductdetails(),
                          ),
                        );
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Viewproductdetails(),
                          ),
                        );
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