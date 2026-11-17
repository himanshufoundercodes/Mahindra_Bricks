import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/dailyattendenceview_model.dart';
import 'package:mahindra_bricks/viewmodel/save_attendance_viewmodel.dart';
import 'package:provider/provider.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'circularprogressindicator.dart';
import 'model/dailyattendence.dart';

class Dailyattendence extends StatefulWidget {
  const Dailyattendence({super.key});

  @override
  State<Dailyattendence> createState() => _DailyattendenceState();
}

class _DailyattendenceState extends State<Dailyattendence> {
  DateTime? selectedPaymentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  final TextEditingController searchController = TextEditingController();
  final Map<int, String> _attendanceStatus = {};
  final Map<int, TextEditingController> _overtimeControllers = {};

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchAttendanceForDate(selectedDate);
    });
  }

  void _fetchAttendanceForDate(DateTime date) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    _attendanceStatus.clear();
    Provider.of<DailyattendenceViewModel>(
      context,
      listen: false,
    ).AttendenceApi(date: formattedDate);
  }

  @override
  void dispose() {
    searchController.dispose();

    for (var controller in _overtimeControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  bool _canMarkAttendance() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

    if (targetDate.isAfter(today)) {
      return false;
    }
    if (targetDate.isAtSameMomentAs(today)) {
      return now.hour >= 18;
    }
    return true;
  }

  String _getLabourStatus(Workers labour) {
    final statusFromMap = _attendanceStatus[labour.labourId];
    if (statusFromMap != null && statusFromMap.isNotEmpty) {
      return statusFromMap;
    }
    if (labour.status != null) {
      final s = labour.status.toString().trim();
      if (s.isNotEmpty && s.toLowerCase() != 'null') {
        if (s.toLowerCase() == 'present') return 'Present';
        if (s.toLowerCase() == 'absent') return 'Absent';
        if (s.toLowerCase() == 'half day' || s.toLowerCase() == 'half') return 'Half Day';
        return s;
      }
    }
    return '';
  }

  bool _isAllAttendanceMarked(List<Workers> workers) {
    if (workers.isEmpty) return false;
    for (var labour in workers) {
      if (_getLabourStatus(labour).isEmpty) {
        return false;
      }
    }
    return true;
  }

  List<Workers> attendenceWorkersList() {
    return Provider.of<DailyattendenceViewModel>(
      context,
      listen: false,
    ).dailyattendenceModel?.workers ?? [];
  }

  Future<void> saveAttendance() async {
    if (!_canMarkAttendance()) {
      Utils.showErrorMessage(context, 'Attendance can only be marked after 6:00 PM');
      return;
    }

    final allWorkers = attendenceWorkersList();

    if (!_isAllAttendanceMarked(allWorkers)) {
      Utils.showErrorMessage(context, 'Please select attendance for all labours');
      return;
    }

    List<Map<String, dynamic>> attendanceList = [];

    for (var labour in allWorkers) {
      final labourId = labour.labourId;
      final status = _getLabourStatus(labour);

      if (status.isEmpty) {
        continue;
      }

      final overtimeHours =
          _overtimeControllers[labourId]?.text ?? '0';

      attendanceList.add({
        "labour_id": labourId,
        "status": status.toLowerCase() == 'present'
            ? 'present'
            : status.toLowerCase() == 'absent'
            ? 'absent'
            : 'Half Day',
        "overtime_hours": int.tryParse(overtimeHours) ?? 0,
        "rate_per_hour": labour.dailyRate,
      });
    }

    if (attendanceList.isEmpty) {
      Utils.showErrorMessage(context, 'Please mark attendance first');
      return;
    }

    final date = DateFormat('yyyy-MM-dd').format(selectedDate);

    bool success = await Provider.of<SaveAttendanceViewmodel>(
      context,
      listen: false,
    ).saveDailyAttendanceApi(
      date,
      attendanceList,
    );

    if (!mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, 'Attendance saved successfully');
      _fetchAttendanceForDate(selectedDate);
    } else {
      final errorMsg = Provider.of<SaveAttendanceViewmodel>(
        context,
        listen: false,
      ).errorMessage ?? 'Something went wrong';

      Utils.showErrorMessage(context, errorMsg);
    }
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
    final attendenceList = Provider.of<DailyattendenceViewModel>(context);
    final apiModel = attendenceList.dailyattendenceModel;
    if (apiModel?.date != null && apiModel!.date.isNotEmpty) {
      final parsedApiDate = DateTime.tryParse(apiModel.date);
      if (parsedApiDate != null &&
          (parsedApiDate.year != selectedDate.year ||
              parsedApiDate.month != selectedDate.month ||
              parsedApiDate.day != selectedDate.day) &&
          !attendenceList.loading) {
        // Sync selectedDate with API response date if needed
      }
    }

    final summary = apiModel?.summary;
    final allWorkersList = apiModel?.workers ?? [];
    final workers = getFilteredWorkers(apiModel?.workers);
    final canSave = _canMarkAttendance() && _isAllAttendanceMarked(allWorkersList);

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
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
          final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
          await Provider.of<DailyattendenceViewModel>(
            context,
            listen: false,
          ).AttendenceApi(date: formattedDate);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: Sizes.screenHeight * 0.016),

              Container(
                height: Sizes.screenHeight * 0.062,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9F6),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: const Color(0xFFF0E8E3),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: Sizes.screenHeight * 0.040,
                      width: Sizes.screenWidth * 0.082,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE9E2),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: Color(0xFF9E2424),
                        size: 22,
                      ),
                    ),

                    const SizedBox(width: 8),

                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          selectedDate =
                              selectedDate.subtract(const Duration(days: 1));
                        });
                        _fetchAttendanceForDate(selectedDate);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Icon(
                          Icons.chevron_left,
                          color: Color(0xFF9E2424),
                          size: 22,
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
                              color: const Color(0xFF273142),
                            ),
                          ),
                          Text(
                            DateFormat('EEEE').format(selectedDate),
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              color: const Color(0xFF777777),
                            ),
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          selectedDate =
                              selectedDate.add(const Duration(days: 1));
                        });
                        _fetchAttendanceForDate(selectedDate);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Icon(
                          Icons.chevron_right,
                          color: Color(0xFF9E2424),
                          size: 22,
                        ),
                      ),
                    ),

                    SizedBox(width: Sizes.screenWidth * 0.015),

                    InkWell(
                      borderRadius: BorderRadius.circular(7),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.symmetric(
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
                                  _fetchAttendanceForDate(selectedDate);
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
                              iconColor: AppColor.yellow,
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
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.stockUnitColor,
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  'You can mark or update attendance for this date',
                                  style: GoogleFonts.poppins(
                                    fontSize: 7.5,
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
                                      DateFormat('hh:mm a').format(DateTime.now()),
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
              Column(
                children: [
                  if (attendenceList.loading)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Circularprogressindicator(),
                      ),
                    )

                  else if (attendenceList.errorMessage != null)
                    Center(
                      child: Column(
                        children: [
                          Text(attendenceList.errorMessage!),
                          SizedBox(height: Sizes.screenHeight * 0.012),
                          CustomButton(
                            text: 'Retry',
                            onPressed: () => _fetchAttendanceForDate(selectedDate),
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
                            color: const Color(0xFF777777),
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: workers.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final labour = workers[index];
                        final labourId = labour.labourId;
                        final currentStatus = _getLabourStatus(labour);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.black,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.call,
                                              size: 10,
                                              color: AppColor.gey,
                                            ),
                                            const SizedBox(width: 3),
                                            Expanded(
                                              child: Text(
                                                labour.mobile,
                                                maxLines: 1,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 8.5,
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
                                  ),
                                  const SizedBox(width: 3),
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
                                            if (currentStatus == 'Present') {
                                              _attendanceStatus[labourId] = '';
                                            } else {
                                              _attendanceStatus[labourId] = 'Present';
                                            }
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 4),
                                      _attendanceOption(
                                        'Half',
                                        AppColor.bghalf,
                                        AppColor.texthalf,
                                        isSelected: currentStatus == 'Half Day',
                                        onTap: () {
                                          setState(() {
                                            if (currentStatus == 'Half Day') {
                                              _attendanceStatus[labourId] = '';
                                            } else {
                                              _attendanceStatus[labourId] = 'Half Day';
                                            }
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 4),
                                      _attendanceOption(
                                        'Absent',
                                        AppColor.bgbacklight,
                                        AppColor.red,
                                        isSelected: currentStatus == 'Absent',
                                        onTap: () {
                                          setState(() {
                                            if (currentStatus == 'Absent') {
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
                                      color: const Color(0xFF687386),
                                    ),
                                  ),
                                  SizedBox(width: Sizes.screenWidth * 0.015),
                                  SizedBox(
                                    width: Sizes.screenWidth * 0.14,
                                    height: Sizes.screenHeight * 0.027,
                                    child: TextField(
                                      controller: _overtimeControllers.putIfAbsent(
                                        labourId,
                                        () => TextEditingController(
                                          text: labour.overtimeHours?.toString() ?? '0',
                                        ),
                                      ),
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
                                          borderSide: const BorderSide(
                                            color: Color(0xFFDADADA),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(
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
                                      color: const Color(0xFF687386),
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
                                          borderSide: const BorderSide(
                                            color: Color(0xFFDADADA),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(
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
                                      color: const Color(0xFF687386),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: CustomButton(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  height: Sizes.screenHeight * 0.055,
                  width: Sizes.screenWidth * 0.95,
                  type: CustomButtonType.filled,
                  text: 'Save Attendance',
                  textColor: AppColor.white,
                  borderColor: AppColor.stockTitleColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  onPressed: canSave
                      ? () {
                          saveAttendance();
                        }
                      : null,
                  iconOnLeft: true,
                  icon: Icons.save,
                  iconSize: 18,
                  iconSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
            const SizedBox(width: 8),
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
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 9),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 21, color: iconColor),
          const SizedBox(width: 5),
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
                    color: const Color(0xFF555555),
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
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? textColor : Colors.transparent,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            size: 13,
            color: textColor,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 9,
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
