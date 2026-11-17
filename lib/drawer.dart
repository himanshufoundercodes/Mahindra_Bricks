import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/core/storage/login_sharedpreferences.dart';
import 'package:mahindra_bricks/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

import 'Loginpagenew.dart';
import 'addcementstock.dart';
import 'addproduct.dart';
import 'addproductdetails.dart';
import 'addvehicle.dart';
import 'brickscategory.dart';
import 'clients.dart';
import 'dailyattendence.dart';
import 'dailypayout.dart';

class MahindraDrawer extends StatefulWidget {
  final Function(int)? onMenuTap;
  final int selectedIndex;

  const MahindraDrawer({
    super.key,
    this.onMenuTap,
    this.selectedIndex = 0,
  });

  @override
  State<MahindraDrawer> createState() => _MahindraDrawerState();
}

class _MahindraDrawerState extends State<MahindraDrawer> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(
        context,
        listen: false,
      ).profileApi();
    });
  }


  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Stock', 'icon': Icons.inventory_2},
    {'title': 'Orders', 'icon': Icons.shopping_cart},
    {'title': 'Labour', 'icon': Icons.groups},
    {'title': 'Daily Attendance', 'icon': Icons.calendar_month},
    {'title': 'Labour Payout', 'icon': Icons.account_balance_wallet},
    {'title': 'Client List', 'icon': Icons.groups},
    {'title': 'Create Brick/Paver Categories', 'icon': Icons.account_tree},
    {'title': 'Add New Product', 'icon': Icons.add_shopping_cart},
    {'title': 'Add Vehicle', 'icon': Icons.local_shipping},
    {'title': 'Add Cement Stock', 'icon': Icons.warehouse},
    {'title': 'Reports', 'icon': Icons.bar_chart},
  ];

  @override
  Widget build(BuildContext context) {

    final profile = Provider.of<ProfileViewModel>(context);

    return Drawer(
      width: Sizes.screenWidth * 0.67,
      backgroundColor: AppColor.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Sizes.screenHeight * 0.006),
            Container(
              height: Sizes.screenWidth * 0.15,
              width: Sizes.screenWidth * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.stockUnitColor, width: 1.5),
              ),
              child: ClipOval(
                child: Image.asset('assets/logo.jpg', fit: BoxFit.contain),
              ),
            ),

            SizedBox(height: Sizes.screenHeight * 0.00375),
            Text(
              'MAHINDRA BRICKS',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColor.stockUnitColor,
              ),
            ),
            Text(
              'P A V E R   B L O C K S',
              style: GoogleFonts.poppins(
                fontSize: 8,
                letterSpacing: 1,
                color: AppColor.stockUnitColor,
              ),
            ),

            SizedBox(height: Sizes.screenHeight * 0.016),

            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.035,
              ),
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColor.lightredbg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: AppColor.lightredbg,
                    child: Icon(Icons.person, size: 30, color: AppColor.stockUnitColor),
                  ),
                  SizedBox(width: Sizes.screenWidth * 0.025),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.profileModel?.name ?? '...',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColor.stockUnitColor,
                          ),
                        ),
                        Text(
                          profile.profileModel?.email ?? "...",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: AppColor.gey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.015),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 14),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final String title = item['title']?.toString() ?? '';

                  int? targetIndex;
                  if (title == 'Home') {
                    targetIndex = 0;
                  } else if (title == 'Stock') {
                    targetIndex = 1;
                  } else if (title == 'Orders') {
                    targetIndex = 2;
                  } else if (title == 'Labour') {
                    targetIndex = 3;
                  } else if (title == 'Reports') {
                    targetIndex = 4;
                  }

                  final bool isSelected = targetIndex != null && targetIndex == widget.selectedIndex;

                  return Column(
                    children: [
                      if (index == 8 || index == 10)
                        Divider(
                          height: 15,
                          thickness: 0.7,
                          color: AppColor.grey,
                        ),

                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          Navigator.pop(context);

                          if (targetIndex != null) {
                            if (Navigator.canPop(context)) {
                              Navigator.popUntil(context, (route) => route.isFirst);
                            }
                            widget.onMenuTap?.call(targetIndex);
                          } else if (title == 'Create Brick/Paver Categories') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Brickscategory(),
                              ),
                            );
                          } else if (title == 'Add Vehicle') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addvehicle(),
                              ),
                            );
                          } else if (title == 'Add Cement Stock') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addcementstock(),
                              ),
                            );
                          } else if (title == 'Daily Attendance') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dailyattendence(),
                              ),
                            );
                          } else if (title == 'Labour Payout') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dailypayout(),
                              ),
                            );
                          } else if (title == 'Client List') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Clients(),
                              ),
                            );
                          } else if (title == 'Add New Product') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProductPage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: Sizes.screenWidth * 0.107,
                          padding: EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColor.lightredbg : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item['icon'] as IconData,
                                size: 22,
                                color: isSelected ? AppColor.stockUnitColor : AppColor.gey,
                              ),

                              SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                    color: isSelected ? AppColor.stockUnitColor : AppColor.black87,
                                  ),
                                ),
                              ),

                              Icon(
                                Icons.chevron_right,
                                size: 22,
                                color: isSelected ? AppColor.stockUnitColor : AppColor.gey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(14, 8, 14, 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  PreferenceService.clearSession();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Loginpagenew()));
                },
                child: Container(
                  height: Sizes.screenHeight * 0.054,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColor.lightredbg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 20, color: AppColor.stockUnitColor),
                      SizedBox(width: 12),
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.stockUnitColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
