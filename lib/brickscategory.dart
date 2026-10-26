import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'addcategorysheet.dart';

class Brickscategory extends StatefulWidget {
  Brickscategory({super.key});

  @override
  State<Brickscategory> createState() => _BrickscategoryState();
}

class _BrickscategoryState extends State<Brickscategory> {
  final Color brickColor = Color(0xFF8E1B12);
  final Color backgroundColor = Color(0xFFFAF5F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: brickColor,
                        size: 27,
                      ),
                    ),

                    Spacer(),

                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: 50,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFB88A72),
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

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'MAHINDRA BRICKS',
                              style: TextStyle(
                                color: brickColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'P A V E R  B L O C K S',
                              style: TextStyle(
                                color: Color(0xFF76271F),
                                fontSize: 9,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Spacer(),

                    Icon(
                      Icons.more_vert,
                      color: brickColor,
                      size: 26,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 9),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brick / Paver Categories',
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              color: brickColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.7,
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            'Manage your brick and paver categories',
                            maxLines: 1,
                            style: TextStyle(
                              color: Color(0xFF687078),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return  AddCategorySheet();
                          },
                        );
                      },
                      child: Container(
                        height: Sizes.screenHeight * 0.039,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: brickColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Add Category',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: Sizes.screenHeight * 0.048,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFFAF5F2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFD5D0CC),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xFF183342),
                      size: 26,
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search categories...',
                          hintStyle: TextStyle(
                            color: Color(0xFF858A90),
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<String> titles = [
                    'Bricks',
                    'Paver Blocks',
                    'Hollow Blocks',
                    'Strong Blocks',
                    'Cement Blocks',
                  ];

                  List<String> subtitles = [
                    'Building construction bricks',
                    'Interlocking paver blocks',
                    'Hollow and solid blocks',
                    'Strong foundations Blocks',
                    'Cement foundations Blocks',
                  ];
                  return Container(
                    height: Sizes.screenHeight * 0.080,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAF7F4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFFEAE3DE),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titles[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF8E1B12),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                subtitles[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF72777D),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
