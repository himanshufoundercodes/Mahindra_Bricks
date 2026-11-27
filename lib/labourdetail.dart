import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/model/labour_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constant_attendence_card.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'EditLabourdetails.dart';

class Labourdetail extends StatefulWidget {
  final Data data;

  const Labourdetail({
    super.key,
    required this.data,
  });

  @override
  State<Labourdetail> createState() => _LabourdetailState();
}

class _LabourdetailState extends State<Labourdetail> {
  late Data currentData;

  @override
  void initState() {
    super.initState();
    currentData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: ListView(
        children: [
          _buildHeader(),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
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
                    color: const Color(0xFFFFF3F0),
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
                      const SizedBox(width: 10),

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
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditLabourDetails(data: currentData),
                            ),
                          );

                          if (result != null && result is Data) {
                            setState(() {
                              currentData = Data(
                                id: result.id ?? currentData.id,
                                labourCode: result.labourCode ?? currentData.labourCode,
                                name: result.name ?? currentData.name,
                                mobile: result.mobile ?? currentData.mobile,
                                dailyRate: result.dailyRate ?? currentData.dailyRate,
                                status: result.status ?? currentData.status,
                                totalEarned: result.totalEarned ?? currentData.totalEarned,
                                totalPaid: result.totalPaid ?? currentData.totalPaid,
                                remainingBalance: result.remainingBalance ?? currentData.remainingBalance,
                                createdAt: result.createdAt ?? currentData.createdAt,
                                updatedAt: result.updatedAt ?? currentData.updatedAt,
                                profileImage: result.profileImage ?? currentData.profileImage,
                                approvedOvertime: currentData.approvedOvertime,
                                approvedOvertimeAmount: currentData.approvedOvertimeAmount,
                                totalOvertimeHours: currentData.totalOvertimeHours,
                                attendanceSummary: currentData.attendanceSummary,
                                overtimeSummary: currentData.overtimeSummary,
                              );
                            });
                          }
                        },
                        type: CustomButtonType.outlined,
                        width: Sizes.screenWidth * 0.15,
                        height: Sizes.screenHeight * 0.032,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        icon: Icons.edit,
                        iconSize: 10,
                        iconOnLeft: true,
                        backgroundColor: AppColor.lightredbg,
                        textColor: AppColor.stockUnitColor,
                        borderColor: AppColor.stockUnitColor,
                        borderRadius: 9,
                        padding: EdgeInsets.symmetric(
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
                        currentData.labourCode.toString(),
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
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: const Text(
                          'Labour Name',
                          style: TextStyle(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        currentData.name.toString(),
                        style: const TextStyle(
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
                      bottom: BorderSide(color: AppColor.grey),
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
                          currentData.mobile.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.011,
                          vertical: Sizes.screenHeight * 0.005,
                        ),
                        height: Sizes.screenHeight * 0.038,
                        width: Sizes.screenWidth * 0.175,
                        text: 'Call',
                        backgroundColor: AppColor.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        onPressed: () {
                          launchUrl(Uri.parse('tel:${currentData.mobile}'));
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
                        currentData.dailyRate.toString(),
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
                  padding: const EdgeInsets.all(8),
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
                            const SizedBox(width: 10),
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
                            value: currentData.attendanceSummary?.presentDays?.toString() ?? '0',
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
                            value: currentData.attendanceSummary?.halfDays?.toString() ?? '0',
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
                            value: currentData.attendanceSummary?.absentDays?.toString() ?? '0',
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
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFF1E7E2)),
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
                            const Icon(
                              Icons.watch_later,
                              color: Color(0xFF922216),
                              size: 22,
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.027),
                            const Text(
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
                            value: currentData.overtimeSummary?.totalOvertimeHours?.toString() ??
                                currentData.totalOvertimeHours?.toString() ?? '0',
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
                            value: currentData.overtimeSummary?.approvedOvertime?.toString() ??
                                currentData.approvedOvertime?.toString() ?? '0',
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
                  padding: const EdgeInsets.all(8),
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
                            value: currentData.totalEarned?.toString() ?? '0',
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
                            value: currentData.totalPaid?.toString() ?? '0',
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
                            value: currentData.remainingBalance?.toString() ?? '0',
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
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenHeight * 0.010,
        vertical: Sizes.screenHeight * 0.010,
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
