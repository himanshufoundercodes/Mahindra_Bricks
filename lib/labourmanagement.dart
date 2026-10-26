import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'addlabour.dart';
import 'labourdetail.dart';

class Labourmanagement extends StatefulWidget {
  Labourmanagement({super.key});

  @override
  State<Labourmanagement> createState() => _LabourmanagementState();
}

class _LabourmanagementState extends State<Labourmanagement> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> labourList = [
    {"name": "Rajesh Kumar", "mobile": "9876543210", "rate": "600"},
    {"name": "Suresh Kumar", "mobile": "9123456789", "rate": "550"},
    {"name": "Amit Singh", "mobile": "9988776655", "rate": "650"},
    {"name": "Pradeep Kumar", "mobile": "9865321478", "rate": "600"},
    {"name": "Vikash Yadav", "mobile": "9501234567", "rate": "600"},
    {"name": "Mohammad Toheed", "mobile": "9123012345", "rate": "550"},
    {"name": "Ramesh Patel", "mobile": "9988123456", "rate": "600"},
    {"name": "Sunil Kumar", "mobile": "9871234567", "rate": "650"},
    {"name": "Manoj Yadav", "mobile": "9654321789", "rate": "600"},
    {"name": "Dinesh Kumar", "mobile": "9012345678", "rate": "550"},
  ];

  List<Map<String, String>> get filteredLabourList {
    String query = searchController.text.toLowerCase();

    return labourList.where((labour) {
      return labour["name"]!.toLowerCase().contains(query) ||
          labour["mobile"]!.contains(query);
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Labour Management",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF991B12),
                            ),
                          ),
                          Text(
                            "Manage all factory labor workers",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xFF777777),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Addlabour()));
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 22,
                      ),
                      label: Text(
                        "Add Labour",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9E2418),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: Sizes.screenWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCEEEE),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9E5E3),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.groups,
                          size: 25,
                          color: Color(0xFF8F281B),
                        ),
                      ),
                      SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Labour",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xFF777777),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "24",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              height: 1.1,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF991B12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12),

              Container(
                height: Sizes.screenHeight * 0.049,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFE0E0E0), width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 25, color: Color(0xFF172033)),
                    SizedBox(width: 14),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: "Search labour name or mobile number...",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xFF84909E),
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: filteredLabourList.map((labour) {
                    return Container(
                      height: Sizes.screenHeight * 0.074,
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: Color(0xFFF1EDEA)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Labourdetail(),
                                  ),
                                );
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    labour["name"]!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF17233D),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 13,
                                        color: Color(0xFF586475),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        labour["mobile"]!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Color(0xFF778394),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            height: 31,
                            width: 1,
                            color: Color(0xFFE8E8E8),
                          ),

                          SizedBox(width: 18),

                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily Rate",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Color(0xFF8A94A2),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "₹ ${labour["rate"]}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    height: 1.1,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFB22218),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: Sizes.screenHeight * 0.075,
                            width: Sizes.screenWidth * 0.075,
                            decoration: BoxDecoration(
                              color: Color(0xFFE4F8E9),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                size: 16,
                                color: Color(0xFF168641),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
