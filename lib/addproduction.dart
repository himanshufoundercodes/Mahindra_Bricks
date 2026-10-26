import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'Constant/Constantcustomecalender.dart';

class AddProduction extends StatefulWidget {
  AddProduction({super.key});

  @override
  State<AddProduction> createState() => _AddProductionState();
}

class _AddProductionState extends State<AddProduction> {
  DateTime? selectedPaymentDate = DateTime(2026, 10, 17);
  final Color brown = Color(0xFF84301D);
  final Color backgroundColor = Color(0xFFFFF8F1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: Sizes.screenHeight * 0.095,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: brown.withOpacity(0.10),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: brown,
                        size: 24,
                      ),
                    ),

                    SizedBox(width: 35),

                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: brown.withOpacity(0.65),
                          width: 1.2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(width: 7),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'MAHINDRA BRICKS',
                              style: TextStyle(
                                color: brown,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                          Text(
                            'P A V E R   B L O C K S',
                            style: TextStyle(
                              color: Color(0xFF84301D),
                              fontSize: 9,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 12,
                  bottom: 10,
                ),
                color: Color(0xFFFFF8F1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Production',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7D1F12),
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      "Record today's brick or paver block production",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFF1E8E2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF0EA),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF842719),
                            size: 22,
                          ),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Production Date',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7D2015),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Select the date of production',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Color(0xFF757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              child: CustomCalendar(
                                isRange: false,
                                onDateSelected: (date) {
                                  setState(() {
                                    selectedPaymentDate = date;
                                  });

                                  Navigator.pop(dialogContext);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: Sizes.screenHeight * 0.052,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFCFA),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFFE5DDD7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 17,
                              color: Color(0xFF666666),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                selectedPaymentDate == null
                                    ? 'Select date'
                                    : '${selectedPaymentDate!.day.toString().padLeft(2, '0')} '
                                    '${[
                                  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                                  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                                ][selectedPaymentDate!.month - 1]} '
                                    '${selectedPaymentDate!.year}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF292929),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 22,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFF1E8E2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF0EA),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.inventory_2_outlined,
                            color: Color(0xFF842719),
                            size: 23,
                          ),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2. Select Product',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7D2015),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Choose the brick or paver block',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Container(
                      height: 57,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFCFA),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Color(0xFFE5DDD7),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 68,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF0E8),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                              child: Image.asset(
                                'assets/bricks.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Red Bricks (Standard)',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Code: RB-001 | Size: 230 × 110 × 70 mm',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 5),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 23,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBF9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCE9E4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.business,
                            color: Color(0xFF8B2116),
                            size: 30,
                          ),
                        ),

                        SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. Production Quantity',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF702016),
                              ),
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Enter total pieces produced today',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF687078),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Container(
                          height: 42,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFAF7),
                            border: Border.all(
                              color: Color(0xFFD8D8D8),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.inventory_2,
                            color: Color(0xFF62666A),
                            size: 20,
                          ),
                        ),

                        Expanded(
                          child: Container(
                            height: 42,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFD8D8D8),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '5000',
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 42,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            border: Border.all(
                              color: Color(0xFFD8D8D8),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Pieces',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xFF707078),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBF7),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Color(0xFFF3ECE6),
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 12,
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7ECE5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  'assets/bricks.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Red Bricks (Standard)',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF731209),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Code: RB-001',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF757575),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Size: 230 × 110 × 70 mm',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF757575),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Colour: Red',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF757575),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          width: 1,
                          color: Color(0xFFEBE3DD),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFCE9E4),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.inventory_2,
                                    color: Color(0xFF731209),
                                    size: 18,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Current Stock',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF757575),
                                        ),
                                      ),
                                      Text(
                                        '15,000',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Pieces',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF757575),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFEAF5EE),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD6F0E0),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.settings,
                                      color: Color(0xFF0F7D41),
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'After Production',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF0F7D41),
                                          ),
                                        ),
                                        Text(
                                          '20,000',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF0F7D41),
                                          ),
                                        ),
                                        Text(
                                          'Pieces',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF0F7D41),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: OutlinedButton(
                          onPressed: () {

                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF7B2117),
                            side: const BorderSide(
                              color: Color(0xFF7B2117),
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child:  Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Save Production Button
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF91321D),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.save,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Save Production',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
