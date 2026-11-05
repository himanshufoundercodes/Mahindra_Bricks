import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/addclient.dart';
import 'package:mahindra_bricks/url_launcher.dart';
import 'package:mahindra_bricks/viewmodel/clientview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/ConstantClientcard.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'circularprogressindicator.dart';
import 'clientdetails.dart';

class Clients extends StatefulWidget {
   Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClientListViewModel>(
        context,
        listen: false,
      ).clintApi();
    });
  }


  int selectedIndex = 0;

  String client1Status = 'Active Client';
  Color client1Bg = AppColor.lightgreen;
  Color client1Text = AppColor.green;

  String client2Status = 'Active Client';
  Color client2Bg = AppColor.lightgreen;
  Color client2Text = AppColor.green;

  String client3Status = 'Pending Payment';
  Color client3Bg = AppColor.lightred;
  Color client3Text = AppColor.red;

  String client4Status = 'Active Client';
  Color client4Bg = AppColor.lightgreen;
  Color client4Text = AppColor.green;

  String client5Status = 'Pending Payment';
  Color client5Bg = AppColor.lightred;
  Color client5Text = AppColor.red;

  @override
  Widget build(BuildContext context) {
    final Clintlist = Provider.of<ClientListViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar:  ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: RefreshIndicator(
        color: AppColor.stockAmountColor,
        backgroundColor: Colors.white,
        displacement: 50,

        onRefresh: () async {
          await Provider.of<ClientListViewModel>(
            context,
            listen: false,
          ).clintApi();
        },
        child: SingleChildScrollView(
          child: Column(
             children: [
               _buildHeader(),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Container(
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     color: AppColor.white,
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Column(
                     children: [
                       Container(
                         height: Sizes.screenHeight * 0.044,
                         padding: EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(
                           color: AppColor.searchbarbackcolor,
                           borderRadius: BorderRadius.circular(8),
                           border: Border.all(
                             color: AppColor.grey,
                           ),
                         ),
                         child: Row(
                           children: [
                             Icon(
                               Icons.search,
                               size: 18,
                               color: AppColor.gey,
                             ),
                             SizedBox(width: Sizes.screenWidth * 0.02),
                             Expanded(
                               child: Text(
                                 'Search by client name or mobile number...',
                                 style: GoogleFonts.poppins(
                                   fontSize: 11,
                                   color: AppColor.gey,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),

                       SizedBox(height: Sizes.screenHeight * 0.012),

                       Row(
                         children: [
                           Expanded(
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                   selectedIndex = 0;
                                 });
                               },
                               child: Container(
                                 height: Sizes.screenHeight * 0.035,
                                 decoration: BoxDecoration(
                                   color: selectedIndex == 0
                                       ? AppColor.stockUnitColor
                                       : AppColor.white,
                                   borderRadius: BorderRadius.circular(7),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(
                                       Icons.people,
                                       size: 13,
                                       color: selectedIndex == 0
                                           ? AppColor.white
                                           : AppColor.black87,
                                     ),
                                     SizedBox(width: Sizes.screenWidth * 0.01),
                                     Text(
                                       'All Clients',
                                       style: GoogleFonts.poppins(
                                         fontSize: 9,
                                         color: selectedIndex == 0
                                             ? AppColor.white
                                             : AppColor.gey,
                                         fontWeight: FontWeight.w600,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),

                           SizedBox(width: Sizes.screenWidth * 0.0125),

                           Expanded(
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                   selectedIndex = 1;
                                 });
                               },
                               child: Container(
                                 height: Sizes.screenHeight * 0.035,
                                 decoration: BoxDecoration(
                                   color: selectedIndex == 1
                                       ? AppColor.stockUnitColor
                                       : AppColor.white,
                                   borderRadius: BorderRadius.circular(7),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(
                                       Icons.circle,
                                       size: 6,
                                       color: selectedIndex == 1
                                           ? AppColor.white
                                           : AppColor.green,
                                     ),
                                     SizedBox(width: Sizes.screenWidth * 0.01),
                                     Text(
                                       'Active',
                                       style: GoogleFonts.poppins(
                                         fontSize: 9,
                                         color: selectedIndex == 1
                                             ? AppColor.white
                                             : AppColor.black87,
                                         fontWeight: selectedIndex == 1
                                             ? FontWeight.w600
                                             : FontWeight.normal,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),

                           SizedBox(width: Sizes.screenWidth * 0.0125),

                           Expanded(
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                   selectedIndex = 2;
                                 });
                               },
                               child: Container(
                                 height: Sizes.screenHeight * 0.035,
                                 decoration: BoxDecoration(
                                   color: selectedIndex == 2
                                       ? AppColor.stockUnitColor
                                       : AppColor.white,
                                   borderRadius: BorderRadius.circular(7),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(
                                       Icons.circle,
                                       size: 6,
                                       color: selectedIndex == 2
                                           ? AppColor.white
                                           : AppColor.red,
                                     ),
                                     SizedBox(width: Sizes.screenWidth * 0.01),
                                     Flexible(
                                       child: Text(
                                         'Pending Balance',
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                         style: GoogleFonts.poppins(
                                           fontSize: 8,
                                           color: selectedIndex == 2
                                               ? AppColor.white
                                               : AppColor.black87,
                                           fontWeight: selectedIndex == 2
                                               ? FontWeight.w600
                                               : FontWeight.normal,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),

                           SizedBox(width: Sizes.screenWidth * 0.0125),

                           Expanded(
                             child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                   selectedIndex = 3;
                                 });
                               },
                               child: Container(
                                 height: Sizes.screenHeight * 0.035,
                                 decoration: BoxDecoration(
                                   color: selectedIndex == 3
                                       ? AppColor.stockUnitColor
                                       : AppColor.white,
                                   borderRadius: BorderRadius.circular(7),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(
                                       Icons.circle,
                                       size: 6,
                                       color: selectedIndex == 3
                                           ? AppColor.white
                                           : AppColor.grey,
                                     ),
                                     SizedBox(width: Sizes.screenWidth * 0.01),
                                     Text(
                                       'Inactive',
                                       style: GoogleFonts.poppins(
                                         fontSize: 9,
                                         color: selectedIndex == 3
                                             ? AppColor.white
                                             : AppColor.black87,
                                         fontWeight: selectedIndex == 3
                                             ? FontWeight.w600
                                             : FontWeight.normal,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: Sizes.screenHeight * 0.006),
               Column(
                 children: [
                   SizedBox(height: 15),

                   if (Clintlist.loading)
                     Center(
                       child: Circularprogressindicator(),
                     )

                   else if (Clintlist.errorMessage != null)
                     Center(
                       child: Column(
                         children: [
                           Text(Clintlist.errorMessage!),

                           CustomButton(
                             text: 'Retry',
                             onPressed: Clintlist.clintApi,
                           ),
                         ],
                       ),
                     )

                   else if (Clintlist.clientList.isEmpty)
                       Center(
                         child: Text('No Clients Found'),
                       )

                     else
                       ListView.builder(
                         itemCount: Clintlist.clientList.length,
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context, index) {
                           final client = Clintlist.clientList[index];
                           return ClientCard(
                             companyName: client.company_name?.toString() ?? '',
                             mobileNumber: client.mobile?.toString() ?? '',
                             location: client.city?.toString() ?? '',
                             totalOrders: client.total_orders?.toString() ?? '',
                             totalPurchase: client.total_purchase_qty?.toString() ?? '',
                             pendingBalance: client.pending_balance?.toString() ?? '',
                             pendingBalanceColor: AppColor.red,
                             statusText: client.client_status_badge?.toString() ?? '',
                             statusBgColor: AppColor.lightgreen,
                             statusTextColor: AppColor.green,

                             onCall: () {
                               CustomLauncher.call(client.mobile?.toString() ?? '');
                             },

                             onArrowTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Clientdetails(),
                                 ),
                               );
                             },

                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Clientdetails(),
                                 ),
                               );
                             },
                           );
                         },
                       )
                 ],
               ),
               SizedBox(height: Sizes.screenHeight * 0.025),
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
                  'Clients',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Manage your cusromers',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
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
              text: 'Add Client',
              fontSize:  12,
              fontWeight: .w500,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addclient()),
                );
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
