import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewmodel/reportsview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantreportcard.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'circularprogressindicator.dart';

class Report extends StatefulWidget {
  Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReportsviewModel>(
        context,
        listen: false,
      ).ReportsApi();
    });
  }

  List<Map<String, dynamic>> reportList = [
    {
      "title": "Stock Report",
      "subtitle": "View current stock and date-wise details",
      "imagePath": "assets/r1.jpg",
      "backgroundColor": AppColor.lightred,
      "iconBackgroundColor": Color(0xFFFCEBE8),
      "details": [
        {"label": "Cement Stock", "value": "240 Bags", "color": "FFAD2018"},
        {"label": "Brick Stock", "value": "12,000 Pcs", "color": "FFAD2018"},
        {"label": "Paver Stock", "value": "8,000 Pcs", "color": "FFAD2018"},
      ],
    },

    {
      "title": "Dispatch Report",
      "subtitle": "View total dispatch and date-wise records",
      "imagePath": "assets/r2.jpg",
      "backgroundColor": Color(0xFFF2F9F3),
      "iconBackgroundColor": Color(0xFFFCEBE8),
      "details": [
        {"label": "Total Dispatch", "value": "8,500 Pcs", "color": "FFAD2018"},
        {"label": "Total Trips", "value": "12", "color": "FFAD2018"},
        {"label": "Total Clients", "value": "6", "color": "FFAD2018"},
      ],
    },
    {
      "title": "Labour Report",
      "subtitle": "View attendance, overtime and payments",
      "imagePath": "assets/r3.jpg",
      "backgroundColor": Color(0xFFF0F7FF),
      "iconBackgroundColor": Color(0xFFFCEBE8),
      "details": [
        {"label": "Total Labour", "value": "25", "color": "FFAD2018"},
        {"label": "Present", "value": "22", "color": "FF168443"},
        {"label": "Absent", "value": "2", "color": "FFAD2018"},
        {"label": "Overtime", "value": "4 hrs", "color": "FFAD2018"},
      ],
    },
    {
      "title": "Payment Report",
      "subtitle": "View client payments, labour payout and expenses",
      "imagePath": "assets/r4.jpg",
      "backgroundColor": Color(0xFFFFF8EC),
      "iconBackgroundColor": Color(0xFFFCEBE8),
      "details": [
        {"label": "Received(Clients)", "value": "₹1,25,000", "color": "FF168443"},
        {"label": "Pending(Clients)", "value": "₹35,000", "color": "FFAD2018"},
        {"label": "Labour Payout", "value": "₹28,500", "color": "FFAD2018"},
        {"label": "Cement Purchase", "value": "₹45,600", "color": "FFAD2018"},
      ],
    },
    {
      "title": "Client Report",
      "subtitle": "View client-wise orders and payment details",
      "imagePath": "assets/r5.jpg",
      "backgroundColor": Color(0xFFFFF0F0),
      "iconBackgroundColor": Color(0xFFFCEBE8),
      "details": [
        {"label": "Total Clients", "value": "18", "color": "FFAD2018"},
        {"label": "Total Orders", "value": "42", "color": "FFAD2018"},
        {"label": "Total Billing", "value": "₹2,10,000", "color": "FFAD2018"},
        {"label": "Pending Amount", "value": "₹52,000", "color": "FFAD2018"},
      ],
    },
    {
      "title": "Client Report",
      "subtitle": "View client-wise orders and payment details",
      "imagePath": "assets/r5.jpg",
      "backgroundColor": Color(0xFFFFF0F0),
      "iconBackgroundColor": Color(0xFFFCEBE8),
      "details": [
        {"label": "Total Clients", "value": "18", "color": "FFAD2018"},
        {"label": "Total Orders", "value": "42", "color": "FFAD2018"},
        {"label": "Total Billing", "value": "₹2,10,000", "color": "FFAD2018"},
        {"label": "Pending Amount", "value": "₹52,000", "color": "FFAD2018"},
      ],
    },
  ];

  DateTime? selectedStartDate = DateTime(2026, 10, 17);
  DateTime? selectedEndDate = DateTime(2026, 10, 17);

  @override
  String formatDate(DateTime? date) {
    if (date == null) return 'Select date';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day.toString().padLeft(2, '0')} '
        '${months[date.month - 1]} ${date.year}';
  }
  Widget build(BuildContext context) {
    final reportslist = Provider.of<ReportsviewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar:  ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: Sizes.screenHeight * 0.006),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      child: CustomCalendar(
                        isRange: true,
                        startDate: selectedStartDate,
                        endDate: selectedEndDate,
                        onRangeSelected: (start, end) {
                          setState(() {
                            selectedStartDate = start;
                            selectedEndDate = end;
                          });
                          Navigator.pop(dialogContext);
                        },
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: Sizes.screenHeight * 0.047,
                margin: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.04),
                padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.grey),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: AppColor.stockUnitColor,
                      size: 20,
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.027),
                    Expanded(
                      child: Text(
                        '${formatDate(selectedStartDate)}  -  ${formatDate(selectedEndDate)}',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF273142),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.black,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.012),
            if (reportslist.loading)
              Center(
                child: Circularprogressindicator(),
              )
            else if (reportslist.errorMessage != null)
              Center(
                child: Column(
                  children: [
                    Text(reportslist.errorMessage!),
                    CustomButton(
                      text: 'Retry',
                      onPressed: reportslist.ReportsApi,
                    ),
                  ],
                ),
              )
              else
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reportList.length,
              itemBuilder: (context, index) {
                return CustomReportCard(
                  title: reportList[index]["title"],
                  subtitle: reportList[index]["subtitle"],
                  imagePath: reportList[index]["imagePath"],
                  backgroundColor: reportList[index]["backgroundColor"],
                  iconBackgroundColor: reportList[index]["iconBackgroundColor"],
                  details: reportList[index]["details"],
                  onTap: () {},
                );
              },
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
                  'Report',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'View and amalyze your factory report',
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
