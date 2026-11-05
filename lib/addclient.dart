import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/addclientview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'clients.dart';

class Addclient extends StatefulWidget {
  Addclient({super.key});

  @override
  State<Addclient> createState() => _AddclientState();
}

class _AddclientState extends State<Addclient> {

  final TextEditingController CompanynameController = TextEditingController();
  final TextEditingController PersonnameController = TextEditingController();
  final TextEditingController MobilenumberController = TextEditingController();
  final TextEditingController AlternatenumberController =
      TextEditingController();

  final TextEditingController AddressController = TextEditingController();

  Future<void> handladdclient() async {
    if (CompanynameController.text.trim().isEmpty) {
      Utils.showErrorMessage(context, "Please enter company name");
      return;
    }
    final viewModel = context.read<AddclientviewModel>();
    if (viewModel.loading) return;
    final success = await viewModel.addClientApi(
      CompanynameController.text,
      PersonnameController.text,
      MobilenumberController.text,
      AlternatenumberController.text,
      AddressController.text,
    );

    if (!context.mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, "Add Vehicle Successfully!");

      Navigator.pop(context, true);
    } else {
      Utils.showErrorMessage(
        context,
        viewModel.errorMessage ?? "Add client failed",
      );
    }
  }

  @override
  void dispose() {
    CompanynameController.dispose();
    PersonnameController.dispose();
    MobilenumberController.dispose();
    AlternatenumberController.dispose();
    AddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addclientviewModel = Provider.of<AddclientviewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    SizedBox(height: Sizes.screenHeight * 0.02),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.052,
                                width: Sizes.screenWidth * 0.105,
                                decoration: BoxDecoration(
                                  color: AppColor.bgbacklight,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.domain,
                                  color: AppColor.stockTitleColor,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Client Information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.stockTitleColor,
                                      ),
                                    ),
                                    Text(
                                      'Enter client basic information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: AppColor.gey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.0225),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.gey,
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
                              SizedBox(height: Sizes.screenHeight * 0.012),
                              SizedBox(
                                height: Sizes.screenHeight * 0.075,
                                child: AppTextField(
                                  prefixIcon: Icons.domain,
                                  controller: CompanynameController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Enter Compnay name',
                                  height: Sizes.screenHeight * 0.056,
                                  hintTextHeight: Sizes.screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Person Name',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColor.gey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: Sizes.screenHeight * 0.0075),
                              SizedBox(
                                child: AppTextField(
                                  prefixIcon: Icons.person,
                                  controller: PersonnameController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Enter contact person name',
                                  height: Sizes.screenHeight * 0.055,
                                  hintTextHeight: Sizes.screenHeight * 0.005,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.0175),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.gey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(text: 'Mobile Number '),
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
                              SizedBox(height: Sizes.screenHeight * 0.0075),
                              SizedBox(
                                child: AppTextField(
                                  prefixIcon: Icons.call,
                                  controller: MobilenumberController,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  hintText: 'Enter Mobile number',
                                  height: Sizes.screenHeight * 0.055,
                                  hintTextHeight: Sizes.screenHeight * 0.005,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.0175),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alternate Mobile Number',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColor.gey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 6),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: AppTextField(
                                  prefixIcon: Icons.call,
                                  maxLength: 10,
                                  controller: AlternatenumberController,
                                  keyboardType: TextInputType.number,
                                  hintText: 'Enter Alternate number(optional)',
                                  height: Sizes.screenHeight * 0.055,
                                  hintTextHeight: Sizes.screenHeight * 0.005,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.02),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.052,
                                width: Sizes.screenWidth * 0.105,
                                decoration: BoxDecoration(
                                  color: AppColor.bgbacklight,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  color: AppColor.stockTitleColor,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Address Information',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.stockTitleColor,
                                      ),
                                    ),
                                    Text(
                                      'Enter client address details',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.gey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.0225),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              AppTextField(
                                prefixIcon: Icons.home,
                                controller: AddressController,
                                keyboardType: TextInputType.text,
                                hintText: 'Enter your Address',
                                height: Sizes.screenHeight * 0.055,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
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
                  CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    height: Sizes.screenHeight * 0.068,
                    width: Sizes.screenWidth * 0.425,
                    type: CustomButtonType.outlined,
                    text: 'Cancel',
                    textColor: Colors.red.shade600,
                    borderColor: AppColor.stockTitleColor,
                    fontSize: 18,
                    fontWeight: .w500,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addclient()),
                      );
                    },
                    iconOnLeft: true,
                    icon: Icons.close,
                    iconSize: 18,
                    iconSpacing: 2,
                  ),
                  SizedBox(width: 12),
                  CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    height: Sizes.screenHeight * 0.068,
                    width: Sizes.screenWidth * 0.425,
                    text: 'Save Client',
                    isLoading: addclientviewModel.loading,
                    onPressed: () async {
                      await handladdclient();
                    },
                    fontSize: 18,
                    fontWeight: .w500,
                    iconOnLeft: true,
                    icon: Icons.save,
                    iconSize: 18,
                    iconSpacing: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenHeight * 0.010,
        vertical: Sizes.screenHeight * 0.010,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.010),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' Add Client',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Create a new customer',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gey,
                  ),
                ),
              ],
            ),

            SizedBox(width: 8),

            // CustomButton(
            //   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            //   height: 35,
            //   width: 100,
            //   text: 'Add Client',
            //   fontSize:  12,
            //   fontWeight: .w500,
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Addclient()),
            //     );
            //   },
            //   iconOnLeft: true,
            //   icon: Icons.add,
            //   iconSize: 15,
            //   iconSpacing: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
