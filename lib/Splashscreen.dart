
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'Constant/Constant_bottomnav.dart';
import 'Loginpagenew.dart';
import 'core/storage/login_sharedpreferences.dart';

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
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {

    await Future.delayed(Duration(seconds: 3));

    if (!mounted) return;

    String? token = await PreferenceService.getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CustomBottomNavBar(),
        ),
      );

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Loginpagenew(),
        ),
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Sizes.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding:  EdgeInsets.only(top: Sizes.screenHeight * 0.095),
                  child: Container(
                    width: Sizes.screenWidth * 0.35,
                    height: Sizes.screenWidth * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/logo.jpg"),),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:  AppColor.stockUnitColor,
                        width: Sizes.screenWidth * 0.01,
                      ),
                      color: AppColor.white,
                    ),
                  ),
                ),
                Text(
                  'MAHINDRA BRICKS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColor.stockTitleColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.9,
                  ),
                ),
                Text(
                  'P A V E R   B L O C K S',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColor.stockTitleColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Sizes.screenWidth * 0.1,
                      height: Sizes.screenHeight * 0.002,
                      color: AppColor.lineColor,
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.02),
                    Text(
                      "STRONGER FOUNDATIONS",
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: AppColor.stockTitleColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.02),
                    Container(
                      width: Sizes.screenWidth * 0.1,
                      height: Sizes.screenHeight * 0.002,
                      color: AppColor.lineColor,
                    ),
                  ],
                ),
                Text(
                  "FOR A BETTER TOMORROW",
                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    color: AppColor.stockTitleColor,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: Sizes.screenWidth * 0.30,
                    height: Sizes.screenHeight * 0.005,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:  LinearProgressIndicator(
                        backgroundColor: AppColor.white38,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(
                          AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizes.screenHeight * 0.005),
                  Text(
                    'Loading...',
                    style: GoogleFonts.poppins(
                      color:AppColor.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Sizes.screenHeight * 0.05),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
