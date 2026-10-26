import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantreportcard.dart';

class Report extends StatefulWidget {
  Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Report",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF991B12),
                          ),
                        ),
                        Text(
                          "View and analyze your factory report",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF777777),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: Sizes.screenHeight * 0.047,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFFFFEFC),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFE5E0DC)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Color(0xFFB22222),
                    size: 20,
                  ),

                  SizedBox(width: 10),

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

                  // Sirf arrow par click karne se calendar open hoga
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
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFB22222),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            CustomReportCard(
              title: "Stock Report",
              subtitle: "View current stock and date-wise details",
              imagePath: "assets/r1.jpg",
              backgroundColor: Color(0xFFFFF3F1),
              iconBackgroundColor: Color(0xFFFCEBE8),
              details: [
                {
                  "label": "Cement Stock",
                  "value": "240 Bags",
                  "color": "FFAD2018",
                },
                {
                  "label": "Brick Stock",
                  "value": "12,000 Pcs",
                  "color": "FFAD2018",
                },
                {
                  "label": "Paver Stock",
                  "value": "8,000 Pcs",
                  "color": "FFAD2018",
                },
              ],
              onTap: () {},
            ),

            CustomReportCard(
              title: "Dispatch Report",
              subtitle: "View total dispatch and date-wise records",
              imagePath: "assets/r2.jpg",
              backgroundColor: Color(0xFFF2F9F3),
              iconBackgroundColor: Color(0xFFFCEBE8),
              details: [
                {"label": "Total Dispatch", "value": "8,500 Pcs", "color": "FFAD2018"},
                {"label": "Total Trips", "value": "12", "color": "FFAD2018"},
                {"label": "Total Clients", "value": "6", "color": "FFAD2018"},
              ],
              onTap: () {},
            ),

            CustomReportCard(
              title: "Labour Report",
              subtitle: "View attendance, overtime and payments",
              imagePath: "assets/r3.jpg",
              backgroundColor: Color(0xFFF0F7FF),
              iconBackgroundColor: Color(0xFFFCEBE8),
              details: [
                {"label": "Total Labour", "value": "25", "color": "FFAD2018"},
                {"label": "Present", "value": "22", "color": "FF168443"},
                {"label": "Absent", "value": "2", "color": "FFAD2018"},
                {"label": "Overtime", "value": "4 hrs", "color": "FFAD2018"},
              ],
              onTap: () {},
            ),

            CustomReportCard(
              title: "Payment Report",
              subtitle: "View client payments, labour payout and expenses",
              imagePath: "assets/r4.jpg",
              backgroundColor: Color(0xFFFFF8EC),
              iconBackgroundColor: Color(0xFFFCEBE8),
              details: [
                {"label": "Received(Clients)", "value": "₹1,25,000", "color": "FF168443"},
                {"label": "Pending(Clients)", "value": "₹35,000", "color": "FFAD2018"},
                {"label": "Labour Payout", "value": "₹28,500", "color": "FFAD2018"},
                {"label": "Cement Purchase", "value": "₹45,600", "color": "FFAD2018"},
              ],
              onTap: () {},
            ),

            CustomReportCard(
              title: "Client Report",
              subtitle: "View client-wise orders and payment details",
              imagePath: "assets/r5.jpg",
              backgroundColor: Color(0xFFFFF0F0),
              iconBackgroundColor: Color(0xFFFCEBE8),
              details: [
                {"label": "Total Clients", "value": "18", "color": "FFAD2018"},
                {"label": "Total Orders", "value": "42", "color": "FFAD2018"},
                {"label": "Total Billing", "value": "₹2,10,000", "color": "FFAD2018"},
                {"label": "Pending Amount", "value": "₹52,000", "color": "FFAD2018"},
              ],
              onTap: () {},
            ),
            CustomReportCard(
              title: "Client Report",
              subtitle: "View client-wise orders and payment details",
              imagePath: "assets/r5.jpg",
              backgroundColor: Color(0xFFFFF0F0),
              iconBackgroundColor: Color(0xFFFCEBE8),
              details: [
                {"label": "Total Clients", "value": "18", "color": "FFAD2018"},
                {"label": "Total Orders", "value": "42", "color": "FFAD2018"},
                {"label": "Total Billing", "value": "₹2,10,000", "color": "FFAD2018"},
                {"label": "Pending Amount", "value": "₹52,000", "color": "FFAD2018"},
              ],
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
