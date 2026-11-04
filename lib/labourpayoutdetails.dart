import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/paymenthistory.dart';

import 'Constant/Constantadvancepaymnet.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantheader.dart';

class Labourpayoutdetails extends StatefulWidget {
  Labourpayoutdetails({super.key});

  @override
  State<Labourpayoutdetails> createState() => _LabourpayoutdetailsState();
}

class _LabourpayoutdetailsState extends State<Labourpayoutdetails> {
  final TextEditingController amountController =
  TextEditingController( text: "1200");
  String selectedPayment = 'Cash';
  String selectedPaymentbtn = 'Save Payment';
  DateTime? selectedPaymentDate = DateTime(2026, 10, 17);
  DateTime? selectedStartDate = DateTime(2026, 10, 15);
  DateTime? selectedEndDate = DateTime(2026, 10, 17);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35),
            CustomHeader(),
          SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Labour payout Details',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF782A17),
                          ),
                        ),
                        Text(
                          'View details and make payment',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF66615D),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Paymenthistory()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF963A20),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 9,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Payment History',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xFFF0E8E3),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: Sizes.screenHeight * 0.055,
                  width: Sizes.screenWidth * 0.092,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFEFEB),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 28,
                    color: Color(0xFF963025),
                  ),
                ),

                SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rajesh Kumar',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF172033),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Labour ID: LAB-001',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF687386),
                        ),
                      ),
                      Text(
                        'Mobile: 9876543210',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF687386),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 55,
                  width: 1,
                  color: Color(0xFFE5E5E5),
                ),

                SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Daily Rate',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Color(0xFF687386),
                      ),
                    ),
                    Text(
                      '₹ 600',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF963025),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
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
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Attendance Summary ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColor.red,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
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
                                  "12 days",
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
                                  "3 days",
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
                                  "4 hrs",
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
              ],
            ),
          ),
          SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: Color(0xFFF0E8E3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Calculation',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColor.red,
                    ),
                  ),

                  SizedBox(height: 3),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Attendance Amount (3 × 600)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF687386),
                          ),
                        ),
                        Text(
                          '₹ 1,800',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF172033),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 5, thickness: 0.5, color: Color(0xFFEAEAEA)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Half Day (1 × 300)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF687386),
                          ),
                        ),
                        Text(
                          '₹ 300',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF172033),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 5, thickness: 0.5, color: Color(0xFFEAEAEA)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overtime (2 hrs × 150)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF687386),
                          ),
                        ),
                        Text(
                          '₹ 300',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF172033),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0ED),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Earned',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.red,
                          ),
                        ),
                        Text(
                          '₹ 2,400',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColor.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Less: Advance Paid (Outstanding)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF687386),
                          ),
                        ),
                        Text(
                          '− ₹ 500',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColor.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Less: Previous Payments',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xFF687386),
                          ),
                        ),
                        Text(
                          '− ₹ 0',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.red,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 3),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0ED),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remaining Payable',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColor.red,
                          ),
                        ),
                        Text(
                          '₹ 1,900',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.red,
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
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: Color(0xFFF0E8E3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Make Payment',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColor.red,
                    ),
                  ),

                  SizedBox(height: 5),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF172033),
                                ),
                                children: [
                                  TextSpan(text: 'Payment Amount '),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: Sizes.screenHeight * 0.045,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFDADADA),
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee,
                                    size: 17,
                                    color: Color(0xFF45505E),
                                  ),
                                  SizedBox(width: 5),

                                  Expanded(
                                    child: TextField(
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Color(0xFF172033),
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 12),


                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Date',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Color(0xFF172033),
                              ),
                            ),

                            SizedBox(height: 8),

                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: CustomCalendar(
                                        isRange: false,
                                        selectedDate: selectedPaymentDate,
                                        onDateSelected: (date) {
                                          setState(() {
                                            selectedPaymentDate = date;
                                          });

                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                height: Sizes.screenHeight * 0.045,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFDADADA),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 17,
                                      color: Color(0xFF45505E),
                                    ),

                                    SizedBox(width: 7),

                                    Expanded(
                                      child:   Text(
                                          selectedPaymentDate == null
                                              ? 'Select Date'
                                              : DateFormat('dd MMM yyyy').format(selectedPaymentDate!),
                                        )
                                    ),

                                    Icon(
                                      Icons.chevron_right,
                                      size: 19,
                                      color: Color(0xFF963025),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),

                  SizedBox(height: 10),

                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Color(0xFF172033),
                      ),
                      children: [
                        TextSpan(text: 'Payment Mode '),
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPayment = 'Cash';
                            });
                          },
                          child: Container(
                            height: Sizes.screenHeight * 0.045,
                            decoration: BoxDecoration(
                              color: selectedPayment == 'Cash'
                                  ? Color(0xFFFFF2EE)
                                  : Colors.white,
                              border: Border.all(
                                color: selectedPayment == 'Cash'
                                    ? Color(0xFF963025)
                                    : Color(0xFFE0E0E0),
                                width: selectedPayment == 'Cash' ? 1.2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.payments,
                                  size: 19,
                                  color: selectedPayment == 'Cash'
                                      ? Color(0xFF963025)
                                      : Color(0xFF45505E),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Cash',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: selectedPayment == 'Cash'
                                        ? Color(0xFF782A17)
                                        : Color(0xFF172033),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPayment = 'UPI';
                            });
                          },
                          child: Container(
                            height: Sizes.screenHeight * 0.045,
                            decoration: BoxDecoration(
                              color: selectedPayment == 'UPI'
                                  ? Color(0xFFFFF2EE)
                                  : Colors.white,
                              border: Border.all(
                                color: selectedPayment == 'UPI'
                                    ? Color(0xFF963025)
                                    : Color(0xFFE0E0E0),
                                width: selectedPayment == 'UPI' ? 1.2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send,
                                  size: 18,
                                  color: selectedPayment == 'UPI'
                                      ? Color(0xFF963025)
                                      : Color(0xFF45505E),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'UPI',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: selectedPayment == 'UPI'
                                        ? Color(0xFF782A17)
                                        : Color(0xFF172033),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPayment = 'Advance';
                            });
                          },
                          child: Container(
                            height: Sizes.screenHeight * 0.045,
                            decoration: BoxDecoration(
                              color: selectedPayment == 'Advance'
                                  ? Color(0xFFFFF2EE)
                                  : Colors.white,
                              border: Border.all(
                                color: selectedPayment == 'Advance'
                                    ? Color(0xFF963025)
                                    : Color(0xFFE0E0E0),
                                width: selectedPayment == 'Advance' ? 1.2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 18,
                                  color: selectedPayment == 'Advance'
                                      ? Color(0xFF963025)
                                      : Color(0xFF45505E),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Advance',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: selectedPayment == 'Advance'
                                        ? Color(0xFF782A17)
                                        : Color(0xFF172033),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11),
                  Text(
                    'Notes (Optional)',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF172033),
                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    height: Sizes.screenHeight * 0.045,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFDADADA),
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add payment notes...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Color(0xFF8993A1),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF172033),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPaymentbtn = 'Give Advance';
                            });

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return GiveAdvancePopup();
                              },
                            );
                          },
                          child: Container(
                            height: Sizes.screenHeight * 0.050,
                            decoration: BoxDecoration(
                              color: selectedPaymentbtn == 'Give Advance'
                                  ? Color(0xFF963025)
                                  : Color(0xFFFFF2EE),
                              border: Border.all(
                                color: Color(0xFF963025),
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.volunteer_activism,
                                  size: 20,
                                  color: selectedPaymentbtn == 'Give Advance'
                                      ? Colors.white
                                      : Color(0xFF963025),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Give Advance',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: selectedPaymentbtn == 'Give Advance'
                                        ? Colors.white
                                        : Color(0xFF963025),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPaymentbtn = 'Save Payment';
                            });
                          },
                          child: Container(
                            height: Sizes.screenHeight * 0.050,
                            decoration: BoxDecoration(
                              color: selectedPaymentbtn == 'Save Payment'
                                  ? Color(0xFF963025)
                                  : Color(0xFFFFF2EE),
                              border: Border.all(
                                color: Color(0xFF963025),
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save,
                                  size: 20,
                                  color: selectedPaymentbtn == 'Save Payment'
                                      ? Colors.white
                                      : Color(0xFF963025),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Save Payment',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: selectedPaymentbtn == 'Save Payment'
                                        ? Colors.white
                                        : Color(0xFF963025),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
      ),

      ),
    );
  }
  Widget _attendanceSummaryItem({
    required IconData icon,
    required String value,
    required String title,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      height: Sizes.screenHeight * 0.057,
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 19,
            color: iconColor,
          ),
          SizedBox(width: 5),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
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
