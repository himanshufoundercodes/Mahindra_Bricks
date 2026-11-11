import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/addlabourview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantbutton.dart';
import 'Constant/Constantheader.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';

class Addlabour extends StatefulWidget {
  Addlabour({super.key});

  @override
  State<Addlabour> createState() => _AddlabourState();
}

class _AddlabourState extends State<Addlabour> {

  final TextEditingController LabournameController = TextEditingController();
  final TextEditingController MobilenumberController = TextEditingController();
  final TextEditingController DailyrateController = TextEditingController();

  Future<void> handladdlabour() async {
    if (LabournameController.text.trim().isEmpty) {
      Utils.showErrorMessage(context, "Labour name required");
      return;
    }
    final viewModel = context.read<AddlabourviewModel>();
    if (viewModel.loading) return;
    final success = await viewModel.addlabourApi(
      LabournameController.text,
      MobilenumberController.text,
      DailyrateController.text,
    );

    if (!context.mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, "Add Client Successfully!");

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
    LabournameController.dispose();
    MobilenumberController.dispose();
    DailyrateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addlabourviewModel = Provider.of<AddlabourviewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.grey,
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
                            color: AppColor.bgbacklight,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.engineering,
                            size: 29,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.03),
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

                    SizedBox(height: Sizes.screenHeight * 0.0175),
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
                    SizedBox(height: Sizes.screenHeight * 0.006),

                    SizedBox(
                      height: Sizes.screenHeight * 0.075,
                      child: AppTextField(
                        prefixIcon: Icons.person,
                        controller: LabournameController,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter Labour name',
                        height: Sizes.screenHeight * 0.056,
                        hintTextHeight: Sizes.screenHeight * 0.015,
                      ),
                    ),

                    SizedBox(height: Sizes.screenHeight * 0.006),

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
                    SizedBox(height: Sizes.screenHeight * 0.006),
                    SizedBox(
                      height: Sizes.screenHeight * 0.075,
                      child: AppTextField(
                        prefixIcon: Icons.call,
                        maxLength: 10,
                        controller: MobilenumberController,
                        keyboardType: TextInputType.number,
                        hintText: 'Enter mobile number',
                        height: Sizes.screenHeight * 0.056,
                        hintTextHeight: Sizes.screenHeight * 0.015,
                      ),
                    ),

                    SizedBox(height: Sizes.screenHeight * 0.006),

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
                    SizedBox(height: Sizes.screenHeight * 0.006),
                    SizedBox(
                      height: Sizes.screenHeight * 0.075,
                      child: AppTextField(
                        prefixIcon: Icons.currency_rupee,
                        controller: DailyrateController,
                        keyboardType: TextInputType.number,
                        hintText: 'Enter daily rate',
                        height: Sizes.screenHeight * 0.056,
                        hintTextHeight: Sizes.screenHeight * 0.015,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Sizes.screenHeight * 0.020),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.04,
                  vertical: Sizes.screenHeight * 0.015,
                ),
                child: Row(
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      height: Sizes.screenHeight * 0.060,
                      width: Sizes.screenWidth * 0.425,
                      type: CustomButtonType.outlined,
                      text: 'Cancel',
                      textColor: Colors.red.shade600,
                      borderColor: AppColor.stockTitleColor,
                      fontSize: 18,
                      fontWeight: .w500,
                      onPressed: () {
                       Navigator.pop(context);
                      },
                      iconOnLeft: true,
                      icon: Icons.close,
                      iconSize: 18,
                      iconSpacing: 2,
                    ),
                    SizedBox(width: 12),
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      height: Sizes.screenHeight * 0.060,
                      width: Sizes.screenWidth * 0.425,
                      text: 'Save Labour',
                      isLoading: addlabourviewModel.loading,
                      onPressed: () async {
                        await handladdlabour();
                      },
                      fontSize: 18,
                      fontWeight: .w500,
                      iconOnLeft: true,
                      icon: Icons.save,
                      iconSize: 18,
                      iconSpacing: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ' Add Labour',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.stockAmountColor,
                    ),
                  ),
                  Text(
                    'Create a new labour worker',
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
