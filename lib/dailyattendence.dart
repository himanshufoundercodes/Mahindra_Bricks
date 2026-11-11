import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/viewmodel/dailyattendenceview_model.dart';
import 'package:provider/provider.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantheader.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'circularprogressindicator.dart';
import 'model/dailyattendence.dart';

class Dailyattendence extends StatefulWidget {
  Dailyattendence({super.key});

  @override
  State<Dailyattendence> createState() => _DailyattendenceState();
}

class _DailyattendenceState extends State<Dailyattendence> {
  DateTime? selectedPaymentDate = DateTime(2026, 10, 17);
  DateTime selectedDate = DateTime(2026, 10, 16);
  final TextEditingController searchController = TextEditingController();
  final Map<int, String> _attendanceStatus = {};

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DailyattendenceViewModel>(
        context,
        listen: false,
      ).AttendenceApi();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Workers> getFilteredWorkers(List<Workers>? apiWorkers) {
    if (apiWorkers == null) return [];
    String query = searchController.text.toLowerCase();
    if (query.isEmpty) return apiWorkers;
    return apiWorkers.where((worker) {
      final name = worker.name.toLowerCase();
      final mobile = worker.mobile.toLowerCase();
      return name.contains(query) || mobile.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Attendencelist = Provider.of<DailyattendenceViewModel>(context);
    final summary = Attendencelist.dailyattendenceModel?.summary;
    final workers = getFilteredWorkers(Attendencelist.dailyattendenceModel?.workers);

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: ConstantAppBar(
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
          await Provider.of<DailyattendenceViewModel>(
            context,
            listen: false,
          ).AttendenceApi();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: Sizes.screenHeight * 0.016),

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

                  SizedBox(width: Sizes.screenWidth * 0.015),

                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding:
                            EdgeInsets.symmetric(
                              horizontal: Sizes.screenWidth * 0.05,
                            ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.screenWidth * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.bgbacklight,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: AppColor.bgbacklight,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 14,
                            color: AppColor.stockUnitColor,
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.01),
                          Text(
                            'Select Date',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColor.stockUnitColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.016),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.025,
              ),
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
                            count: summary?.totalLabour?.toString() ?? '0',
                            title: 'Total Labour',
                            iconColor: AppColor.stockUnitColor,
                            bgColor: AppColor.bgbacklight,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.015),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.check_circle,
                            count: summary?.present?.toString() ?? '0',
                            title: 'Present',
                            iconColor: AppColor.green,
                            bgColor: AppColor.lightgreenbg,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.015),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.watch_later,
                            count: summary?.halfDay?.toString() ?? '0',
                            title: 'Half Day',
                            iconColor:AppColor.yellow,
                            bgColor: AppColor.lightyellow,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.015),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.cancel,
                            count: summary?.absent?.toString() ?? '0',
                            title: 'Absent',
                            iconColor: AppColor.red2,
                            bgColor: AppColor.verylightredbg,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.015),
                        SizedBox(
                          width: Sizes.screenWidth * 0.25,
                          child: _attendanceCard(
                            icon: Icons.remove_circle,
                            count: summary?.notMarked?.toString() ?? '0',
                            title: 'Not Marked',
                            iconColor: AppColor.bggrey,
                            bgColor: AppColor.darkgrey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: Sizes.screenHeight * 0.012),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.screenWidth * 0.02,
                      vertical: Sizes.screenHeight * 0.0075,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.lightyellow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.borderyellow),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.034,
                          width: Sizes.screenWidth * 0.07,
                          decoration: BoxDecoration(
                            color: AppColor.bgbacklight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.access_time,
                            color: AppColor.stockUnitColor,
                            size: 18,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.02),
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
                                  color: AppColor.stockUnitColor,
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                'You can mark or update attendance for this date',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: AppColor.gey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: Sizes.screenWidth * 0.0125),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.screenWidth * 0.02,
                            vertical: Sizes.screenHeight * 0.006,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.bgmedium,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 16,
                                color: AppColor.red2,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.0125),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current Time',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      color: AppColor.black87,
                                    ),
                                  ),
                                  Text(
                                    '10:30 AM',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.stockUnitColor,
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
            SizedBox(height: Sizes.screenHeight * 0.012),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: Sizes.screenHeight * 0.052,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColor.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 22,
                      color: AppColor.gey,
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.03),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search labour name or mobile number...',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 11,
                            color: AppColor.gey,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColor.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.012),
            Column(
              children: [
                 SizedBox(height: Sizes.screenHeight * 0.005),

                if (Attendencelist.loading)
                  Transform.translate(
                    offset: Offset(0, -80),
                    child: Center(
                      child: Circularprogressindicator(),
                    ),
                  )

                else if (Attendencelist.errorMessage != null)
                  Center(
                    child: Column(
                      children: [
                        Text(Attendencelist.errorMessage!),
                        SizedBox(height: Sizes.screenHeight * 0.012),
                        CustomButton(
                          text: 'Retry',
                          onPressed: Attendencelist.AttendenceApi,
                        ),
                      ],
                    ),
                  )
                else if (workers.isEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.screenHeight * 0.025,
                      ),
                      child: Text(
                        'No labour attendance records found.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF777777),
                        ),
                      ),
                    ),
                  )
                else
                  ListView.builder(
                    itemCount: workers.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final labour = workers[index];
                      final labourId = labour.labourId;
                      final currentStatus = _attendanceStatus[labourId] ?? labour.status?.toString() ?? '';

                      return Transform.translate(
                        offset: Offset(0, -20),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: AppColor.grey),
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
                                          labour.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.black,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.call,
                                              size: 11,
                                              color: AppColor.gey,
                                            ),
                                            SizedBox(width: 3),
                                            Expanded(
                                              child: Text(
                                                labour.mobile,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 9.5,
                                                  color: AppColor.gey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: Sizes.screenHeight * 0.0325,
                                    width: Sizes.screenWidth * 0.0025,
                                    color: AppColor.grey,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Sizes.screenWidth * 0.01,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Daily Rate',
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          color: AppColor.gey,
                                        ),
                                      ),
                                      Text(
                                        '₹ ${labour.dailyRate ?? 0}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.stockUnitColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Sizes.screenWidth * 0.015),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _attendanceOption(
                                        'Present',
                                        AppColor.lightgreen,
                                        AppColor.green,
                                        isSelected: currentStatus == 'Present',
                                        onTap: () {
                                          setState(() {
                                            if (_attendanceStatus[labourId] == 'Present') {
                                              _attendanceStatus[labourId] = '';
                                            } else {
                                              _attendanceStatus[labourId] = 'Present';
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(width: 3),
                                      _attendanceOption(
                                        'Half',
                                        AppColor.bghalf,
                                        AppColor.texthalf,
                                        isSelected: currentStatus == 'Half Day',
                                        onTap: () {
                                          setState(() {
                                            if (_attendanceStatus[labourId] == 'Half Day') {
                                              _attendanceStatus[labourId] = '';
                                            } else {
                                              _attendanceStatus[labourId] = 'Half Day';
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(width: 3),
                                      _attendanceOption(
                                        'Absent',
                                        AppColor.bgbacklight,
                                        AppColor.red,
                                        isSelected: currentStatus == 'Absent',
                                        onTap: () {
                                          setState(() {
                                            if (_attendanceStatus[labourId] == 'Absent') {
                                              _attendanceStatus[labourId] = '';
                                            } else {
                                              _attendanceStatus[labourId] = 'Absent';
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: Sizes.screenHeight * 0.0075),

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
                                  SizedBox(width: Sizes.screenWidth * 0.015),
                                  SizedBox(
                                    width: Sizes.screenWidth * 0.14,
                                    height: Sizes.screenHeight * 0.027,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      decoration: InputDecoration(
                                        hintText: labour.overtimeHours?.toString() ?? '0',
                                        hintStyle: GoogleFonts.poppins(fontSize: 10),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: Sizes.screenWidth * 0.015,
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
                                  SizedBox(width: Sizes.screenWidth * 0.01),
                                  Text(
                                    'hrs',
                                    style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Color(0xFF687386),
                                    ),
                                  ),
                                  SizedBox(width: Sizes.screenWidth * 0.02),
                                  SizedBox(
                                    width: Sizes.screenWidth * 0.14,
                                    height: Sizes.screenHeight * 0.027,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      decoration: InputDecoration(
                                        hintText: labour.overtimeRate?.toString() ?? '0',
                                        hintStyle: GoogleFonts.poppins(fontSize: 10),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: Sizes.screenWidth * 0.015,
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
                                  SizedBox(width: Sizes.screenWidth * 0.01),
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
              ],
            ),
            Transform.translate(
              offset: Offset(0, 10),
            child:CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: Sizes.screenHeight * 0.055,
                width: Sizes.screenWidth * 0.95,
                type: CustomButtonType.filled,
                text: 'Save Attendance',
                textColor: AppColor.white,
                borderColor: AppColor.stockTitleColor,
                fontSize: 15,
                fontWeight: .w500,
                onPressed: () {
                 // Navigator.pop(context);
                },
                iconOnLeft: true,
                icon: Icons.save,
                iconSize: 18,
                iconSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
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
        vertical: Sizes.screenHeight * 0.010,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.010),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ' Daily Attendance',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.stockAmountColor,
                    ),
                  ),
                  Text(
                    'Mark labour attendence for the selected date',
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
            ),

            SizedBox(width: 8),

            // CustomButton(
            //   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            //   height: 35,
            //   width: 100,
            //   text: 'Add Client',
            //   fontSize:  12,
            //   fontWeight: .w500,
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Addclient()),
            //     );
            //   },
            //   iconOnLeft: true,
            //   icon: Icons.add,
            //   iconSize: 15,
            //   iconSpacing: 2,
            // ),
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
