import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewmodel/ordersListviewmodel.dart';
import 'package:mahindra_bricks/viewproductdetails.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Customeordercard.dart';
import 'circularprogressindicator.dart';

class Orders extends StatefulWidget {
  Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedOrderTab = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrdersListViewModel>(
        context,
        listen: false,
      ).OrdersApi();
    });
  }


  // final List<Map<String, dynamic>> productList = [
  //   {
  //     'orderId': 'ORD-0018',
  //     'dateTime': '17 Oct 2026, 04:30 PM',
  //     'image': 'assets/bricks.jpg',
  //     'productName': 'Red Bricks (Standard)',
  //     'quantity': '5000 Pieces',
  //     'customer': 'Sharma Construction',
  //     'price': '25,000',
  //     'orderStatus': 'Pending',
  //     'dispatchStatus': 'Not Dispatched',
  //   },
  //   {
  //     'orderId': 'ORD-0017',
  //     'dateTime': '18 Oct 2026, 10:00 AM',
  //     'image': 'assets/bricks2.jpg',
  //     'productName': 'Paver Blocks(Grey)',
  //     'quantity': '3000 Pieces',
  //     'customer': 'Green Build Pvt.Ltd.',
  //     'price': '18,000',
  //     'orderStatus': 'Dispatched',
  //     'dispatchStatus': 'Dispatched on 16 Oct',
  //     'statusColor': AppColor.statusColor,
  //     'statusTextColor': AppColor.statustextColor,
  //   },
  //   {
  //     'orderId': 'ORD-0016',
  //     'dateTime': '16 Oct 2026, 02:15 PM',
  //     'image': 'assets/bricls3.jpg',
  //     'productName': 'Paver Blocks(Red)',
  //     'quantity': '2000 Pieces',
  //     'customer': 'Buildwell Developers',
  //     'price': '12,000',
  //     'orderStatus': 'Processing',
  //     'dispatchStatus': 'In Processing',
  //   },
  //   {
  //     'orderId': 'ORD-0019',
  //     'dateTime': '18 Oct 2026, 10:00 AM',
  //     'image': 'assets/bricks4.jpg',
  //     'productName': 'Paver Blocks',
  //     'quantity': '2000 Pieces',
  //     'customer': 'Gupta Builders',
  //     'price': '18,500',
  //     'orderStatus': 'Processing',
  //     'dispatchStatus': 'Not Dispatched',
  //     'statusColor': AppColor.dispatcheColor,
  //     'statusTextColor': AppColor.dispatchetextColor,
  //   },
  // ];

  final List<String> orderTabs = [
    'All Orders (18)',
    'Pending (6)',
    'Dispatched (7)',
  ];

  @override
  Widget build(BuildContext context) {
    final OrderList = Provider.of<OrdersListViewModel>(context);
    return Scaffold(

      backgroundColor: AppColor.bodybackgroundColor,
      appBar:  ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: RefreshIndicator(
        color: AppColor.stockAmountColor,
        backgroundColor: Colors.white,
        displacement: 50,

        onRefresh: () async {
          await Provider.of<OrdersListViewModel>(
            context,
            listen: false,
          ).OrdersApi();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildHeader(),
            SizedBox(height: Sizes.screenHeight * 0.015,),
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
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: Sizes.screenWidth * 0.021,),
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.screenWidth * 0.045,
                      vertical: Sizes.screenHeight * 0.012,
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
                          onPressed: OrderList.OrdersApi,
                        ),
                      ],
                    ),
                  )

                else if (OrderList.ordersListModel == null || OrderList.ordersListModel!.data.isEmpty)
                    Center(
                      child: Text('No Orders Found'),
                    )

                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics:  ClampingScrollPhysics(),
                      itemCount: OrderList.ordersListModel!.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final order = OrderList.ordersListModel!.data[index];
                        return CustomOrderCard(
                          orderId: order.order_number,
                          dateTime: order.order_date,
                          image: 'assets/bricks.jpg',
                          productName: order.primary_item?.product_name ?? 'Unknown',
                          quantity: '${order.total_pieces} Pieces',
                          customer: order.client_name,
                          price: order.total_amount,
                          orderStatus: order.order_status,
                          dispatchStatus: order.dispatch_status,
                          backgroundColor: AppColor.tilesColor,
                          onTap: () {

                          },
                        );
                      },
                    ),
                    // ListView.builder(
                    //   itemCount: Clintlist.clientList.length,
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemBuilder: (context, index) {
                    //     final client = Clintlist.clientList[index];
                    //     return ClientCard(
                    //       companyName: client.company_name?.toString() ?? '',
                    //       mobileNumber: client.mobile?.toString() ?? '',
                    //       location: client.city?.toString() ?? '',
                    //       totalOrders: client.total_orders?.toString() ?? '',
                    //       totalPurchase: client.total_purchase_qty?.toString() ?? '',
                    //       pendingBalance: client.pending_balance?.toString() ?? '',
                    //       pendingBalanceColor: AppColor.red,
                    //       statusText: client.client_status_badge?.toString() ?? '',
                    //       statusBgColor: AppColor.lightgreen,
                    //       statusTextColor: AppColor.green,
                    //
                    //       onCall: () {
                    //         CustomLauncher.call(client.mobile?.toString() ?? '');
                    //       },
                    //
                    //       onArrowTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => Clientdetails(),
                    //           ),
                    //         );
                    //       },
                    //
                    //       onTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => Clientdetails(),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    // )
              ],
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const ClampingScrollPhysics(),
            //   itemCount: productList.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return CustomOrderCard(
            //       orderId: productList[index]['orderId'],
            //       dateTime: productList[index]['dateTime'],
            //       image: productList[index]['image'],
            //       productName: productList[index]['productName'],
            //       quantity: productList[index]['quantity'],
            //       customer: productList[index]['customer'],
            //       price: productList[index]['price'],
            //       orderStatus: productList[index]['orderStatus'],
            //       dispatchStatus: productList[index]['dispatchStatus'],
            //       backgroundColor: AppColor.tilesColor,
            //       onTap: () {
            //
            //       },
            //     );
            //   },
            // ),

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
                  'Manage your order and Dispatch',
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
              onPressed: () {
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
