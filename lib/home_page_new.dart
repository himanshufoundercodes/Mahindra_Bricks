import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewmodel/dashboardview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/DashboardCardWidget.dart';
import 'Constant/QuickActionWidget.dart';
import 'Constant/constantText.dart';
import 'addproduction.dart';
import 'clients.dart';
import 'dailyattendence.dart';
import 'dailypayout.dart';
import 'drawer.dart';
import 'neworder.dart';

class HomePageNew extends StatefulWidget {
  final Function(int)? onMenuTap;
  final int selectedIndex;

  const HomePageNew({
    super.key,
    this.onMenuTap,
    this.selectedIndex = 0,
  });

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardviewModel>(
        context,
        listen: false,
      ).DashBoardApi();
    });
  }
  @override
  Widget build(BuildContext context) {
    final homedata = Provider.of<DashboardviewModel>(context);
    final cards = homedata.dashBoardListModel?.cards;

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
      body: homedata.loading && homedata.dashBoardListModel == null
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await Provider.of<DashboardviewModel>(
                  context,
                  listen: false,
                ).DashBoardApi();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: Sizes.screenHeight * 0.27,
                      width: Sizes.screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/homebg.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, right: 12),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ConstantText(
                                text: 'STRONGER FOUNDATIONS',
                                color: AppColor.stockTitleColor,
                                fontSize: 10,
                              ),
                              Text(
                                'FOR A BETTER TOMORROW',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.stockTitleColor,
                                ),
                              ),
                              SizedBox(height: 3),
                              SizedBox(
                                width: Sizes.screenWidth * 0.075,
                                child: Divider(
                                  color: AppColor.gey,
                                  thickness: 1.5,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Sizes.screenHeight * 0.015),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 7,
                        childAspectRatio: 1.65,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          DashboardCardWidget(
                            onTap: () {
                              widget.onMenuTap?.call(1);
                            },
                            title: 'Total Stock',
                            value: cards?.totalStock?.pieces?.toString() ?? '0',
                            unit: 'Pieces',
                            subtitle: cards?.totalStock?.subLabel ??
                                '${cards?.totalStock?.productsCount ?? 0} Products',
                            leftImage: 'assets/hc1.jpg',
                            titleColor: AppColor.stockTitleColor,
                            subtitleColor: AppColor.stockUnitColor,
                            color: AppColor.stockAmountColor,
                            unitColor: AppColor.stockUnitColor,
                            background: AppColor.backgroundColor,
                            rightImage: 'assets/bricks.jpg',
                            showArrow: true,
                          ),

                          DashboardCardWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddProduction(),
                                ),
                              );
                            },
                            title: "Today's Production",
                            value: cards?.todayProduction?.pieces?.toString() ?? '0',
                            unit: 'Pieces',
                            subtitle: cards?.todayProduction?.subLabel ??
                                '${cards?.todayProduction?.productsCount ?? 0} Products',
                            leftImage: 'assets/c2.jpg',
                            color: AppColor.productionAmountColor,
                            background: AppColor.productbackgroundColor,
                            titleColor: AppColor.productionTitleColor,
                            valueColor: AppColor.productionAmountColor,
                            unitColor: AppColor.productionUnitColor,
                            subtitleColor: AppColor.productionProductsColor,
                            rightImage: 'assets/bricks2.jpg',
                          ),

                          DashboardCardWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Clients(),
                                ),
                              );
                            },
                            title:'Total Clients',
                            value: cards?.totalClients?.clientsCount?.toString() ?? '0',
                            subtitle: cards?.totalClients?.subLabel ??
                                '${cards?.totalClients?.pendingPaymentsCount ?? 0} Pending Payments',
                            leftImage: 'assets/c3.jpg',
                            color: AppColor.clientsAmountColor,
                            background: AppColor.clientsBackgroundColor,
                            titleColor: AppColor.clientsTitleColor,
                            subtitleColor: AppColor.pendingPaymentsColor,
                            rightImage: 'assets/homec1.jpg',
                            showArrow: true,
                          ),

                          DashboardCardWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Neworder(),
                                ),
                              );
                            },
                            title:"Today's Dispatch",
                            value: cards?.todayDispatch?.pieces?.toString() ?? '0',
                            unit: 'Pieces',
                            subtitle: cards?.todayDispatch?.subLabel ??
                                '${cards?.todayDispatch?.tripsCount ?? 0} Trips',
                            leftImage: 'assets/c4.jpg',
                            color: AppColor.dispatchTripsColor,
                            background: AppColor.dispatchBackgroundColor,
                            titleColor: AppColor.dispatchTitleColor,
                            valueColor: AppColor.dispatchAmountColor,
                            unitColor: AppColor.dispatchUnitColor,
                            subtitleColor: AppColor.dispatchTripsColor,
                            rightImage: 'assets/truck.jpg',
                          ),

                          DashboardCardWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Dailyattendence(),
                                ),
                              );
                            },
                            title: 'Labour Present',
                            value:
                                '${cards?.labourPresent?.present ?? 0} / ${cards?.labourPresent?.total ?? 0}',
                            subtitle: cards?.labourPresent?.subLabel ??
                                '${cards?.labourPresent?.absent ?? 0} Absent | ${cards?.labourPresent?.halfDay ?? 0} Half Day',
                            leftImage: 'assets/c5.jpg',
                            color: AppColor.labourTitleColor,
                            background: AppColor.labourBackgroundColor,
                            titleColor: AppColor.labourTitleColor,
                            valueColor: AppColor.labourAmountColor,
                            subtitleColor: AppColor.labourSubtitleColor,
                            rightImage: 'assets/homec2.jpg',
                            showArrow: true,
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Dailypayout(),
                                ),
                              );
                            },
                            child: DashboardCardWidget(
                              title:'Labour Payout',
                              value:
                                  '₹ ${cards?.pendingLabourPayout?.amount?.toString() ?? '0'}',
                              subtitle: cards?.pendingLabourPayout?.subLabel ??
                                  '${cards?.pendingLabourPayout?.labourersCount ?? 0} Labourers',
                              leftImage: 'assets/c4.jpg',
                              color: AppColor.payoutTitleColor,
                              background: AppColor.payoutBackgroundColor,
                              titleColor: AppColor.payoutTitleColor,
                              valueColor: AppColor.payoutAmountColor,
                              subtitleColor: AppColor.payoutSubtitleColor,
                              rightImage: 'assets/homec3.jpg',
                              showArrow: true,
                            ),
                          ),
                        ],
                      ),
                    ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Sizes.screenHeight * 0.015),
              padding: EdgeInsets.all(Sizes.screenHeight * 0.010),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.stockTitleColor,
                    ),
                  ),
        
                  SizedBox(height: 12),
        
                  Row(
                    children: [
                      QuickActionWidget(
                        icon: Icons.inventory_2,
                        title: 'Add Production',
                        color:AppColor.stockUnitColor,
                        background: AppColor.lightredbg,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AddProduction(),
                            ),
                          );
                        },
                      ),
                      QuickActionWidget(
                        icon: Icons.shopping_cart,
                        title: 'Create Order',
                        color: AppColor.green,
                        background: AppColor.lightgreen,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Neworder(),
                            ),
                          );
                        },
                      ),
                      QuickActionWidget(
                        icon: Icons.groups,
                        title: 'Mark Attendance',
                        color: AppColor.darkyellow,
                        background: AppColor.lightyellow,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Dailyattendence()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: Sizes.screenHeight * 0.02),
          ],
        ),
      ),
    ),
    );
  }
}
