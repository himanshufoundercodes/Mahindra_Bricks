import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabourSummaryCard extends StatelessWidget {
  final String name;
  final String mobile;
  final String present;
  final String halfDay;
  final String absent;
  final String overtimeHours;
  final String payable;
  final String paid;
  final String remaining;
  final VoidCallback? onTap;

  LabourSummaryCard({
    super.key,
    required this.name,
    required this.mobile,
    required this.present,
    required this.halfDay,
    required this.absent,
    required this.overtimeHours,
    required this.payable,
    required this.paid,
    required this.remaining,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFF0E8E3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Color(0xFFFFEFEB),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 18,
              color: Color(0xFF963025),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF172033),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  mobile,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF687386),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _detailItem(
                        value: present,
                        title: 'Present',
                        bgColor: Color(0xFFE5F8E9),
                        valueColor: Color(0xFF267A40),
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: _detailItem(
                        value: halfDay,
                        title: 'Half Day',
                        bgColor: Color(0xFFFFF1E5),
                        valueColor: Color(0xFFAD5428),
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: _detailItem(
                        value: absent,
                        title: 'Absent',
                        bgColor: Color(0xFFFFE9E9),
                        valueColor: Color(0xFFC62828),
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: _detailItem(
                        value: overtimeHours,
                        title: 'OT (Hrs)',
                        bgColor: Color(0xFFF0E9FF),
                        valueColor: Color(0xFF49358A),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: _paymentItem(
                        value: '₹ $payable',
                        title: 'Payable',
                        color: Color(0xFF963025),
                      ),
                    ),
                    Expanded(
                      child: _paymentItem(
                        value: '₹ $paid',
                        title: 'Paid',
                        color: Color(0xFF267A40),
                      ),
                    ),
                    Expanded(
                      child: _paymentItem(
                        value: '₹ $remaining',
                        title: 'Remaining',
                        color: Color(0xFF963025),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 2),
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Icon(
                Icons.chevron_right,
                size: 22,
                color: Color(0xFF963025),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailItem({
    required String value,
    required String title,
    required Color bgColor,
    required Color valueColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 1,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: valueColor,
              ),
            ),
          ),
          SizedBox(height: 0.5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontSize: 6.5,
                color: Color(0xFF596273),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentItem({
    required String value,
    required String title,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            maxLines: 1,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
        SizedBox(height: 0.5),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            maxLines: 1,
            style: GoogleFonts.poppins(
              fontSize: 7.5,
              color: Color(0xFF687386),
            ),
          ),
        ),
      ],
    );
  }
}
