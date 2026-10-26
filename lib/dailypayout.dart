import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantheader.dart';
import 'Constant/Constantpayout.dart';
import 'Constant/Sizes.dart';
import 'labourpayoutdetails.dart';

class Dailypayout extends StatefulWidget {
  Dailypayout({super.key});

  @override
  State<Dailypayout> createState() => _DailypayoutState();
}

class _DailypayoutState extends State<Dailypayout> {
  DateTime? selectedStartDate = DateTime(2026, 10, 15);
  DateTime? selectedEndDate = DateTime(2026, 10, 17);
  final TextEditingController searchController =
  TextEditingController();

  final List<Map<String, String>> labourList = [
    {
      'name': 'Rajesh Kumar',
      'mobile': '9876543210',
      'present': '3',
      'halfDay': '0',
      'absent': '0',
      'overtimeHours': '4',
      'payable': '2,400',
      'paid': '1,200',
      'remaining': '1,200',
    },
    {
      'name': 'Suresh Kumar',
      'mobile': '9123456789',
      'present': '2',
      'halfDay': '1',
      'absent': '0',
      'overtimeHours': '2',
      'payable': '1,800',
      'paid': '1,000',
      'remaining': '800',
    },
    {
      'name': 'Amit Singh',
      'mobile': '9988776655',
      'present': '4',
      'halfDay': '0',
      'absent': '1',
      'overtimeHours': '3',
      'payable': '2,400',
      'paid': '1,500',
      'remaining': '900',
    },
    {
      'name': 'Amit Singh',
      'mobile': '9988776655',
      'present': '4',
      'halfDay': '0',
      'absent': '1',
      'overtimeHours': '3',
      'payable': '2,400',
      'paid': '1,500',
      'remaining': '900',
    },
    {
      'name': 'Amit Singh',
      'mobile': '9988776655',
      'present': '4',
      'halfDay': '0',
      'absent': '1',
      'overtimeHours': '3',
      'payable': '2,400',
      'paid': '1,500',
      'remaining': '900',
    },
    {
      'name': 'Amit Singh',
      'mobile': '9988776655',
      'present': '4',
      'halfDay': '0',
      'absent': '1',
      'overtimeHours': '3',
      'payable': '2,400',
      'paid': '1,500',
      'remaining': '900',
    },
  ];

  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredLabours = labourList.where((labour) {
      final name = labour['name']!.toLowerCase();
      final mobile = labour['mobile']!;
      final query = searchText.toLowerCase();

      return name.contains(query) || mobile.contains(query);
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),

            CustomHeader(),

            SizedBox(height: 8),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Labour payout',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF782A17),
                          ),
                        ),
                        Text(
                          'Calculate and make payment to Labour',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF66615D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),
            //CustomDateSelector(),
            Container(
              height: Sizes.screenHeight * 0.062,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFF0E8E3),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: Sizes.screenHeight * 0.040,
                    width: Sizes.screenWidth * 0.082,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0ED),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.calendar_month,
                      color: Color(0xFF9E2424),
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${DateFormat('dd MMM yyyy').format(selectedStartDate!)}  -  '
                              '${DateFormat('dd MMM yyyy').format(selectedEndDate!)}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF273142),
                          ),
                        ),
                        Text(
                          '${selectedEndDate!.difference(selectedStartDate!).inDays + 1} Days',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Color(0xFF777777),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding:
                            EdgeInsets.symmetric(horizontal: 20),
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
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF9E2424),
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.groups,
                          value: '24',
                          title: 'Total Labour',
                          iconColor: Color(0xFF963025),
                          bgColor: Color(0xFFFFEEEE),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.check_circle,
                          value: '18',
                          title: 'Present',
                          iconColor: Color(0xFF16833B),
                          bgColor: Color(0xFFE8F8ED),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.watch_later,
                          value: '3',
                          title: 'Half Day',
                          iconColor: Color(0xFFC46A12),
                          bgColor: Color(0xFFFFF3E4),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.close,
                          value: '2',
                          title: 'Absent',
                          iconColor: Color(0xFFC62828),
                          bgColor: Color(0xFFFFEEEE),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6),

                  Row(
                    children: [
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.access_time,
                          value: '12',
                          title: 'Overtime(Hours)',
                          iconColor: Color(0xFF7045B5),
                          bgColor: Color(0xFFF1E9FF),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.currency_rupee,
                          value: '₹ 7,200',
                          title: 'Total Payable',
                          iconColor: Color(0xFF1763B5),
                          bgColor: Color(0xFFEAF4FF),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.payments,
                          value: '₹ 3,500',
                          title: 'Total Paid',
                          iconColor: Color(0xFF16833B),
                          bgColor: Color(0xFFE8F8ED),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _summaryCard(
                          icon: Icons.monetization_on,
                          value: '₹ 3,700',
                          title: 'Remaining',
                          iconColor: Color(0xFFC62828),
                          bgColor: Color(0xFFFFEEEE),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: Sizes.screenHeight * 0.048,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 22,
                      color: Color(0xFF172033),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText:
                          'Search labour name or mobile number...',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Color(0xFF777777),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 4),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: filteredLabours.length,
                itemBuilder: (context, index) {
                  final labour = filteredLabours[index];

                  return LabourSummaryCard(
                    name: labour['name']!,
                    mobile: labour['mobile']!,
                    present: labour['present']!,
                    halfDay: labour['halfDay']!,
                    absent: labour['absent']!,
                    overtimeHours: labour['overtimeHours']!,
                    payable: labour['payable']!,
                    paid: labour['paid']!,
                    remaining: labour['remaining']!,
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Labourpayoutdetails()));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard({
    required IconData icon,
    required String value,
    required String title,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      height: Sizes.screenHeight * 0.055,
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 17,
            color: iconColor,
          ),
          SizedBox(width: 4),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: iconColor,
                    ),
                  ),
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    color: Color(0xFF5D6470),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
