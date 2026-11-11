import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/viewmodel/labourpayoutview_model.dart';
import 'package:provider/provider.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantheader.dart';
import 'Constant/Constantlabourcard.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'circularprogressindicator.dart';
import 'labourpayoutdetails.dart';

class Dailypayout extends StatefulWidget {
  const Dailypayout({super.key});

  @override
  State<Dailypayout> createState() => _DailypayoutState();
}

class _DailypayoutState extends State<Dailypayout> {
  DateTime? selectedStartDate = DateTime(2026, 10, 15);
  DateTime? selectedEndDate = DateTime(2026, 10, 17);
  final TextEditingController searchController =
  TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LabourpayoutViewModel>(
        context,
        listen: false,
      ).LabourpayoutApi(
        startDate: selectedStartDate,
        endDate: selectedEndDate,
      );
    });
  }

  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final payoutVm = Provider.of<LabourpayoutViewModel>(context);
    final model = payoutVm.labourpayoutModel;
    final summary = model?.summary;
    final workers = model?.workers ?? [];

    final filteredWorkers = workers.where((worker) {
      final name = (worker.name).toLowerCase();
      final mobile = (worker.mobile).toLowerCase();
      final query = searchText.toLowerCase();

      return name.contains(query) || mobile.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColor.stockAmountColor,
          backgroundColor: Colors.white,
          displacement: 50,
          onRefresh: () async {
            await Provider.of<LabourpayoutViewModel>(
              context,
              listen: false,
            ).LabourpayoutApi(
              startDate: selectedStartDate,
              endDate: selectedEndDate,
            );
          },
          child: ListView(
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

              SizedBox(height: 10),
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

                                  Provider.of<LabourpayoutViewModel>(
                                    context,
                                    listen: false,
                                  ).LabourpayoutApi(
                                    startDate: start,
                                    endDate: end,
                                  );
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
              SizedBox(height: 10),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:  Color(0xFFFFEEE8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:  Color(0xFFF6DDD4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Sizes.screenWidth * 0.105,
                              width: Sizes.screenWidth * 0.105,
                              decoration:  BoxDecoration(
                                color: Color(0xFFFFE1D6),
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(
                                Icons.account_balance_wallet,
                                color: Color(0xFF9F1717),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Total Payout Amount",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: AppColor.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "₹ ${summary?.totalPayable ?? 0}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColor.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "${summary?.totalLabour ?? 0} Labourers",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF53616B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:  Color(0xFFFFEEE8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:  Color(0xFFF6DDD4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Sizes.screenWidth * 0.105,
                              width: Sizes.screenWidth * 0.105,
                              decoration:  BoxDecoration(
                                color: Color(0xFFFFE1D6),
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(
                                Icons.currency_exchange,
                                color: Color(0xFFD97706),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Total Advance Given",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: AppColor.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "₹ ${summary?.totalPaid ?? 0}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColor.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${summary?.totalLabour ?? 0} Labourers",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF53616B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5FBF7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Sizes.screenHeight * 0.037,
                              width: Sizes.screenWidth * 0.08,
                              decoration: BoxDecoration(
                                color: Color(0xFFDDF5E8),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.verified_user,
                                color: Color(0xFF15965B),
                                size: 22,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Present",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF626675),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "${summary?.present ?? 0} days",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF202331),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF9F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Sizes.screenHeight * 0.037,
                              width: Sizes.screenWidth * 0.08,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE9D1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.assignment_late,
                                color: Color(0xFFEF8A21),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Half Day",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF626675),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "${summary?.halfDay ?? 0} days",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF202331),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFBF7FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Sizes.screenHeight * 0.037,
                              width: Sizes.screenWidth * 0.08,
                              decoration: BoxDecoration(
                                color: Color(0xFFEDE0FF),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.access_time_filled,
                                color: Color(0xFF8738F5),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Overtime",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF626675),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "${summary?.overtimeHours ?? 0} hrs",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF202331),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),

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
              SizedBox(height: 5),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Labour List (${filteredWorkers.length})",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.red,
                        ),
                      ),

                      Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFBF8),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Color(0xFFECE5E0),
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: "Name (A-Z)",
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                              color: Color(0xFF343434),
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Color(0xFF252525),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "Name (A-Z)",
                                child: Text("Name (A-Z)"),
                              ),
                              DropdownMenuItem(
                                value: "Name (Z-A)",
                                child: Text("Name (Z-A)"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4),

              if (payoutVm.loading)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Circularprogressindicator(),
                  ),
                )
              else if (payoutVm.errorMessage != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Column(
                      children: [
                        Text(payoutVm.errorMessage!),
                        SizedBox(height: 10),
                        CustomButton(
                          text: 'Retry',
                          onPressed: payoutVm.LabourpayoutApi,
                        ),
                      ],
                    ),
                  ),
                )
              else
                ListView.builder(
                  itemCount: filteredWorkers.length,
                  shrinkWrap: true,
                  physics:  NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final worker = filteredWorkers[index];
                    return CustomLabourCard(
                      name: worker.name,
                      dailyRate: worker.dailyRate,
                      presentDays: worker.breakdown.present,
                      halfDays: worker.breakdown.halfDay,
                      amount: worker.payableAmount,
                      advance: worker.paidAmount,
                      isNoAdvance: worker.paidAmount == 0,
                      icon: Icons.person,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Labourpayoutdetails()));
                      },
                    );
                  },
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
