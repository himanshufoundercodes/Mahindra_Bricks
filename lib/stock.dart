import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/addproduct.dart';
import 'package:mahindra_bricks/viewmodel/stocklist_viewmodel.dart';
import 'package:provider/provider.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/customeproductcard.dart';
import 'circularprogressindicator.dart';
import 'drawer.dart';
import 'viewproductdetails.dart';

class Stock extends StatefulWidget {
  final Function(int)? onMenuTap;
  final int selectedIndex;

  const Stock({
    super.key,
    this.onMenuTap,
    this.selectedIndex = 1,
  });

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
      ).stockListApi();
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
        showDrawer: true,
        logoAsset: 'assets/logo.jpg',
      ),
      drawer: MahindraDrawer(
        onMenuTap: widget.onMenuTap,
        selectedIndex: widget.selectedIndex,
      ),
      body: RefreshIndicator(
        color: AppColor.stockAmountColor,
        backgroundColor: Colors.white,
        displacement: 50,
        onRefresh: () async {
          await Provider.of<StocklistViewmodel>(
            context,
            listen: false,
          ).stockListApi();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(),
              StockContente(stockList),
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

  Widget StockContente(StocklistViewmodel stockList){
    final stockListData = stockList.stockListModel?.data ?? [];
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
                          stockList.stockListModel?.stockSummary?.title?.toString() ?? '',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                        Text(
                          stockList.stockListModel?.stockSummary?.totalStockFormatted?.toString() ??
                          stockList.stockListModel?.stockSummary?.totalStock?.toString() ?? '0',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color:AppColor.stockAmountColor,
                          ),
                        ),
                        Text(
                          stockList.stockListModel?.stockSummary?.unit?.toString() ?? '',
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
              else if (stockListData.isEmpty)
                Center(
                  child: Text('No Stock Found'),
                )
              else
                ListView.builder(
                  itemCount: stockListData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final stock = stockListData[index];
                    return GestureDetector( onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addproduct(
                            id: stock.id?.toString() ?? '',
                            image: stock.imageUrl?.toString() ?? '',
                            name: stock.name?.toString() ?? '',
                            category: stock.category?.toString() ?? '',
                            size: stock.dimensions?.toString() ?? '',
                            code: stock.sku?.toString() ?? '',
                            price: stock.pricePerUnit?.toString() ?? '',
                            stockStatus: stock.stockStatus?.toString() ?? '',
                            AvaibleStock: stock.stockQuantity?.toString() ?? '',
                            MinimumStockAlert: stock.minStockAlert?.toString() ?? '',
                            TotalProduction: stock.totalProduction?.toString() ?? '',
                            TotalDispatched: stock.totalDispatched?.toString() ?? '',
                            TotalSold: stock.totalSold?.toString() ?? '',
                            CurrentStockValue: stock.currentStockValue?.toString() ?? '',
                            CostPrice: stock.costPrice?.toString() ?? '',
                            SellingPrice: stock.sellingPrice?.toString() ?? '',
                            categoryId: stock.categoryId?.toString() ?? '',
                            colour: stock.colour?.toString() ?? '',
                            productType: stock.productType?.toString() ?? '',
                            lengthMm: stock.lengthMm?.toString() ?? '',
                            widthMm: stock.widthMm?.toString() ?? '',
                            heightMm: stock.heightMm?.toString() ?? '',
                            description: stock.description?.toString() ?? '',
                          ),
                        ),
                      );
                    },
                      child: CustomProductCard(
                        image: stock.imageUrl?.toString() ?? '',
                        name: stock.name?.toString() ?? '',
                        size: stock.dimensions?.toString() ?? '',
                        code: stock.sku?.toString() ?? '',
                        price: stock.pricePerUnit?.toString() ?? '',
                        stockStatus: stock.stockStatus?.toString() ?? '',
                        backgroundColor: AppColor.tilesColor,
                        onArrowTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Addproduct(
                                id: stock.id?.toString() ?? '',
                                image: stock.imageUrl?.toString() ?? '',
                                name: stock.name?.toString() ?? '',
                                size: stock.dimensions?.toString() ?? '',
                                code: stock.sku?.toString() ?? '',
                                price: stock.pricePerUnit?.toString() ?? '',
                                stockStatus: stock.stockStatus?.toString() ?? '',
                                AvaibleStock: stock.stockQuantity?.toString() ?? '',
                                MinimumStockAlert: stock.minStockAlert?.toString() ?? '',
                                TotalProduction: stock.totalProduction?.toString() ?? '',
                                TotalDispatched: stock.totalDispatched?.toString() ?? '',
                                TotalSold: stock.totalSold?.toString() ?? '',
                                CurrentStockValue: stock.currentStockValue?.toString() ?? '',
                                CostPrice: stock.costPrice?.toString() ?? '',
                                SellingPrice: stock.sellingPrice?.toString() ?? '',
                                categoryId: stock.categoryId?.toString() ?? '',
                                colour: stock.colour?.toString() ?? '',
                                productType: stock.productType?.toString() ?? '',
                                lengthMm: stock.lengthMm?.toString() ?? '',
                                widthMm: stock.widthMm?.toString() ?? '',
                                heightMm: stock.heightMm?.toString() ?? '',
                                description: stock.description?.toString() ?? '',
                              ),
                            ),
                          );
                        },
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Viewproductdetails(),
                        //     ),
                        //   );
                        // },
                      ),
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