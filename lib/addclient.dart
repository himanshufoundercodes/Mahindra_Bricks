import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'clientdetails.dart';
import 'clients.dart';

class Addclient extends StatefulWidget {
  Addclient({super.key});

  @override
  State<Addclient> createState() => _AddclientState();
}

class _AddclientState extends State<Addclient> {
  final Color brown = Color(0xFF702B1C);
  final Color backgroundColor = Color(0xFFFEF6F3);
  final Color borderColor = Color(0xFFE5E0DD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Sizes.screenHeight * 0.070,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: brown,
                              size: 27,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 55,
                            width: 55,
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
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'MAHINDRA BRICKS',
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: brown,
                                  height: 1.2,
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
                          Spacer(),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 16,
                        top: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Client',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: brown,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            'Create a new customer',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Color(0xFF6F747B),
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Card 1: Client Information
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFF1EAE6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Heading
                          Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.052,
                                width: Sizes.screenWidth * 0.105,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFEFEB),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.domain,
                                  color: brown,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Client Information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: brown,
                                      ),
                                    ),
                                    Text(
                                      'Enter client basic information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Color(0xFF858B94),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18),

                          // Company Name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF34404B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(text: 'Company Name '),
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
                              SizedBox(height: 6),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: TextField(
                                  style: GoogleFonts.poppins(fontSize: 12),
                                  decoration: InputDecoration(
                                    hintText: 'Enter company name',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF858B94),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.domain,
                                      size: 18,
                                      color: Color(0xFF646B72),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 40,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFCFCFC),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: brown),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),

                          // Contact Person Name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Person Name',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF34404B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 6),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: TextField(
                                  style: GoogleFonts.poppins(fontSize: 12),
                                  decoration: InputDecoration(
                                    hintText:
                                        'Enter contact person name (optional)',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF858B94),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 18,
                                      color: Color(0xFF646B72),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 40,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFCFCFC),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: brown),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),

                          // Mobile Number
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF34404B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Mobile Number ',
                                    ),
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
                              SizedBox(height: 6),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter mobile number',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF858B94),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 18,
                                      color: Color(0xFF646B72),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 40,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFCFCFC),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: brown),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),

                          // Alternate Mobile Number
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alternate Mobile Number',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF34404B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 6),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter alternate number (optional)',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xFF858B94),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 18,
                                      color: Color(0xFF646B72),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 40,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFCFCFC),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: brown),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Card 2: Address Information
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFF1EAE6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Heading
                          Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.052,
                                width: Sizes.screenWidth * 0.105,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFEFEB),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  color: brown,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Address Information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: brown,
                                      ),
                                    ),
                                    Text(
                                      'Enter client address details',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Color(0xFF858B94),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18),

                          // Address Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Color(0xFF34404B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 6),
                              TextField(
                                maxLines: 4,
                                style: GoogleFonts.poppins(fontSize: 14),
                                decoration: InputDecoration(
                                  hintText: 'Enter complete address',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.home,
                                    size: 30,
                                    color: Color(0xFF646B72),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 40,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFCFCFC),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: brown),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),

            // Fixed Bottom Action Buttons (Cancel & Save)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red.shade600,
                        side: BorderSide(
                          color: Colors.red.shade200,
                          width: 1.2,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.red.shade600,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Clients()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brown,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Save Client',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
