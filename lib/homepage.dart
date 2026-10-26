
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/constantText.dart';
import 'package:mahindra_bricks/Constant_Color.dart';
import 'package:mahindra_bricks/report.dart';

import 'Constant/Constantcustomecalender.dart';
import 'addproduction.dart';
import 'dailyattendence.dart';
import 'drawer.dart';
import 'labourmanagement.dart';
import 'orders.dart';
import 'stock.dart';
import 'neworder.dart';
import 'Constant/DashboardCardWidget.dart';
import 'Constant/QuickActionWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();
  final Color primaryColor = Color(0xFF631006);
  final Color pageColor = Color(0xFFFFF8F3);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: pageColor,
        drawer: MahindraDrawer(
          selectedIndex: selectedIndex,
          onMenuTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: topPadding),

                _buildHeader(),
                Expanded(
                  child: _buildSelectedPage(),
                ),
              ],
            ),
          ],
        ),

        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon:  Icon(
                Icons.menu,
                color: Color(0xFF782A17),
                size: 28,
              ),
              padding: EdgeInsets.zero,
              constraints:  BoxConstraints(
                minWidth: 28,
                minHeight: 40,
              ),
            ),
          ),


          SizedBox(width: 10),

          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFB88A70),
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),


          SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MAHINDRA BRICKS',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Text(
                  'PAVER BLOCKS',
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    letterSpacing: 2,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSelectedPage() {
    switch (selectedIndex) {
      case 0:
        return _buildHomeContent();

      case 1:
        return Stock();

      case 2:
        return Orders();
      case 3:
        return Labourmanagement();
      case 4:
        return Report();

      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child:  Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Sizes.screenHeight * 0.39,
            child: Image.asset(
              'assets/homebg.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
             Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 105,
                  right: 12,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ConstantText(text: 'STRONGER FOUNDATIONS',
                      color:primaryColor,
                        fontSize: 10,
                      ),
                      Text(
                        'FOR A BETTER TOMORROW',
                        style: GoogleFonts.poppins(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
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

              SizedBox(height: 175),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFDFC),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning,',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Mahindra Bricks',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            'Manage your factory operations efficiently',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 5),


                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: pageColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 4),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                [
                                  'Monday',
                                  'Tuesday',
                                  'Wednesday',
                                  'Thursday',
                                  'Friday',
                                  'Saturday',
                                  'Sunday',
                                ][selectedDate.weekday - 1],
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${selectedDate.day} ${[
                                  'Jan', 'Feb', 'Mar', 'Apr',
                                  'May', 'Jun', 'Jul', 'Aug',
                                  'Sep', 'Oct', 'Nov', 'Dec'
                                ][selectedDate.month - 1]} ${selectedDate.year}',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    child: CustomCalendar(
                                      selectedDate: selectedDate,
                                      onDateSelected: (date) {
                                        setState(() {
                                          selectedDate = date;
                                        });

                                        Navigator.pop(dialogContext);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                      ),
                    ),

                    DashboardCardWidget(
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
                      title: 'Total Clients',
                      value: '48',
                      subtitle: '6 Pending Payments',
                      leftImage: 'assets/c3.jpg',
                      color: AppColor.clientsAmountColor,
                      background: AppColor.clientsBackgroundColor,
                      titleColor:AppColor.clientsTitleColor,
                      subtitleColor: AppColor.pendingPaymentsColor,
                      rightImage: 'assets/homec1.jpg',
                    ),

                    DashboardCardWidget(
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
                    ),

                    DashboardCardWidget(
                      title: 'Pending Labour Payout',
                      value: '₹ 42,600',
                      subtitle: '8 Labourers',
                      leftImage: 'assets/c4.jpg',
                      color: AppColor.payoutTitleColor,
                      background: AppColor.payoutBackgroundColor,
                      titleColor: AppColor.payoutTitleColor,
                      valueColor: AppColor.payoutAmountColor,
                      subtitleColor: AppColor.payoutSubtitleColor,
                      rightImage: 'assets/homec3.jpg',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(12),
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
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

              SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildPlaceholderPage(
      String title,
      IconData icon,
      ) {
    return Container(
      color: pageColor,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: primaryColor,
            ),
            SizedBox(height: 10),
            Text(
              '$title Page',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final List<IconData> icons = [
      Icons.home,
      Icons.inventory_2,
      Icons.shopping_cart,
      Icons.groups,
      Icons.bar_chart,
    ];

    final List<String> labels = [
      'Home',
      'Stock',
      'Orders',
      'Labour',
      'Reports',
    ];

    return Container(
      height: Sizes.screenHeight * 0.082,
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFFCF8),
        border: Border(
          top: BorderSide(
            color: Color(0xFFF0E7DF),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final bool isSelected = selectedIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color(0xFFFBE8DC)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      size: 19,
                      color: isSelected
                          ? primaryColor
                          : Color(0xFF858078),
                    ),
                    SizedBox(height: 2),
                    Text(
                      labels[index],
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: isSelected
                            ? primaryColor
                            : Color(0xFF77716D),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
