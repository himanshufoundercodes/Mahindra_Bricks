import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'addcementstock.dart';
import 'addvehicle.dart';
import 'brickscategory.dart';
import 'dailyattendence.dart';
import 'dailypayout.dart';

class MahindraDrawer extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onMenuTap;

  const MahindraDrawer({
    super.key,
    required this.selectedIndex,
    required this.onMenuTap,
  });

  @override
  State<MahindraDrawer> createState() => _MahindraDrawerState();
}

class _MahindraDrawerState extends State<MahindraDrawer> {

  final Color primaryColor = Color(0xFF8D301B);
  final Color backgroundColor = Color(0xFFFFFBF7);
  final Color selectedColor = Color(0xFFFAEEE8);

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Stock', 'icon': Icons.inventory_2},
    {'title': 'Orders', 'icon': Icons.shopping_cart},
    {'title': 'Labour', 'icon': Icons.groups},
    {'title': 'Daily Attendance', 'icon': Icons.calendar_month},
    {'title': 'Labour Payout', 'icon': Icons.account_balance_wallet},
    {'title': 'Client List', 'icon': Icons.groups},
    {'title': 'Create Brick/Paver Categories', 'icon': Icons.account_tree},
    {'title': 'Add Vehicle', 'icon': Icons.local_shipping},
    {'title': 'Add Cement Stock', 'icon': Icons.warehouse},
    {'title': 'Reports', 'icon': Icons.bar_chart},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Sizes.screenWidth * 0.67,
      backgroundColor: backgroundColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5),
            Container(
              height: Sizes.screenWidth * 0.15,
              width: Sizes.screenWidth * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFB88A70),
                  width: 1.5,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 3),
            Text(
              'MAHINDRA BRICKS',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Text(
              'P A V E R   B L O C K S',
              style: GoogleFonts.poppins(
                fontSize: 8,
                letterSpacing: 1,
                color: primaryColor,
              ),
            ),

            SizedBox(height: 13),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: Color(0xFFF3D9CD),
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vikash Singh',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'vikashsingh@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xFF625D59),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 14),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];

                  final bool isSelected;
                  if (item['title'] == 'Reports') {
                    isSelected = widget.selectedIndex == 4;
                  } else if (item['title'] == 'Home') {
                    isSelected = widget.selectedIndex == 0;
                  } else if (item['title'] == 'Stock') {
                    isSelected = widget.selectedIndex == 1;
                  } else if (item['title'] == 'Orders') {
                    isSelected = widget.selectedIndex == 2;
                  } else if (item['title'] == 'Labour') {
                    isSelected = widget.selectedIndex == 3;
                  } else {
                    isSelected = false;
                  }

                  return Column(
                    children: [
                      if (index == 8 || index == 10)
                        Divider(
                          height: 15,
                          thickness: 0.7,
                          color: Color(0xFFE5DAD3),
                        ),

                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          final index = menuItems.indexOf(item);

                          Navigator.pop(context);

                          if (item['title'] == 'Reports') {
                            widget.onMenuTap(4);
                            return;
                          }

                          widget.onMenuTap(index);

                          if (item['title'] == 'Home' ||
                              item['title'] == 'Stock' ||
                              item['title'] == 'Orders' ||
                              item['title'] == 'Labour') {
                            return;
                          } else if (item['title'] == 'Create Brick/Paver Categories') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Brickscategory(),
                              ),
                            );
                          } else if (item['title'] == 'Add Vehicle') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addvehicle(),
                              ),
                            );
                          } else if (item['title'] == 'Add Cement Stock') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addcementstock(),
                              ),
                            );
                          } else if (item['title'] == 'Daily Attendance') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dailyattendence(),
                              ),
                            );
                          } else if (item['title'] == 'Labour Payout') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dailypayout(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? selectedColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item['icon'] as IconData,
                                size: 22,
                                color: isSelected
                                    ? primaryColor
                                    : Color(0xFF484848),
                              ),

                              SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  item['title'] as String,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: isSelected
                                        ? primaryColor
                                        : Color(0xFF242424),
                                  ),
                                ),
                              ),

                              Icon(
                                Icons.chevron_right,
                                size: 22,
                                color: isSelected
                                    ? primaryColor
                                    : Color(0xFF666666),
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
                  Navigator.pop(context);
                },
                child: Container(
                  height: Sizes.screenHeight * 0.054,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: primaryColor,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
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
