import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'Constant/Constantheader.dart';

class Addvihclecategory extends StatefulWidget {
  Addvihclecategory({super.key});

  @override
  State<Addvihclecategory> createState() => _AddvihclecategoryState();
}

class _AddvihclecategoryState extends State<Addvihclecategory> {
  int selectedVehicle = 0;

  final List<Map<String, dynamic>> vehicles = [
    {
      'name': 'Truck',
      'icon': Icons.local_shipping,
    },
    {
      'name': 'Tractor',
      'icon': Icons.agriculture,
    },
    {
      'name': 'Pickup',
      'icon': Icons.local_shipping_outlined,
    },
    {
      'name': 'Tata 407',
      'icon': Icons.fire_truck,
    },
  ];

  final Color primaryColor = Color(0xFF8E1B12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),

              CustomHeader(),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Vehicle',
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.7,
                            ),
                          ),
                          Text(
                            'Add your own factory vehicle for material transport',
                            maxLines: 2,
                            style: TextStyle(
                              color: Color(0xFF687078),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCFA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xFFF3EAE4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.038,
                          width: Sizes.screenWidth * 0.090,
                          decoration: BoxDecoration(
                            color: Color(0xFFFBE7DF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.local_shipping,
                            color: primaryColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Vehicle Information',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    _buildLabel('Vehicle Name'),

                    SizedBox(height: 5),

                    _buildTextField(
                      hint: 'Enter vehicle name (e.g. Tata 407)',
                    ),

                    SizedBox(height: 12),

                    _buildLabel('Vehicle Number'),

                    SizedBox(height: 5),

                    _buildTextField(
                      hint: 'Enter vehicle number (e.g. UP32 AB 1234)',
                    ),

                    SizedBox(height: 12),

                    _buildLabel('Vehicle Type'),

                    SizedBox(height: 8),

                    Row(
                      children: List.generate(
                        vehicles.length,
                        (index) {
                          bool isSelected = selectedVehicle == index;

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVehicle = index;
                                });
                              },
                              child: Container(
                                height: 78,
                                margin: EdgeInsets.only(
                                  right: index == vehicles.length - 1
                                      ? 0
                                      : 6,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Color(0xFFFFF0EC)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(
                                    color: isSelected
                                        ? Color(0xFFC83A32)
                                        : Color(0xFFF0ECE8),
                                    width: isSelected ? 1.2 : 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        isSelected
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_unchecked,
                                        color: isSelected
                                            ? Color(0xFFC83A32)
                                            : Color(0xFFBDBDBD),
                                        size: 15,
                                      ),
                                    ),

                                    Icon(
                                      vehicles[index]['icon'] as IconData,
                                      size: 28,
                                      color: Color(0xFF74351F),
                                    ),

                                    SizedBox(height: 3),

                                    Text(
                                      vehicles[index]['name'] as String,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCFA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF3EAE4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFFBE7DF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.person,
                            color: primaryColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Driver Details',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Driver Name',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF252525),
                                ),
                              ),
                              SizedBox(height: 5),
                              _buildTextField(
                                hint: 'Enter driver name',
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Driver Mobile Number',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF252525),
                                ),
                              ),
                              SizedBox(height: 5),
                              _buildTextField(
                                hint: 'Enter mobile number',
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCFA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF3EAE4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFFBE7DF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.inventory_2,
                            color: primaryColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Vehicle Capacity',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Capacity (Pieces)',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF252525),
                      ),
                    ),

                    SizedBox(height: 5),

                    _buildTextField(
                      hint: 'Enter capacity in pieces (optional)',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCFA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF3EAE4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFFBE7DF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.description,
                            color: primaryColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Aditional Information',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Notes(Optional)',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF252525),
                      ),
                    ),

                    SizedBox(height: 5),

                    _buildTextField(
                      hint: 'Enter capacity in pieces (optional)',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Sizes.screenHeight * 0.055,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFFFFEFEB),
                            side: BorderSide(
                              color: Color(0xFF8E1B12),
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8E1B12),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 14),

                    Expanded(
                      child: SizedBox(
                        height: Sizes.screenHeight * 0.055,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFAD1008),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Save Vehicle',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$text ',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Color(0xFF252525),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    TextInputType? keyboardType,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return SizedBox(
      height: Sizes.screenHeight * 0.052,
      child: TextField(
        keyboardType: keyboardType,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        style: GoogleFonts.poppins(fontSize: 12),
        decoration: InputDecoration(
          counterText: '',
          isDense: true,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 11,
            color: Color(0xFF89919A),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: Color(0xFFD8DDE2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: Color(0xFFD8DDE2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: Color(0xFFC83A32),
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
