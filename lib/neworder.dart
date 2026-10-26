import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant_Color.dart';

import 'Constant/Constantbutton.dart';
import 'Constant/Sizes.dart';
import 'addclient.dart';

class Neworder extends StatefulWidget {
  Neworder({super.key});

  @override
  State<Neworder> createState() => _NeworderState();
}

class _NeworderState extends State<Neworder> {
  final Color brown = Color(0xFF702B1C);
  final Color backgroundColor = Color(0xFFFEF6F3);
  final Color borderColor = Color(0xFFE5E0DD);

  String? selectedClient;

  final List<String> clients = [
    'Sharma Construction',
    'Gupta Builders',
    'Singh Construction',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Sizes.screenWidth * 0.15,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: brown, size: 27),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFB58B76),
                          width: 1.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
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
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: brown,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Text(
                            'P A V E R   B L O C K S',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              letterSpacing: 0.5,
                              color: brown,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                            'New Order',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor
                            ),
                          ),
                          Text(
                            'Create a new sales order',
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
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.stockTitleColor,
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
                          Icon(Icons.add, size: 15),
                          SizedBox(width: 3),
                          Text(
                            'New Order',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.fromLTRB(13, 10, 13, 13),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFDFC),
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Color(0xFFF1EAE6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.047,
                          width: Sizes.screenWidth * 0.095,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEFEB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.person, color: brown, size: 28),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Client Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: brown,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addclient(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: brown,
                            side: BorderSide(color: brown.withOpacity(0.65)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            minimumSize: Size(0, 34),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, size: 18),
                              SizedBox(width: 5),
                              Text(
                                'Add New Client',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Color(0xFF34404B),
                        ),
                        children: [
                          TextSpan(text: 'Select Client '),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.poppins(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFFCFCFC),
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xFF646B72),
                            size: 21,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedClient,
                                isExpanded: true,
                                hint: Text(
                                  'Search client name or mobile number',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21,
                                  color: Color(0xFF555B62),
                                ),
                                items: clients.map((client) {
                                  return DropdownMenuItem<String>(
                                    value: client,
                                    child: Text(
                                      client,
                                      style: GoogleFonts.poppins(fontSize: 12),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedClient = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile Number',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF34404B),
                                ),
                              ),
                              SizedBox(height: 3),
                              SizedBox(
                                height: Sizes.screenHeight * 0.052,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  style: GoogleFonts.poppins(fontSize: 11),
                                  decoration: InputDecoration(
                                    hintText: 'Enter mobile number',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF858B94),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.call,
                                      size: 17,
                                      color: Color(0xFF646B72),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 38,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 10,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFCFCFC),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(color: brown),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 11),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF34404B),
                                  ),
                                  children: [
                                    TextSpan(text: 'Delivery Address '),
                                    TextSpan(
                                      text: '*',
                                      style: GoogleFonts.poppins(
                                        color: Colors.red.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: TextField(
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(fontSize: 11),
                                  decoration: InputDecoration(
                                    hintText: 'Enter delivery address',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF858B94),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Color(0xFF646B72),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 38,
                                      minHeight: 40,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 10,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFCFCFC),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(color: brown),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF0E6E0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.034,
                            width: Sizes.screenWidth * 0.07,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.inventory_2,
                              color: Color(0xFF8B291C),
                              size: 18,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Product Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Product ',
                              style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFF34404B)),
                            ),
                            TextSpan(
                              text: '*',
                              style: GoogleFonts.poppins(fontSize: 11, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: Sizes.screenHeight * 0.052,
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFFCFCFC),
                                border: Border.all(color: Color(0xFFDDE0E3)),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: Sizes.screenHeight * 0.034,
                                    width: Sizes.screenWidth * 0.07,
                                    color: Color(0xFFF9E9E2),
                                    child: Image.asset(
                                      'assets/bricks.jpg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(width: 6),
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
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF263747),
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        Text(
                                          '230 × 110 × 70 mm  |  Red',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            color: Color(0xFF687078),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 18,
                                    color: Color(0xFF59636F),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: Sizes.screenHeight * 0.052,
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F7F1),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Available Stock',
                                    style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Color(0xFF59636F),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    '50,000 pcs',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF24713C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Quantity (pcs) ',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Color(0xFF34404B)),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.039,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.poppins(fontSize: 11),
                                    decoration: InputDecoration(
                                      hintText: 'Enter quantity',
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Color(0xFF858B94),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.inventory_2_outlined,
                                        size: 16,
                                        color: Color(0xFF59636F),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 28,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Rate (₹) ',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Color(0xFF34404B)),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.039,
                                  child: TextField(
                                    keyboardType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    style: GoogleFonts.poppins(fontSize: 11),
                                    decoration: InputDecoration(
                                      hintText: 'Enter rate',
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Color(0xFF858B94),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.currency_rupee,
                                        size: 15,
                                        color: Color(0xFF59636F),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 26,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              height: Sizes.screenHeight * 0.059,
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF0EE),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item Total',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Color(0xFF81241B),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    '₹ 0.00',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.stockTitleColor,
                                    ),
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
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFF0E6E0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.042,
                            width: Sizes.screenWidth * 0.085,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.calculate,
                              size: 23,
                              color: Color(0xFF81241B),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Amount Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            Text(
                              '₹ 0.00',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF172A40),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFEDE3DE),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transport Charge',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFEDE3DE),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Labour Charge',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFEDE3DE),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount (Optional)',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                            Text(
                              '₹ 0.00',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFF0E6E0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.040,
                            width: Sizes.screenWidth * 0.080,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.account_balance_wallet,
                              size: 22,
                              color: Color(0xFF81241B),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Payment Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Advance Amount',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF34404B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.043,
                                  child: TextField(
                                    keyboardType: TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    style: GoogleFonts.poppins(fontSize: 12),
                                    decoration: InputDecoration(
                                      hintText: 'Enter advance amount',
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Color(0xFF858B94),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.currency_rupee,
                                        size: 18,
                                        color: Color(0xFF59636F),
                                      ),
                                      prefixIconConstraints: BoxConstraints(minWidth: 30),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                      filled: true,
                                      fillColor: Color(0xFFFCFCFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color(0xFF81241B),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Mode',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF34404B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.043,
                                  child: DropdownButtonFormField<String>(
                                    value: 'Credit',
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF263747),
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 9),
                                      filled: true,
                                      fillColor: Color(0xFFFCFCFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'Credit',
                                        child: Text('Credit'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Cash',
                                        child: Text('Cash'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'UPI',
                                        child: Text('UPI'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Bank Transfer',
                                        child: Text('Bank Transfer'),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Remaining Balance',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                            Text(
                              '₹ 0.00',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SaveCancelButtons(
                  saveText: 'Save Order',
                  onCancel: () {},
                  onSave: () {},
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
