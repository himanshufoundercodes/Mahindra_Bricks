import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Appbar.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constnat_Appbutton.dart';
import 'package:mahindra_bricks/circularprogressindicator.dart';
import 'package:mahindra_bricks/model/dailyattendence.dart' as daily_model;
import 'package:mahindra_bricks/viewmodel/attendenceView_model.dart';
import 'package:provider/provider.dart';

class DailyAttendanceSummary extends StatefulWidget {
  final daily_model.Workers? labour;
  final DateTime? selectedDate;
  final String? attendanceStatus;

  const DailyAttendanceSummary({
    super.key,
    this.labour,
    this.selectedDate,
    this.attendanceStatus,
  });

  @override
  State<DailyAttendanceSummary> createState() =>
      _DailyAttendanceSummaryState();
}

class _DailyAttendanceSummaryState extends State<DailyAttendanceSummary> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchAttendanceDetails();
    });
  }

  void _fetchAttendanceDetails() {
    final labourId = widget.labour?.labourId ?? 0;
    final date = widget.selectedDate ?? DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);

    if (labourId > 0) {
      Provider.of<LabourDetailViewModel>(context, listen: false).labourDetailApi(
        id: labourId,
        fromDate: formattedDate,
        toDate: formattedDate,
      );
    }
  }

  Widget summaryRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.screenHeight * 0.009,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColor.black,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valueColor ?? AppColor.gey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LabourDetailViewModel>(context);
    final apiModel = viewModel.labourDetailModel;
    final fallbackLabour = widget.labour;
    final selectedDate = widget.selectedDate ?? DateTime.now();

    final labourInfo = apiModel?.labour;
    final summary = apiModel?.summary;
    final attendanceSummary = summary?.attendance;
    final transactionsSummary = summary?.transactions;
    final historyList = apiModel?.attendanceHistory ?? [];
    final transactionsList = apiModel?.transactions ?? [];

    final name = labourInfo?.name ?? fallbackLabour?.name ?? 'Labour Name';
    final mobile = labourInfo?.mobile ?? fallbackLabour?.mobile ?? 'Mobile not available';
    final labourInfoCode = labourInfo?.labourCode;
    final fallbackCode = fallbackLabour?.labourCode;
    final labourCode = (labourInfoCode != null && labourInfoCode.isNotEmpty)
        ? labourInfoCode
        : (fallbackCode != null && fallbackCode.isNotEmpty)
            ? fallbackCode
            : 'N/A';
    final dailyRate = labourInfo?.dailyRate ?? fallbackLabour?.dailyRate ?? 0;
    final remainingBalance = labourInfo?.remainingBalance ?? 0;

    final formattedDate = DateFormat('dd MMM yyyy (EEEE)').format(selectedDate);

    // Get status from history or fallback
    String status = widget.attendanceStatus ?? '';
    if (historyList.isNotEmpty && historyList.first.status != null) {
      status = historyList.first.status!;
    } else if (fallbackLabour?.status != null) {
      status = fallbackLabour!.status.toString();
    }
    if (status.isEmpty) status = 'Not Marked';

    final statusColor = status.toLowerCase() == 'present'
        ? AppColor.green
        : status.toLowerCase() == 'absent'
            ? AppColor.red
            : status.toLowerCase() == 'half day' || status.toLowerCase() == 'half'
                ? AppColor.yellow
                : AppColor.black;

    final overtimeHours = historyList.isNotEmpty ? (historyList.first.overtimeHours ?? 0) : 0;
    final overtimeRate = historyList.isNotEmpty ? (historyList.first.overtimeRate ?? 0) : 0;
    final totalWage = historyList.isNotEmpty ? (historyList.first.totalWage ?? 0) : 0;

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: viewModel.loading
          ? Center(child: Circularprogressindicator())
          : viewModel.errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewModel.errorMessage!,
                        style: GoogleFonts.poppins(color: AppColor.red),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.02),
                      CustomButton(
                        text: 'Retry',
                        onPressed: _fetchAttendanceDetails,
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(Sizes.screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attendance Summary',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.stockAmountColor,
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.015),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            backgroundColor: AppColor.white,
                            collapsedBackgroundColor: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            iconColor: AppColor.stockAmountColor,
                            collapsedIconColor: AppColor.gey,
                            title: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: AppColor.lightredbg,
                                  backgroundImage: labourInfo?.profileImage != null &&
                                          labourInfo!.profileImage!.isNotEmpty
                                      ? NetworkImage(labourInfo.profileImage!)
                                      : null,
                                  child: labourInfo?.profileImage == null ||
                                          labourInfo!.profileImage!.isEmpty
                                      ? Icon(
                                          Icons.person,
                                          size: 28,
                                          color: AppColor.stockUnitColor,
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.black,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        mobile,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColor.gey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Divider(
                                color: AppColor.grey,
                                thickness: 0.7,
                              ),
                              summaryRow('Date', formattedDate),
                              summaryRow('Labour Code', labourCode),
                              summaryRow(
                                'Status',
                                status,
                                valueColor: statusColor,
                              ),
                              summaryRow('Present Days', '${attendanceSummary?.presentDays ?? 0}'),
                              summaryRow('Half Days', '${attendanceSummary?.halfDays ?? 0}'),
                              summaryRow('Absent Days', '${attendanceSummary?.absentDays ?? 0}'),
                              summaryRow('Total Days', '${attendanceSummary?.totalDays ?? 0}'),
                              summaryRow('Daily Rate', '₹ $dailyRate'),
                              summaryRow('Overtime Hours', '$overtimeHours hrs'),
                              summaryRow('Overtime Rate', '₹ $overtimeRate'),
                              summaryRow('Total Overtime Hours', '${attendanceSummary?.totalOvertimeHours ?? 0} hrs'),
                              summaryRow('Total Earned in Range', '₹ ${attendanceSummary?.totalEarnedInRange ?? 0}'),
                              summaryRow('Total Wage', '₹ $totalWage'),
                              summaryRow('Remaining Balance', '₹ $remainingBalance',
                                  valueColor: AppColor.stockAmountColor),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.02),
                      Text(
                        'Payment History',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.stockAmountColor,
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.015),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            initiallyExpanded: false,
                            backgroundColor: AppColor.white,
                            collapsedBackgroundColor: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            iconColor: AppColor.stockAmountColor,
                            collapsedIconColor: AppColor.gey,
                            title: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: AppColor.lightredbg,
                                  child: Icon(
                                    Icons.currency_rupee,
                                    size: 28,
                                    color: AppColor.stockUnitColor,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Payment Transactions',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.black,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        'Total Paid: ₹ ${transactionsSummary?.allTimePaid ?? 0}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColor.gey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Divider(
                                color: AppColor.grey,
                                thickness: 0.7,
                              ),
                              summaryRow('All-Time Earned', '₹ ${transactionsSummary?.allTimeEarned ?? 0}'),
                              summaryRow('All-Time Paid', '₹ ${transactionsSummary?.allTimePaid ?? 0}'),
                              summaryRow('Remaining Balance', '₹ ${transactionsSummary?.remainingBalance ?? remainingBalance}',
                                  valueColor: AppColor.stockAmountColor),
                              const Divider(height: 20),
                              if (transactionsList.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'No payment history found.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: AppColor.gey,
                                    ),
                                  ),
                                )
                              else
                                ...transactionsList.map((tx) {
                                  final map = tx is Map<String, dynamic> ? tx : <String, dynamic>{};
                                  final date = map['payment_date']?.toString() ?? map['date']?.toString() ?? map['created_at']?.toString() ?? 'N/A';
                                  final amount = map['amount']?.toString() ?? '0';
                                  final mode = map['payment_mode']?.toString() ?? 'Cash';
                                  final notes = map['notes']?.toString();

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColor.bodybackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.grey),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              date,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black,
                                              ),
                                            ),
                                            Text(
                                              '₹ $amount',
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Mode: $mode',
                                              style: GoogleFonts.poppins(
                                                fontSize: 11,
                                                color: AppColor.gey,
                                              ),
                                            ),
                                            if (notes != null && notes.isNotEmpty)
                                              Text(
                                                'Note: $notes',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  color: AppColor.gey,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
