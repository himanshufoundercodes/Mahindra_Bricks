import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'Constant/Constantbutton.dart';
import 'Constant/Constantheader.dart';

class Addlabour extends StatefulWidget {
  Addlabour({super.key});

  @override
  State<Addlabour> createState() => _AddlabourState();
}

class _AddlabourState extends State<Addlabour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7),
              CustomHeader(),
              SizedBox(height: 12),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Labour",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF991B12),
                        height: 1.2,
                      ),
                    ),
                    Text(
                      "Create a new labour worker",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Color(0xFF7B8490),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFEFE),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFF1EAE7),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.05,
                          width: Sizes.screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCEBE8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.engineering,
                            size: 29,
                            color: Color(0xFF8F281B),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Labour Information",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF991B12),
                              ),
                            ),
                            Text(
                              "Enter labour basic details",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF7B8490),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 14),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Labour Name ",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF17233D),
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter labour name",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF8993A0),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF737980),
                          size: 21,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFF991B12)),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Mobile Number ",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF17233D),
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Enter mobile number",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF8993A0),
                        ),
                        prefixIcon: Icon(
                          Icons.call,
                          color: Color(0xFF737980),
                          size: 21,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFF991B12)),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Daily Rate (₹) ",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF17233D),
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter daily rate",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xFF8993A0),
                        ),
                        prefixIcon: Icon(
                          Icons.currency_rupee,
                          color: Color(0xFF737980),
                          size: 21,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xFF991B12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 19,
                            color: Color(0xFFB22222),
                          ),
                          label: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFB22222),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color(0xFFFF6B6B),
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.save,
                            size: 19,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Save Labour",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF982619),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
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
