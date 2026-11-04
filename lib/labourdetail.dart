import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constant_attendence_card.dart';
import 'Constant/Constantheader.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';

class Labourdetail extends StatefulWidget {
  Labourdetail({super.key});

  @override
  State<Labourdetail> createState() => _LabourdetailState();
}

class _LabourdetailState extends State<Labourdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar:  ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: Column(
        children: [
          _buildHeader(),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.grey),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.027,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF3F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: Sizes.screenHeight * 0.030,
                        width: Sizes.screenWidth * 0.08,
                        decoration: BoxDecoration(
                          color: AppColor.lightredbg,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColor.stockUnitColor,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          'Labour Information',
                          style: GoogleFonts.poppins(
                            color: AppColor.stockAmountColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomButton(
                        text: "Edit",
                        onPressed: () {
                        },
                        type: CustomButtonType.outlined,
                        width: Sizes.screenWidth * 0.15,
                        height: Sizes.screenHeight * 0.032,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        icon: Icons.edit,
                        iconSize: 12,
                        iconOnLeft: true,
                        backgroundColor: AppColor.lightredbg,
                        textColor:AppColor.stockUnitColor,
                        borderColor: AppColor.stockUnitColor,
                        borderRadius: 9,
                        padding:  EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.021,
                          vertical: Sizes.screenHeight * 0.005,
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColor.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Labour ID',
                          style: GoogleFonts.poppins(
                            color: AppColor.gey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        'LAB-001',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Labour Name',
                          style: TextStyle(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        'Rajesh Kumar',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.006,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color:AppColor.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Mobile Number',
                          style: GoogleFonts.poppins(
                            color: AppColor.gey,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Text(
                          '9876543210',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomButton(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.011,
                          vertical: Sizes.screenHeight * 0.005),
                        height: Sizes.screenHeight * 0.038,
                        width: Sizes.screenWidth * 0.175,
                        text: 'Call',
                        backgroundColor: AppColor.green,
                        fontSize:  12,
                        fontWeight: .w500,
                        onPressed: () {
                        },
                        iconOnLeft: true,
                        icon: Icons.call,
                        iconSize: 18,
                        iconSpacing: 2,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Daily Rate (₹)',
                          style: GoogleFonts.poppins(
                            color: AppColor.gey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '600',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.021),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Sizes.screenHeight * 0.012),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.027,
                          vertical: Sizes.screenHeight * 0.007,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.lightred,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppColor.stockUnitColor,
                              size: 22,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Attendance Summary',
                                style: GoogleFonts.poppins(
                                  color: AppColor.stockAmountColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.012),
                      Row(
                        children: [
                          CustomAttendanceCard(
                            icon: Icons.check_circle,
                            backgroundColor: AppColor.lightgreen,
                            iconBackgroundColor: AppColor.iconbggreen,
                            iconColor: AppColor.green,
                            valueColor: AppColor.green,
                            textColor: AppColor.gey,
                            value: '18',
                            text: 'Present Days',
                            width: Sizes.screenWidth * 0.29,
                            height: Sizes.screenHeight * 0.065,
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.016),
                          CustomAttendanceCard(
                            icon: Icons.timelapse,
                            backgroundColor: AppColor.lightyellow,
                            iconBackgroundColor: AppColor.lightmediumyellow,
                            iconColor: AppColor.darkyellow,
                            valueColor: AppColor.stockAmountColor,
                            textColor: AppColor.gey,
                            value: '3',
                            text: 'Half Days',
                            width: Sizes.screenWidth * 0.29,
                            height: Sizes.screenHeight * 0.065,
                          ),

                          SizedBox(width: Sizes.screenWidth * 0.016),

                          CustomAttendanceCard(
                            icon: Icons.close,
                            backgroundColor: AppColor.lightred,
                            iconBackgroundColor: AppColor.lightredbg,
                            iconColor: AppColor.stockUnitColor,
                            valueColor: AppColor.stockUnitColor,
                            textColor: AppColor.gey,
                            value: '2',
                            text: 'Absent Days',
                            width: Sizes.screenWidth * 0.29,
                            height: Sizes.screenHeight * 0.065,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF1E7E2)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.027,
                          vertical: Sizes.screenHeight * 0.007,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.lightred,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Color(0xFF922216),
                              size: 22,
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.027),
                            Text(
                              'Overtime Summary',
                              style: TextStyle(
                                color: Color(0xFF922216),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.012),
                       Row(
                        children: [
                          CustomAttendanceCard(
                            icon: Icons.check_circle,
                            backgroundColor: AppColor.blueverylight,
                            iconBackgroundColor: AppColor.bluelight,
                            iconColor: AppColor.blue,
                            valueColor: AppColor.black,
                            textColor: AppColor.gey,
                            value: '12',
                            text: 'Total Overtime Hours',
                            width: Sizes.screenWidth * 0.40,
                            height: Sizes.screenHeight * 0.065,
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.027),
                          CustomAttendanceCard(
                            icon: Icons.currency_rupee,
                            backgroundColor: AppColor.lightpurple,
                            iconBackgroundColor: AppColor.purple,
                            iconColor: AppColor.black,
                            valueColor: AppColor.black,
                            textColor: AppColor.gey,
                            value: '360',
                            text: 'Approved Overtime',
                            width: Sizes.screenWidth * 0.47,
                            height: Sizes.screenHeight * 0.065,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.027,
                          vertical: Sizes.screenHeight * 0.007,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.lightred,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: AppColor.stockTitleColor,
                              size: 18,
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.027),
                            Text(
                              'Payout Summary',
                              style: GoogleFonts.poppins(
                                color: AppColor.stockTitleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.012),
                      Row(
                        children: [
                          CustomAttendanceCard(
                            icon: Icons.currency_rupee,
                            backgroundColor: AppColor.lightgreen,
                            iconBackgroundColor: AppColor.iconbggreen,
                            iconColor: AppColor.green,
                            valueColor: AppColor.green,
                            textColor: AppColor.gey,
                            value: '18,600',
                            text: 'Total Earned',
                            width: Sizes.screenWidth * 0.29,
                            height: Sizes.screenHeight * 0.060,
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.015),
                          CustomAttendanceCard(
                            icon: Icons.currency_rupee,
                            backgroundColor: AppColor.blueverylight,
                            iconBackgroundColor: AppColor.bluelight,
                            iconColor: AppColor.blue,
                            valueColor: AppColor.blue,
                            textColor: AppColor.gey,
                            value: '12000',
                            text: 'Total Paid',
                            width: Sizes.screenWidth * 0.29,
                            height: Sizes.screenHeight * 0.060,
                          ),

                          SizedBox(width: Sizes.screenWidth * 0.015),

                          CustomAttendanceCard(
                            icon: Icons.currency_rupee,
                            backgroundColor: AppColor.lightred,
                            iconBackgroundColor: AppColor.lightredbg,
                            iconColor: AppColor.stockUnitColor,
                            valueColor: AppColor.stockUnitColor,
                            textColor: AppColor.gey,
                            value: '6600',
                            text: 'Remaining',
                            width: Sizes.screenWidth * 0.29,
                            height: Sizes.screenHeight * 0.060,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Sizes.screenHeight * 0.012),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027),
            child: Column(
              children: [
                SizedBox(height: Sizes.screenHeight * 0.006),
                Row(
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.015,
                        vertical: Sizes.screenHeight * 0.005,),
                      height: Sizes.screenHeight * 0.052,
                      width: Sizes.screenWidth * 0.410,
                      text: 'Mark Attendence',
                      fontSize:  14,
                      fontWeight: .w500,
                      onPressed: () {
                      },
                      iconOnLeft: true,
                      icon: Icons.calendar_month_rounded,
                      iconSize: 18,
                      iconSpacing: 5,
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.025),
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.011,
                        vertical: Sizes.screenHeight * 0.005,),
                      height: Sizes.screenHeight * 0.052,
                      width: Sizes.screenWidth * 0.475,
                      text: 'Add Payout',
                      fontSize:  14,
                      fontWeight: .w500,
                      onPressed: () {
                      },
                      iconOnLeft: true,
                      icon: Icons.account_balance_wallet_rounded,
                      iconSize: 18,
                      iconSpacing: 5,
                    ),
                  ],
                ),
              ],
            ),
          )

        ],
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
                  'Labour Details',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'View labour information and summary',
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

          ],
        ),
      ),
    );
  }
}
