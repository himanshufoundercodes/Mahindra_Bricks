import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantheader.dart';
import 'Constant/Sizes.dart';

class Dailyattendence extends StatefulWidget {
  Dailyattendence({super.key});

  @override
  State<Dailyattendence> createState() => _DailyattendenceState();
}
class _DailyattendenceState extends State<Dailyattendence> {
  DateTime? selectedPaymentDate = DateTime(2026, 10, 17);
  DateTime selectedDate = DateTime(2026, 10, 16);

  final List<Map<String, String>> labourList = [
    {'name': 'Rajesh Kumar', 'mobile': '9876543210', 'rate': '600'},
    {'name': 'Suresh Kumar', 'mobile': '9123456789', 'rate': '550'},
    {'name': 'Amit Singh', 'mobile': '9988776655', 'rate': '650'},
    {'name': 'Manoj Verma', 'mobile': '9811223344', 'rate': '580'},
    {'name': 'Rahul Sharma', 'mobile': '9722334455', 'rate': '620'},
    {'name': 'Pradeep Verma', 'mobile': '9811223344', 'rate': '580'},
    {'name': 'Akash Sharma', 'mobile': '9722334455', 'rate': '920'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomHeader(),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Daily Attendence',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF782A17),
                          ),
                        ),
                        Text(
                          'Mark labour attendence for the selected date',
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
            SizedBox(height: 13),


            Container(
              height: Sizes.screenHeight * 0.062,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Color(0xFFFFF9F6),
                borderRadius: BorderRadius.circular(9),
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
                      color: Color(0xFFFFE9E2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(
                      Icons.calendar_month,
                      color: Color(0xFF9E2424),
                      size: 22,
                    ),
                  ),

                  SizedBox(width: 8),

                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedDate =
                            selectedDate.subtract(Duration(days: 1));
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.chevron_left,
                        color: Color(0xFF9E2424),
                        size: 20,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy').format(selectedDate),
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF273142),
                          ),
                        ),
                        Text(
                          DateFormat('EEEE').format(selectedDate),
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            color: Color(0xFF777777),
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedDate =
                            selectedDate.add(Duration(days: 1));
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.chevron_right,
                        color: Color(0xFF9E2424),
                        size: 20,
                      ),
                    ),
                  ),

                  SizedBox(width: 6),

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
                              isRange: false,
                              selectedDate: selectedDate,
                              onDateSelected: (date) {
                                setState(() {
                                  selectedDate = date;
                                });

                                Navigator.pop(dialogContext);
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: Sizes.screenHeight * 0.040,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF5F1),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Color(0xFFF0D5CA),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 14,
                            color: Color(0xFF9E2424),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Select Date',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF9E2424),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.groups,
                            count: labourList.length.toString(),
                            title: 'Total Labour',
                            iconColor: Color(0xFF963025),
                            bgColor: Color(0xFFFFF0ED),
                          ),
                        ),
                        SizedBox(width: 6),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.check_circle,
                            count: '0',
                            title: 'Present',
                            iconColor: Color(0xFF159447),
                            bgColor: Color(0xFFE8F8EC),
                          ),
                        ),
                        SizedBox(width: 6),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.watch_later,
                            count: '0',
                            title: 'Half Day',
                            iconColor: Color(0xFFC87512),
                            bgColor: Color(0xFFFFF4E5),
                          ),
                        ),
                        SizedBox(width: 6),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.cancel,
                            count: '0',
                            title: 'Absent',
                            iconColor: Color(0xFFE53935),
                            bgColor: Color(0xFFFFEEEE),
                          ),
                        ),
                        SizedBox(width: 6),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.remove_circle,
                            count: labourList.length.toString(),
                            title: 'Not Marked',
                            iconColor: Color(0xFF8A939E),
                            bgColor: Color(0xFFF0F2F5),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF4ED),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFFCE2D4)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.034,
                          width: Sizes.screenWidth * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE8DB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.access_time,
                            color: Color(0xFF963025),
                            size: 18,
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attendance can be marked after 6:00 PM',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF963025),
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                'You can mark or update attendance for this date only after 6:00 PM.',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 8.5,
                                  color: Color(0xFF4F5661),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 5),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD9D6),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 16,
                                color: Color(0xFFE53935),
                              ),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Time',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    '10:30 AM',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF963025),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: Sizes.screenHeight * 0.052,
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
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search labour name or mobile number...',
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
            SizedBox(height: 2),
            ListView.builder(
              itemCount: labourList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final labour = labourList[index];
                return Transform.translate(
                  offset: Offset(0, -18),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Color(0xFFF0E8E3)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    labour['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF172033),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 11,
                                        color: Color(0xFF687386),
                                      ),
                                      SizedBox(width: 3),
                                      Expanded(
                                        child: Text(
                                          labour['mobile']!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 9.5,
                                            color: Color(0xFF687386),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 26,
                              width: 1,
                              color: Color(0xFFE6E6E6),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily Rate',
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    color: Color(0xFF687386),
                                  ),
                                ),
                                Text(
                                  '₹ ${labour['rate']}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFB3261E),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 6),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _attendanceOption(
                                  'Present',
                                  Color(0xFFE5F8E9),
                                  Color(0xFF267A40),
                                  isSelected: labour['attendance'] == 'Present',
                                  onTap: () {
                                    setState(() {
                                      if (labour['attendance'] == 'Present') {
                                        labourList[index]['attendance'] = '';
                                      } else {
                                        labourList[index]['attendance'] = 'Present';
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 3),
                                _attendanceOption(
                                  'Half',
                                  Color(0xFFFFF1E5),
                                  Color(0xFFAD5428),
                                  isSelected: labour['attendance'] == 'Half Day',
                                  onTap: () {
                                    setState(() {
                                      if (labour['attendance'] == 'Half Day') {
                                        labourList[index]['attendance'] = '';
                                      } else {
                                        labourList[index]['attendance'] = 'Half Day';
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 3),
                                _attendanceOption(
                                  'Absent',
                                  Color(0xFFFFE9E9),
                                  Color(0xFFC62828),
                                  isSelected: labour['attendance'] == 'Absent',
                                  onTap: () {
                                    setState(() {
                                      if (labour['attendance'] == 'Absent') {
                                        labourList[index]['attendance'] = '';
                                      } else {
                                        labourList[index]['attendance'] = 'Absent';
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 6),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Overtime',
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                color: Color(0xFF687386),
                              ),
                            ),
                            SizedBox(width: 6),
                            SizedBox(
                              width: Sizes.screenWidth * 0.09,
                              height: Sizes.screenHeight * 0.027,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0',
                                  hintStyle: GoogleFonts.poppins(fontSize: 10),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDADADA),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDADADA),
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.poppins(fontSize: 10),
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'hrs',
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                color: Color(0xFF687386),
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              width: Sizes.screenWidth * 0.09,
                              height: Sizes.screenHeight * 0.027,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0',
                                  hintStyle: GoogleFonts.poppins(fontSize: 10),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDADADA),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDADADA),
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.poppins(fontSize: 10),
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '₹ / hr',
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                color: Color(0xFF687386),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Transform.translate(
              offset: Offset(0, -24),
              child: Container(
                width: double.infinity,
                height: Sizes.screenHeight * 0.050,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF963025),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.save,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Save Attendance',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Will be enabled after 6:00 PM',
                            style: GoogleFonts.poppins(
                              fontSize: 8.5,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _attendanceCard({
    required IconData icon,
    required String count,
    required String title,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 9),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 21, color: iconColor),
          SizedBox(width: 5),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  count,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: iconColor,
                  ),
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    color: Color(0xFF555555),
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

Widget _attendanceOption(
    String title,
    Color bgColor,
    Color textColor, {
      required bool isSelected,
      required VoidCallback onTap,
    }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? textColor : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            size: 12,
            color: textColor,
          ),
          SizedBox(width: 3),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 8.5,
              fontWeight: isSelected
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}
