
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'Loginpage.dart';

class MahindraSplashScreen extends StatefulWidget {
  const MahindraSplashScreen({super.key});

  @override
  State<MahindraSplashScreen> createState() =>
      _MahindraSplashScreenState();
}

class _MahindraSplashScreenState
    extends State<MahindraSplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed( Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  Loginpage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/splash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.09,
            left: 10,
            right: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  padding:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  Color(0xFF9B543C),
                      width: 3.5,
                    ),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                 SizedBox(height: 3),
                 Text(
                  'MAHINDRA BRICKS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF793D2C),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.9,
                  ),
                ),
                 SizedBox(height: 2),
                 Text(
                  'P A V E R   B L O C K S',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF9B543C),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 1,
                      color:  Color(0xFFB9A28A),
                    ),

                     SizedBox(width: 8),
                     Text(
                      "STRONGER FOUNDATIONS",
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Color(0xFF654735),
                        letterSpacing: 1.2,
                      ),
                    ),

                     SizedBox(width: 8),
                    Container(
                      width: 35,
                      height: 1,
                      color: const Color(0xFFB9A28A),
                    ),
                  ],
                ),
                Text(
                  "FOR A BETTER TOMORROW",
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    color: Color(0xFF654735),
                    letterSpacing: 1.2,
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:  LinearProgressIndicator(
                          backgroundColor: Colors.white38,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Loading...',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
