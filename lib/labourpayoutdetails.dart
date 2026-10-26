import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/paymenthistory.dart';

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
  DateTime? selectedPaymentDate = DateTime(2026, 10, 17);
  DateTime? selectedStartDate = DateTime(2026, 10, 15);
  DateTime? selectedEndDate = DateTime(2026, 10, 17);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
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
          // CustomDateSelector(),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFF0E8E3),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Attendance Summary (15 Oct – 17 Oct)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF782A17),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View Details',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF782A17),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: _attendanceSummaryItem(
                        icon: Icons.check_circle,
                        value: '3',
                        title: 'Present',
                        iconColor: Color(0xFF16833B),
                        bgColor: Color(0xFFE8F8ED),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: _attendanceSummaryItem(
                        icon: Icons.watch_later,
                        value: '0',
                        title: 'Half Day',
                        iconColor: Color(0xFFC46A12),
                        bgColor: Color(0xFFFFF3E4),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: _attendanceSummaryItem(
                        icon: Icons.close,
                        value: '0',
                        title: 'Absent',
                        iconColor: Color(0xFFC62828),
                        bgColor: Color(0xFFFFEEEE),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: _attendanceSummaryItem(
                        icon: Icons.access_time,
                        value: '4',
                        title: 'Overtime(Hrs)',
                        iconColor: Color(0xFF7045B5),
                        bgColor: Color(0xFFF1E9FF),
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
                  'Amount Calculation',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF782A17),
                  ),
                ),

                SizedBox(height: 5),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Present (3 × ₹600)',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
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

                Divider(
                  height: 7,
                  thickness: 0.5,
                  color: Color(0xFFEAEAEA),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Half Day (0 × ₹300)',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Color(0xFF687386),
                        ),
                      ),
                      Text(
                        '₹ 0',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF172033),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 7,
                  thickness: 0.5,
                  color: Color(0xFFEAEAEA),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overtime (4 hrs × ₹150)',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Color(0xFF687386),
                        ),
                      ),
                      Text(
                        '₹ 600',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF172033),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF0ED),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payable Amount',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF782A17),
                        ),
                      ),
                      Text(
                        '₹ 2,400',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF963025),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                color: Color(0xFFF0E8E3),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: Sizes.screenWidth * 0.30,
                    height: Sizes.screenHeight * 0.065,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F9F0),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFD5F3E1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.currency_rupee,
                            size: 19,
                            color: Color(0xFF16833B),
                          ),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹ 1,200',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF16833B),
                                ),
                              ),
                              Text(
                                'Total Paid',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Color(0xFF5D6470),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8),

                  Container(
                    width: Sizes.screenWidth * 0.30,
                    height: Sizes.screenHeight * 0.065,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFEEEE),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDCDC),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.monetization_on,
                            size: 21,
                            color: Color(0xFFC62828),
                          ),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹ 1,200',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFC62828),
                                ),
                              ),
                              Text(
                                'Remaining',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Color(0xFF5D6470),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8),

                  Container(
                    width: Sizes.screenWidth * 0.30,
                    height: Sizes.screenHeight * 0.065,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF5FF),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFD8EAFE),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.currency_rupee,
                            size: 21,
                            color: Color(0xFF1763B5),
                          ),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₹ 0',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF17396B),
                                ),
                              ),
                              Text(
                                "Today's Payment",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  color: Color(0xFF5D6470),
                                ),
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
                      color: Color(0xFF782A17),
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
                      // Cash
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
                                SizedBox(width: 6),
                                Text(
                                  'Cash',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
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
                      SizedBox(width: 10),
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
                                SizedBox(width: 6),
                                Text(
                                  'UPI',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
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
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Notes (Optional)',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF172033),
                    ),
                  ),

                  SizedBox(height: 8),

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
                        fontSize: 11,
                        color: Color(0xFF172033),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  Container(
                    height: Sizes.screenHeight * 0.050,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF963025),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.save,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Save Payment',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
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
