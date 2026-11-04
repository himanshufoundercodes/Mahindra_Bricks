import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

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
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showDrawer: true,
        logoAsset: 'assets/logo.jpg',
      ),
      drawer: Drawer(
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: MahindraDrawer(),
      ),
      body: SingleChildScrollView(
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
                      ConstantText(text: 'STRONGER FOUNDATIONS',
                        color:AppColor.stockTitleColor,
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
                        width: 30,
                        child: Divider(
                          color: Color(0xFFB88A70),
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
                  GestureDetector(
                    child: DashboardCardWidget(
                      title: 'Total Stock',
                      value: '24,560',
                      unit: 'Pieces',
                      subtitle: '12 Products',
                      leftImage: 'assets/hc1.jpg',
                      titleColor:AppColor.stockTitleColor,
                      subtitleColor:AppColor.stockUnitColor,
                      color: AppColor.stockAmountColor,
                      unitColor:  AppColor.stockUnitColor,
                      background: AppColor.backgroundColor,
                      rightImage: 'assets/bricks.jpg',
                      showArrow: true,
                    ),
                  ),
        
                  DashboardCardWidget(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Clients(),
                        ),
                      );
                    },
                    title: "Today's Production",
                    value: '8,500',
                    unit: 'Pieces',
                    subtitle: '4 Products',
                    leftImage: 'assets/c2.jpg',
                    color: AppColor.productionAmountColor,
                    background: AppColor.productbackgroundColor,
                    titleColor:AppColor.productionTitleColor,
                    valueColor: AppColor.productionAmountColor,
                    unitColor:  AppColor.productionUnitColor,
                    subtitleColor: AppColor.productionProductsColor,
                    rightImage: 'assets/bricks2.jpg',
                  ),
        
                  DashboardCardWidget(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Clients(),
                        ),
                      );
                    },
                    title: 'Total Clients',
                    value: '48',
                    subtitle: '6 Pending Payments',
                    leftImage: 'assets/c3.jpg',
                    color: AppColor.clientsAmountColor,
                    background: AppColor.clientsBackgroundColor,
                    titleColor:AppColor.clientsTitleColor,
                    subtitleColor: AppColor.pendingPaymentsColor,
                    rightImage: 'assets/homec1.jpg',
                    showArrow: true,
                  ),
        
                  DashboardCardWidget(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Clients(),
                        ),
                      );
                    },
                    title: "Today's Dispatch",
                    value: '12,000',
                    unit: 'Pieces',
                    subtitle: '3 Trips',
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dailyattendence(),
                        ),
                      );
                    },
                    title: 'Labour Present',
                    value: '28 / 32',
                    subtitle: '2 Absent | 2 Half Day',
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
                      title: 'Labour Payout',
                      value: '₹ 42,600',
                      subtitle: '8 Labourers',
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
                        color: Color(0xFFB54A2C),
                        background: Color(0xFFFFEDE5),
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
                        color: Colors.green.shade700,
                        background: Color(0xFFE8F6EC),
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
                        color: Color(0xFFAA6100),
                        background: Color(0xFFFFF3DF),
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
    );
  }
}
