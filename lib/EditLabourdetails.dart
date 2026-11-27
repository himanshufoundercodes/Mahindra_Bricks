import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Appbar.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Constnat_Appbutton.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/model/labour_model.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/labour_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/labourview_model.dart';
import 'package:provider/provider.dart';

class EditLabourDetails extends StatefulWidget {
  final Data? data;

  const EditLabourDetails({super.key, this.data});

  @override
  State<EditLabourDetails> createState() => _EditLabourDetailsState();
}

class _EditLabourDetailsState extends State<EditLabourDetails> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController dailyRateController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.data?.name?.toString() ?? '',
    );
    mobileController = TextEditingController(
      text: widget.data?.mobile?.toString() ?? '',
    );
    dailyRateController = TextEditingController(
      text: widget.data?.dailyRate?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    dailyRateController.dispose();
    super.dispose();
  }

  Future<void> handleUpdateLabour() async {
    final String name = nameController.text.trim();
    final String mobile = mobileController.text.trim();
    final String dailyRate = dailyRateController.text.trim();

    if (name.isEmpty) {
      Utils.showErrorMessage(context, "Please enter labour name");
      return;
    }
    if (mobile.isEmpty || mobile.length < 10) {
      Utils.showErrorMessage(context, "Please enter a valid 10-digit mobile number");
      return;
    }
    if (dailyRate.isEmpty) {
      Utils.showErrorMessage(context, "Please enter daily rate");
      return;
    }

    final String id = widget.data?.id?.toString() ?? '';
    if (id.isEmpty) {
      Utils.showErrorMessage(context, "Labour ID missing");
      return;
    }

    Map<String, dynamic> body = {
      "name": name,
      "mobile": mobile,
      "daily_rate": dailyRate,
      "status": "active",
    };

    final labourVM = Provider.of<LabourViewModel>(context, listen: false);
    bool success = await labourVM.updateLabourApi(id, body);

    if (mounted) {
      if (success) {
        Utils.showSuccessMessage(context, "Labour worker updated successfully");

        // Refresh Labour list in the app
        Provider.of<LabourListViewModel>(context, listen: false).LabourApi();

        Data updated = Data(
          id: widget.data?.id,
          labourCode: widget.data?.labourCode,
          name: name,
          mobile: mobile,
          dailyRate: dailyRate,
        );

        await Future.delayed(const Duration(milliseconds: 300));
        if (mounted) {
          Navigator.pop(context, labourVM.updatedData ?? updated);
        }
      } else {
        Utils.showErrorMessage(
          context,
          labourVM.errorMessage ?? "Failed to update labour details",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = Provider.of<LabourViewModel>(context).loading;

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: ListView(
        children: [
          _buildHeader(),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.grey),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.027,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: Sizes.screenHeight * 0.030,
                        width: Sizes.screenWidth * 0.08,
                        decoration: BoxDecoration(
                          color: AppColor.lightredbg,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColor.stockUnitColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Labour Information',
                          style: GoogleFonts.poppins(
                            color: AppColor.stockAmountColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Labour ID Row
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColor.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Labour ID',
                          style: GoogleFonts.poppins(
                            color: AppColor.gey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data?.labourCode?.toString() ?? "123456789",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Labour Name Row (Inline Editable)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: const Text(
                          'Labour Name',
                          style: TextStyle(
                            color: Color(0xFF858B96),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Mobile Number Row (Inline Editable)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.006,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColor.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Mobile Number',
                          style: GoogleFonts.poppins(
                            color: AppColor.gey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Daily Rate Row (Inline Editable)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.screenWidth * 0.021,
                    vertical: Sizes.screenHeight * 0.009,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.screenWidth * 0.352,
                        child: Text(
                          'Daily Rate (₹)',
                          style: GoogleFonts.poppins(
                            color: AppColor.gey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: dailyRateController,
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Sizes.screenHeight * 0.012),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027),
            child: Column(
              children: [
                SizedBox(height: Sizes.screenHeight * 0.006),
                Row(
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.screenWidth * 0.015,
                        vertical: Sizes.screenHeight * 0.005,
                      ),
                      height: Sizes.screenHeight * 0.052,
                      width: Sizes.screenWidth * 0.410,
                      text: 'Cancel',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.025),
                    CustomButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.screenWidth * 0.011,
                        vertical: Sizes.screenHeight * 0.005,
                      ),
                      height: Sizes.screenHeight * 0.052,
                      width: Sizes.screenWidth * 0.475,
                      text: 'Update Details',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      isLoading: isLoading,
                      onPressed: () async {
                        await handleUpdateLabour();
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
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
                  'Labour Details',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'View labour information and summary',
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
          ],
        ),
      ),
    );
  }
}
