
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/addvehicleview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constantheader.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'model/addvehicle_model.dart';

class Addvihclecategory extends StatefulWidget {
  Addvihclecategory({super.key});

  @override
  State<Addvihclecategory> createState() => _AddvihclecategoryState();
}

class _AddvihclecategoryState extends State<Addvihclecategory> {

  bool validateMobileNumber(String mobile) {
    if (mobile.length != 10) {
      Utils.showErrorMessage(context, 'Mobile number must be 10 digits');
      return false;
    }
    if (!RegExp(r'^[6-9]').hasMatch(mobile)) {
      Utils.showErrorMessage(
        context,
        'Please Enter valid mobile number',
      );
      return false;
    }
    if (RegExp(r'(\d)\1{3,}').hasMatch(mobile)) {
      Utils.showErrorMessage(
        context,
        'Please Enter valid mobile number',
      );
      return false;
    }
    return true;
  }

  int selectedVehicle = 0;
  final TextEditingController vehicleNameController =
  TextEditingController();
  final TextEditingController vehicleNumberController =
  TextEditingController();
  final TextEditingController driverNameController =
  TextEditingController();

  final TextEditingController driverMobileNumberController =
  TextEditingController();

  final TextEditingController capacityPiecesController =
  TextEditingController();

  final TextEditingController notesController =
  TextEditingController();
  Future<void> handladdvehiclec() async {

    if (vehicleNameController.text.trim().isEmpty) {
      Utils.showErrorMessage(context, "Please enter vehicle name");
      return;
    }

    final vehicleNumber = vehicleNumberController.text.trim().toUpperCase();
    if (vehicleNumber.isEmpty) {
      Utils.showErrorMessage(context, "Please enter vehicle number");
      return;
    }

    final vehicleRegex = RegExp(
      r'^([A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}|[0-9]{2}BH[0-9]{4}[A-HJ-NP-Z]{1,2})$',
    );

    if (!vehicleRegex.hasMatch(vehicleNumber)) {
      Utils.showErrorMessage(
        context,
        "Please enter valid vehicle number (e.g. UP32CX4567 or 22BH1234AA)",
      );
      return;
    }

    if (!vehicleRegex.hasMatch(vehicleNumber)) {
      Utils.showErrorMessage(
        context,
        "Please enter valid vehicle number (e.g. UP32CX4567)",
      );
      return;
    }
    if (!vehicleRegex.hasMatch(vehicleNumber)) {
      Utils.showErrorMessage(
        context,
        "Please enter valid vehicle number (e.g. UP32CX3494 or 22BH1234AA)",
      );
      return;
    }
    String mobileNumber = driverMobileNumberController.text.trim();
    if (mobileNumber.isNotEmpty) {
      if (!validateMobileNumber(mobileNumber)) {
        return;
      }
    }

    final viewModel = context.read<AddvehicleviewModel>();
    if (viewModel.loading) return;
    final success = await viewModel.addvehicleApi(
      vehicleNameController.text.trim(),
      vehicleNumber,
      driverNameController.text.trim(),
      driverMobileNumberController.text.trim(),
      capacityPiecesController.text.trim(),
      context,
    );

    if (!context.mounted) return;

    if (success) {
      Utils.showSuccessMessage(
        context,
        "Add Vehicle Successfully!",
      );

      Navigator.pop(context, true);
    } else {
      Utils.showErrorMessage(
        context,
        viewModel.errorMessage ?? "Add vehicle failed",
      );
    }
  }

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
  void dispose() {
    vehicleNameController.dispose();
    vehicleNumberController.dispose();
    driverNameController.dispose();
    driverMobileNumberController.dispose();
    capacityPiecesController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addvehicleviewModel =
    Provider.of<AddvehicleviewModel>(context);
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

                    AppTextField(
                      controller: vehicleNameController,
                      keyboardType: TextInputType.text,
                      hintText: 'Enter vehicle name (e.g. Tata 407)',
                      height: Sizes.screenHeight * 0.050,
                      hintTextHeight: Sizes.screenHeight * 0.005,
                      hintFontSize: 14,
                    ),

                    SizedBox(height: 12),

                    _buildLabel('Vehicle Number'),

                    SizedBox(height: 5),

                    AppTextField(
                      controller: vehicleNumberController,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        VehicleNumberFormatter(),
                      ],
                      hintText: 'Enter vehicle number (e.g. UP32CX3494)',
                      height: Sizes.screenHeight * 0.050,
                      hintTextHeight: Sizes.screenHeight * 0.005,
                      hintFontSize: 14,
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
                              AppTextField(
                                controller: driverNameController,
                                keyboardType: TextInputType.text,
                                hintText: 'Enter driver name',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                                hintFontSize: 13,
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

                              AppTextField(
                                controller: driverMobileNumberController,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                hintText: 'Enter mobile number',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                                hintFontSize: 11,
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

                    AppTextField(
                      controller: capacityPiecesController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: 'Enter capacity in pieces (optional)',
                      height: Sizes.screenHeight * 0.050,
                      hintTextHeight: Sizes.screenHeight * 0.005,
                      hintFontSize: 14,
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
                          height: Sizes.screenHeight * 0.043,
                          width: Sizes.screenWidth * 0.0875,
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

                    AppTextField(
                      controller: notesController,
                      keyboardType: TextInputType.text,
                      hintText: 'Enter notes (optional)',
                      height: Sizes.screenHeight * 0.050,
                      hintTextHeight: Sizes.screenHeight * 0.005,
                      hintFontSize: 14,
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ),
                    ),

                    SizedBox(width: 14),

                    Expanded(
                      child: CustomButton(
                        text: 'Save Vehicle',
                        isLoading: addvehicleviewModel.loading,
                        onPressed: () async {
                          await handladdvehiclec();
                        },
                        iconOnLeft: false,
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
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class VehicleNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String text = newValue.text.toUpperCase();

    if (text.length > 10) {
      return oldValue;
    }

    bool isBhSeries = RegExp(r'^[0-9]').hasMatch(text);

    if (isBhSeries) {
      for (int i = 0; i < text.length; i++) {
        String char = text[i];

        if (i < 2) {
          if (!RegExp(r'^[0-9]$').hasMatch(char)) {
            return oldValue;
          }
        } else if (i == 2) {
          if (char != 'B') return oldValue;
        } else if (i == 3) {
          if (char != 'H') return oldValue;
        } else if (i < 8) {
          if (!RegExp(r'^[0-9]$').hasMatch(char)) {
            return oldValue;
          }
        } else {
          if (!RegExp(r'^[A-HJ-NP-Z]$').hasMatch(char)) {
            return oldValue;
          }
        }
      }
    } else {
      for (int i = 0; i < text.length; i++) {
        String char = text[i];

        if (i < 2) {
          if (!RegExp(r'^[A-Z]$').hasMatch(char)) {
            return oldValue;
          }
        } else if (i < 4) {
          if (!RegExp(r'^[0-9]$').hasMatch(char)) {
            return oldValue;
          }
        } else if (i < 6) {
          if (!RegExp(r'^[A-Z]$').hasMatch(char)) {
            return oldValue;
          }
        } else {
          if (!RegExp(r'^[0-9]$').hasMatch(char)) {
            return oldValue;
          }
        }
      }
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
  }
}
