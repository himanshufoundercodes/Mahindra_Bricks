import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant_Color.dart';

import 'Constant/ConstantClientcard.dart';
import 'Constant/Constantheader.dart';
import 'clientdetails.dart';

class Clients extends StatefulWidget {
   Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {

  int selectedIndex = 0;

  String client1Status = 'Active Client';
  Color client1Bg = Color(0xFFE6F4E7);
  Color client1Text = Color(0xFF287A38);

  String client2Status = 'Active Client';
  Color client2Bg = Color(0xFFE6F4E7);
  Color client2Text = Color(0xFF287A38);

  String client3Status = 'Pending Payment';
  Color client3Bg = Color(0xFFFFEBEE);
  Color client3Text = Color(0xFFC62828);

  String client4Status = 'Active Client';
  Color client4Bg = Color(0xFFE6F4E7);
  Color client4Text = Color(0xFF287A38);

  String client5Status = 'Pending Payment';
  Color client5Bg = Color(0xFFFFEBEE);
  Color client5Text = Color(0xFFC62828);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F3),
      body: SingleChildScrollView(
        child: Column(
           children: [
             SizedBox(height: 30),
            CustomHeader(),
             SizedBox(height: 10),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 12),
               child: Row(
                 children: [
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Text(
                           'Clients',
                           style: GoogleFonts.poppins(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: AppColor.stockTitleColor,
                           ),
                         ),
                         Text(
                           'Manage your Customers',
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                           style: GoogleFonts.poppins(
                             fontSize: 10,
                             fontWeight: FontWeight.w500,
                             color: Color(0xFF66615D),
                           ),
                         ),
                       ],
                     ),
                   ),
        
                   SizedBox(width: 8),
                   ElevatedButton(
                     onPressed: () {
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: AppColor.stockTitleColor,
                       foregroundColor: Colors.white,
                       elevation: 0,
                       padding: EdgeInsets.symmetric(
                         horizontal: 9,
                         vertical: 9,
                       ),
                       minimumSize: Size.zero,
                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(7),
                       ),
                     ),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(Icons.add, size: 15),
                         SizedBox(width: 3),
                         Text(
                           'Add Client',
                           style: GoogleFonts.poppins(
                             fontSize: 12,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 13),
        
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 10),
               child: Container(
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: Column(
                   children: [
                     Container(
                       height: Sizes.screenHeight * 0.044,
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       decoration: BoxDecoration(
                         color: Color(0xFFF8F8F8),
                         borderRadius: BorderRadius.circular(8),
                         border: Border.all(
                           color: Color(0xFFE8E8E8),
                         ),
                       ),
                       child: Row(
                         children: [
                           Icon(
                             Icons.search,
                             size: 18,
                             color: Colors.grey,
                           ),
                           SizedBox(width: 8),
                           Expanded(
                             child: Text(
                               'Search by client name or mobile number...',
                               style: GoogleFonts.poppins(
                                 fontSize: 11,
                                 color: Colors.grey,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
        
                     SizedBox(height: 10),
        
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
                                     ? Color(0xFF963025)
                                     : Color(0xFFF7F0EA),
                                 borderRadius: BorderRadius.circular(7),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(
                                     Icons.people,
                                     size: 13,
                                     color: selectedIndex == 0
                                         ? Colors.white
                                         : Colors.black87,
                                   ),
                                   SizedBox(width: 4),
                                   Text(
                                     'All Clients',
                                     style: GoogleFonts.poppins(
                                       fontSize: 9,
                                       color: selectedIndex == 0
                                           ? Colors.white
                                           : Colors.black87,
                                       fontWeight: FontWeight.w600,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
        
                         SizedBox(width: 5),
        
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
                                     ? Color(0xFF963025)
                                     : Color(0xFFF7F0EA),
                                 borderRadius: BorderRadius.circular(7),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(
                                     Icons.circle,
                                     size: 6,
                                     color: selectedIndex == 1
                                         ? Colors.white
                                         : Colors.green,
                                   ),
                                   SizedBox(width: 4),
                                   Text(
                                     'Active',
                                     style: GoogleFonts.poppins(
                                       fontSize: 9,
                                       color: selectedIndex == 1
                                           ? Colors.white
                                           : Colors.black87,
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
        
                         SizedBox(width: 5),
        
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
                                     ? Color(0xFF963025)
                                     : Color(0xFFF7F0EA),
                                 borderRadius: BorderRadius.circular(7),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(
                                     Icons.circle,
                                     size: 6,
                                     color: selectedIndex == 2
                                         ? Colors.white
                                         : Colors.red,
                                   ),
                                   SizedBox(width: 4),
                                   Flexible(
                                     child: Text(
                                       'Pending Balance',
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                       style: GoogleFonts.poppins(
                                         fontSize: 8,
                                         color: selectedIndex == 2
                                             ? Colors.white
                                             : Colors.black87,
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
        
                         SizedBox(width: 5),
        
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
                                     ? Color(0xFF963025)
                                     : Color(0xFFF7F0EA),
                                 borderRadius: BorderRadius.circular(7),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(
                                     Icons.circle,
                                     size: 6,
                                     color: selectedIndex == 3
                                         ? Colors.white
                                         : Colors.grey,
                                   ),
                                   SizedBox(width: 4),
                                   Text(
                                     'Inactive',
                                     style: GoogleFonts.poppins(
                                       fontSize: 9,
                                       color: selectedIndex == 3
                                           ? Colors.white
                                           : Colors.black87,
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
             SizedBox(height: 5),
             ClientCard(
               companyName: 'ROYAL BROTHERS GROUP OF COMPANY',
               mobileNumber: '9685538768',
               location: 'kolgarh',
               totalOrders: '12',
               totalPurchase: '36,000 pcs',
               pendingBalance: '20,000',
               pendingBalanceColor: Colors.red,
               statusText: client1Status,
               statusBgColor: client1Bg,
               statusTextColor: client1Text,
               onCall: () {
                 setState(() {

                 });
               },
               onArrowTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
             ),
             ClientCard(
               companyName: 'Shree Construction',
               mobileNumber: '9876543210',
               location: 'Bhopal',
               totalOrders: '8',
               totalPurchase: '24,000 pcs',
               pendingBalance: '0',
               pendingBalanceColor: Colors.black,
               statusText: client2Status,
               statusBgColor: client2Bg,
               statusTextColor: client2Text,
               onCall: () {
                 setState(() {
                   client2Status = 'Calling...';
                   client2Bg = Color(0xFFE3F2FD);
                   client2Text = Color(0xFF1565C0);
                 });
               },
               onArrowTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
             ),
             ClientCard(
               companyName: 'Patel Construction',
               mobileNumber: '9822334455',
               location: 'Jabalpur',
               totalOrders: '10',
               totalPurchase: '28,000 pcs',
               pendingBalance: '0',
               pendingBalanceColor: Colors.black,
               statusText: client3Status,
               statusBgColor: client3Bg,
               statusTextColor: client3Text,
               onCall: () {
                 setState(() {
                 });
               },
               onArrowTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
             ),
             ClientCard(
               companyName: 'Singh Traders',
               mobileNumber: '9300445566',
               location: 'Gwalior',
               totalOrders: '3',
               totalPurchase: '9,000 pcs',
               pendingBalance: '5,000',
               pendingBalanceColor: Colors.red,
               statusText: client4Status,
               statusBgColor: client4Bg,
               statusTextColor: client4Text,
               onCall: () {
                 setState(() {

                 });
               },
               onArrowTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
             ),
             ClientCard(
               companyName: 'Mehta Infrastructure',
               mobileNumber: '9899001122',
               location: 'Rewa',
               totalOrders: '6',
               totalPurchase: '18,000 pcs',
               pendingBalance: '8750',
               pendingBalanceColor: Colors.red,
               statusText: client5Status,
               statusBgColor: client5Bg,
               statusTextColor: client5Text,
               onCall: () {
                 setState(() {
                 });
               },
               onArrowTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Clientdetails()),
                 );
               },
             ),

             SizedBox(height: 20),
           ],
        ),
      ),
    );
  }
}
