import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewmodel/ordersListviewmodel.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Customeordercard.dart';
import 'circularprogressindicator.dart';
import 'drawer.dart';
import 'neworder.dart';
import 'viewproductdetails.dart';

class Orders extends StatefulWidget {
  final Function(int)? onMenuTap;
  final int selectedIndex;

  const Orders({
    super.key,
    this.onMenuTap,
    this.selectedIndex = 2,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedOrderTab = 0;

  String _getStatusParam(int index) {
    if (index == 1) return 'pending';
    if (index == 2) return 'completed';
    return 'all';
  }

  List<String> _getDynamicOrderTabs(OrdersListViewModel orderList) {
    if (orderList.ordersListModel == null && orderList.allOrders.isEmpty) {
      return [
        'All Orders',
        'Pending',
        'Completed',
      ];
    }

    return [
      'All Orders (${orderList.allCount})',
      'Pending (${orderList.pendingCount})',
      'Completed (${orderList.completedCount})',
    ];
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrdersListViewModel>(
        context,
        listen: false,
      ).OrdersApi(status: _getStatusParam(selectedOrderTab));
    });
  }

  @override
  Widget build(BuildContext context) {
    final OrderList = Provider.of<OrdersListViewModel>(context);
    final orderTabs = _getDynamicOrderTabs(OrderList);
    final displayedOrders = OrderList.filteredOrders.where((order) {
      if (selectedOrderTab == 1) {
        return order.order_status.toLowerCase().trim() == 'pending';
      } else if (selectedOrderTab == 2) {
        return order.order_status.toLowerCase().trim() == 'completed';
      }

      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar:  const ConstantAppBar(
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
          await Provider.of<OrdersListViewModel>(
            context,
            listen: false,
          ).OrdersApi(status: _getStatusParam(selectedOrderTab));
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildHeader(),
            SizedBox(height: Sizes.screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(orderTabs.length, (index) {
                final bool isSelected = selectedOrderTab == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOrderTab = index;
                    });
                    Provider.of<OrdersListViewModel>(
                      context,
                      listen: false,
                    ).OrdersApi(status: _getStatusParam(index));
                  },
                  child: Container(
                    // margin: EdgeInsets.only(right: Sizes.screenWidth * 0.021),
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.screenWidth * 0.045,
                      vertical: Sizes.screenHeight * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColor.stockTitleColor
                          : AppColor.bglighttext,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      orderTabs[index],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : AppColor.gey,
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: Sizes.screenHeight * 0.015),

            Column(
              children: [
                SizedBox(height: 15),

                if (OrderList.loading)
                  Center(
                    child: Circularprogressindicator(),
                  )

                else if (OrderList.errorMessage != null)
                  Center(
                    child: Column(
                      children: [
                        Text(OrderList.errorMessage!),

                        CustomButton(
                          text: 'Retry',
                          onPressed: () {
                            OrderList.OrdersApi(
                              status: _getStatusParam(selectedOrderTab),
                            );
                          },
                        ),
                      ],
                    ),
                  )

                else if (OrderList.ordersListModel == null || displayedOrders.isEmpty)
                    Center(
                      child: Text('No Orders Found'),
                    )

                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics:  ClampingScrollPhysics(),
                      itemCount: displayedOrders.length,
                      itemBuilder: (BuildContext context, int index) {
                        final order = displayedOrders[index];
                        final String displayDateTime =
                            (order.created_at.isNotEmpty &&
                                    order.created_at.toLowerCase() != 'null')
                                ? order.created_at
                                : order.order_date;
                        return CustomOrderCard(
                          orderData: order,
                          orderId: order.order_number,
                          dateTime: displayDateTime,
                          image: 'assets/bricks.jpg',
                          productName: order.primary_item?.product_name ?? 'Unknown',
                          quantity: '${order.total_pieces} Pieces',
                          customer: order.client_name,
                          price: order.total_amount,
                          orderStatus: order.order_status,
                          dispatchStatus: order.dispatch_status.replaceAll(RegExp(r'dispatch(ed)?', caseSensitive: false), 'Completed'),
                          backgroundColor: AppColor.tilesColor,
                          onViewDetails: () async {
                            final ordersVM = Provider.of<OrdersListViewModel>(
                              context,
                              listen: false,
                            );
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Viewproductdetails(orderData: order),
                              ),
                            );
                            if (mounted) {
                              ordersVM.OrdersApi(status: _getStatusParam(selectedOrderTab));
                            }
                          },
                          onTap: () {},
                        );
                      },
                    ),
              ],
            ),
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
                  'Orders',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Manage your order and Completed',
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
              text: 'New Order',
              fontSize:  12,
              fontWeight: .w500,
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Neworder(),
                  ),
                );
                if (mounted) {
                  Provider.of<OrdersListViewModel>(
                    context,
                    listen: false,
                  ).OrdersApi(status: _getStatusParam(selectedOrderTab));
                }
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
}
