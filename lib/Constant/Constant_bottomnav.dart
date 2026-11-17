import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/orders.dart';
import 'package:mahindra_bricks/report.dart';
import 'package:mahindra_bricks/stock.dart';
import 'package:provider/provider.dart';

import '../home_page_new.dart';
import '../labourmanagement.dart';
import '../viewmodel/dashboardview_model.dart';
import '../viewmodel/labour_viewmodel.dart';
import '../viewmodel/ordersListviewmodel.dart';
import '../viewmodel/reportsview_model.dart';
import '../viewmodel/stocklist_viewmodel.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int initialIndex;
  const CustomBottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<CustomBottomNavBar> createState() =>
      _CustomBottomNavBarState();
}

class _CustomBottomNavBarState
    extends State<CustomBottomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.inventory_2,
    Icons.shopping_cart_rounded,
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

  Future<bool> _onWillPop() async {
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
      _fetchApiForIndex(0);
      return false;
    }
    final shouldExit = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Exit App?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Are you sure you want to exit the app?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColor.gey,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.stockAmountColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child:  Text('Exit'),
            ),
          ],
        );
      },
    );

    if (shouldExit == true) {
      SystemNavigator.pop();
    }

    return false;
  }

  void _fetchApiForIndex(int index) {
    switch (index) {
      case 0:
        Provider.of<DashboardviewModel>(context, listen: false).DashBoardApi();
        break;
      case 1:
        Provider.of<StocklistViewmodel>(context, listen: false).stockListApi();
        break;
      case 2:
        Provider.of<OrdersListViewModel>(context, listen: false).OrdersApi();
        break;
      case 3:
        Provider.of<LabourListViewModel>(context, listen: false).LabourApi();
        break;
      case 4:
        Provider.of<ReportsviewModel>(context, listen: false).ReportsApi();
        break;
    }
  }

  void _onMenuTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    _fetchApiForIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            HomePageNew(
              onMenuTap: _onMenuTap,
              selectedIndex: selectedIndex,
            ),
            Stock(
              onMenuTap: _onMenuTap,
              selectedIndex: selectedIndex,
            ),
            Orders(
              onMenuTap: _onMenuTap,
              selectedIndex: selectedIndex,
            ),
            Labourmanagement(
              onMenuTap: _onMenuTap,
              selectedIndex: selectedIndex,
            ),
            Report(
              onMenuTap: _onMenuTap,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          bottom: true,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: List.generate(5, (index) {
                final isSelected = selectedIndex == index;

                return Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      _fetchApiForIndex(index);
                    },
                    child: AnimatedContainer(
                      duration: Duration(
                        milliseconds: 250,
                      ),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.backgroundColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[index],
                            size: 20,
                            color: isSelected
                                ? AppColor.stockAmountColor
                                : AppColor.gey,
                          ),
                          SizedBox(height: 4),
                          Text(
                            labels[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? AppColor.stockAmountColor
                                  : AppColor.gey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}