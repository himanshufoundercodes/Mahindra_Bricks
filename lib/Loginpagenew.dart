import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/loginview_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant/Constant_Color.dart';
import 'Constant/Constant_bottomnav.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';

class Loginpagenew extends StatefulWidget {
  const Loginpagenew({super.key});

  @override
  State<Loginpagenew> createState() => _LoginpagenewState();
}

class _LoginpagenewState extends State<Loginpagenew> {
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin() async {
    final success = await context.read<LoginViewModel>().loginApi(
      emailController.text,
      passwordController.text,
    );

    if (!context.mounted) return;

    if (success) {
      Utils.showSuccessMessage(
        context,
        "Login Successfully!",
      );

      await Future.delayed(Duration(milliseconds: 500));

      if (!context.mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => CustomBottomNavBar(),
        ),
      );

    } else {
      final message =
          context.read<LoginViewModel>().errorMessage ?? 'Login failed';
      Utils.showErrorMessage(
        context,
        message,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
   final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: false,
        bottom: true,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
               width: Sizes.screenWidth,
              height: Sizes.screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login.jpg'),
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
                        padding: EdgeInsets.only(
                          top: Sizes.screenHeight * 0.065,
                        ),
                        child: Container(
                          width: Sizes.screenWidth * 0.27,
                          height: Sizes.screenWidth * 0.27,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logo.jpg"),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColor.stockUnitColor,
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
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome Back',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                          Text(
                            'Login to your Mahindra Bricks account\n'
                                'to manage your factory operations',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColor.gey,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.015),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.screenHeight * 0.010,
                            ),
                            child: Column(
                              children: [
                                AppTextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: 'Email Address',
                                  prefixIcon: Icons.email_outlined,
                                ),
                                SizedBox(height: Sizes.screenHeight * 0.012),
                                AppTextField(
                                  controller: passwordController,
                                  obscureText: !isPasswordVisible,
                                  hintText: 'Password',
                                  prefixIcon: Icons.lock_outline,
                                ),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.012,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.012),
                          Column(
                            children: [
                              CustomButton(
                                text: 'Login',
                                isLoading: loginViewModel.loading,
                                onPressed: () async {
                                  await handleLogin();
                                },
                                iconOnLeft: false,
                                icon: Icons.arrow_forward,
                              ),

                              SizedBox(
                                height: Sizes.screenHeight * 0.012,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Sizes.screenWidth * 0.28,
                                    height: Sizes.screenHeight * 0.001,
                                    color: AppColor.lineColor,
                                  ),
                                  SizedBox(
                                    width: Sizes.screenWidth * 0.02,
                                  ),
                                  Text(
                                    "OR",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: AppColor.stockTitleColor,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Sizes.screenWidth * 0.02,
                                  ),
                                  Container(
                                    width: Sizes.screenWidth * 0.30,
                                    height: Sizes.screenHeight * 0.001,
                                    color: AppColor.lineColor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Sizes.screenHeight * 0.012,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: Sizes.screenHeight * 0.040,
                                        width: Sizes.screenWidth * 0.090,
                                        decoration: BoxDecoration(
                                          color: AppColor.bgback,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/login1.jpg',
                                          height: Sizes.screenHeight * 0.030,
                                          width: Sizes.screenWidth * 0.065,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Sizes.screenHeight * 0.0052,
                                      ),
                                      Text(
                                        'Quality\nBricks',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.stockTitleColor,
                                          height: 1.3,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: Sizes.screenHeight * 0.058,
                                    width: Sizes.screenWidth * 0.0035,
                                    color: AppColor.lineBackground,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: Sizes.screenHeight * 0.040,
                                        width: Sizes.screenWidth * 0.090,
                                        decoration: BoxDecoration(
                                          color: AppColor.bgback,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/login2.jpg',
                                          height: Sizes.screenHeight * 0.030,
                                          width: Sizes.screenWidth * 0.055,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'DURABLE\nPAVER BLOCKS',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.stockTitleColor,
                                          height: 1.3,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: Sizes.screenHeight * 0.058,
                                    width: Sizes.screenWidth * 0.0035,
                                    color: AppColor.lineBackground,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: Sizes.screenHeight * 0.040,
                                        width: Sizes.screenWidth * 0.090,
                                        decoration: BoxDecoration(
                                          color: AppColor.bgback,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/login3.jpg',
                                          height: Sizes.screenHeight * 0.030,
                                          width: Sizes.screenWidth * 0.065,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Reliable\nSolutions',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.stockTitleColor,
                                          height: 1.3,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}