import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'homepage.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isPasswordVisible = false;
  bool rememberMe = false;

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),

        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,

          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/login.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.065,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Sizes.screenWidth * 0.2375,
                      height: Sizes.screenHeight * 0.116,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF9B543C),
                          width: 3.5,
                        ),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/logo.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),

                    Text(
                      'MAHINDRA BRICKS',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xFF793D2C),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'P A V E R   B L O C K S',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xFF9B543C),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 1),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Sizes.screenWidth * 0.085,
                          height: 1,
                          color: Color(0xFFB9A28A),
                        ),

                        SizedBox(width: 8),

                        Text(
                          'STRONGER FOUNDATIONS',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            color: Color(0xFF654735),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),

                        SizedBox(width: 8),

                        Container(
                          width: Sizes.screenWidth * 0.085,
                          height: 1,
                          color: Color(0xFFB9A28A),
                        ),
                      ],
                    ),

                    Text(
                      'FOR A BETTER TOMORROW',
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF654735),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.51,
                left: 22,
                right: 22,

                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFfdfaf7),
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
                          color: Color(0xFF431104),
                        ),
                      ),

                      Text(
                        'Login to your Mahindra Bricks account\n'
                            'to manage your factory operations',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0XFF636464),
                          height: 1.3,
                        ),
                      ),

                      SizedBox(height: 15),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),

                        child: Column(
                          children: [
                            TextField(
                              controller: emailController,

                              scrollPadding:
                              EdgeInsets.only(bottom: 250),

                              keyboardType: TextInputType.emailAddress,

                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0XFF8d8b8a),
                                ),

                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 20,
                                  color: Colors.black54,
                                ),

                                contentPadding:
                                EdgeInsets.symmetric(
                                  vertical: 12,
                                ),

                                filled: true,
                                fillColor: Color(0xFFF8F5F2),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5DFDA),
                                  ),
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5DFDA),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 10),

                            TextField(
                              controller: passwordController,
                              obscureText: !isPasswordVisible,

                              scrollPadding:
                              EdgeInsets.only(bottom: 250),

                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Color(0XFF8d8b8a),
                                ),

                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 20,
                                  color: Colors.black54,
                                ),

                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20,
                                    color: Colors.black54,
                                  ),

                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible =
                                      !isPasswordVisible;
                                    });
                                  },
                                ),

                                contentPadding:
                                EdgeInsets.symmetric(
                                  vertical: 12,
                                ),

                                filled: true,
                                fillColor: Color(0xFFF8F5F2),

                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5DFDA),
                                  ),
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5DFDA),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                },

                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: rememberMe,

                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value ?? false;
                                        });
                                      },

                                      activeColor:
                                      Color(0xFF9B543C),
                                      checkColor: Colors.white,

                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,

                                      side: BorderSide(
                                        color: Color(0xFF9B543C),
                                      ),
                                    ),

                                    SizedBox(width: 8),

                                    Text(
                                      'Remember me',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Color(0xFF654735),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              GestureDetector(
                                onTap: () {},

                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF76301c),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5),

                          SizedBox(
                            width: double.infinity,
                            height: Sizes.screenHeight * 0.045,

                            child: ElevatedButton(
                              onPressed: () {
                                if (emailController.text
                                    .trim()
                                    .isEmpty ||
                                    passwordController.text
                                        .trim()
                                        .isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please enter both email and password',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor:
                                      Color(0xFF9B3F24),
                                    ),
                                  );

                                  return;
                                }

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                      (route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Color(0xFF953e27),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: EdgeInsets.zero,

                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(7),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFE0D8D2),
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                'OR',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF999999),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFE0D8D2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: Sizes.screenHeight * 0.040,
                                      width: Sizes.screenWidth * 0.090,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF4E3D8),
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
                                    SizedBox(height: 5),
                                    Text(
                                      'Quality\nBricks',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF65331F),
                                        height: 1.3,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 50,
                                width: 1,
                                color: Color(0xFFE2D3C9),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: Sizes.screenHeight * 0.040,
                                      width: Sizes.screenWidth * 0.090,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF4E3D8),
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
                                        color: Color(0xFF65331F),
                                        height: 1.3,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 50,
                                width: 1,
                                color: Color(0xFFE2D3C9),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: Sizes.screenHeight * 0.040,
                                      width: Sizes.screenWidth * 0.090,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF4E3D8),
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
                                        color: Color(0xFF65331F),
                                        height: 1.3,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
