import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/model/stocklist_model.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/addproductionview_model.dart';
import 'package:mahindra_bricks/viewmodel/stocklist_viewmodel.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';

class AddProduction extends StatefulWidget {
  const AddProduction({super.key});

  @override
  State<AddProduction> createState() => _AddProductionState();
}

class _AddProductionState extends State<AddProduction> {
  bool isDropdownOpen = false;
  Data? selectedProduct;

  final TextEditingController quanityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quanityController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final stockViewModel =
          Provider.of<StocklistViewmodel>(context, listen: false);
      stockViewModel.stockListApi().then((_) {
        if (mounted &&
            stockViewModel.stockListModel?.data != null &&
            stockViewModel.stockListModel!.data!.isNotEmpty) {
          if (selectedProduct == null) {
            setState(() {
              selectedProduct = stockViewModel.stockListModel!.data!.first;
            });
          }
        }
      });
    });
  }

  @override
  void dispose() {
    quanityController.dispose();
    super.dispose();
  }

  Future<void> handleAddprduction() async {
    if (selectedProduct == null) {
      Utils.showErrorMessage(context, "Please select a product");
      return;
    }
    if (quanityController.text.trim().isEmpty) {
      Utils.showErrorMessage(context, "Please enter quantity");
      return;
    }

    final success = await context
        .read<AddproductionviewModel>()
        .addproductionApi(selectedProduct!.id, quanityController.text.trim());

    if (!mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, "Save Production Successfully!");

      Provider.of<StocklistViewmodel>(context, listen: false).stockListApi();

      await Future.delayed(Duration(milliseconds: 500));

      if (!mounted) return;
      Navigator.pop(context);
    } else {
      final message =
          context.read<AddproductionviewModel>().errorMessage ?? 'Failed to save production';
      Utils.showErrorMessage(context, message);
    }
  }

  DateTime? selectedPaymentDate = DateTime.now();
  final Color brown = Color(0xFF84301D);
  final Color backgroundColor = Color(0xFFFFF8F1);

  @override
  Widget build(BuildContext context) {
    final stockViewModel = Provider.of<StocklistViewmodel>(context);
    final stockList = stockViewModel.stockListModel?.data ?? [];

    if (stockList.isNotEmpty) {
      if (selectedProduct == null) {
        selectedProduct = stockList.first;
      } else {
        final match = stockList.firstWhere(
          (p) => p.id == selectedProduct!.id,
          orElse: () => stockList.first,
        );
        selectedProduct = match;
      }
    }

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
            children: [
              _buildHeader(),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.027,
                  vertical: Sizes.screenHeight * 0.006,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.grey),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.049,
                          width: Sizes.screenWidth * 0.107,
                          decoration: BoxDecoration(
                            color: AppColor.lightred,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: AppColor.stockUnitColor,
                            size: 22,
                          ),
                        ),

                        SizedBox(width: Sizes.screenWidth * 0.032),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. Production Date',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7D2015),
                              ),
                            ),
                            SizedBox(height: Sizes.screenHeight * 0.0025),
                            Text(
                              'Select the date of production',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.gey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: Sizes.screenHeight * 0.012),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              child: CustomCalendar(
                                isRange: false,
                                selectedDate: selectedPaymentDate ?? DateTime.now(),
                                onDateSelected: (date) {
                                  setState(() {
                                    selectedPaymentDate = date;
                                  });

                                  Navigator.pop(dialogContext);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: Sizes.screenHeight * 0.052,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.027,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.lightred,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 17,
                              color: AppColor.gey,
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.053),
                            Text(
                              selectedPaymentDate == null
                                  ? 'Select date'
                                  : '${selectedPaymentDate!.day.toString().padLeft(2, '0')} '
                                        '${['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][selectedPaymentDate!.month - 1]} '
                                        '${selectedPaymentDate!.year}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.gey,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 22,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.027,
                  vertical: Sizes.screenHeight * 0.006,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.052,
                          width: Sizes.screenWidth * 0.112,
                          decoration: BoxDecoration(
                            color: AppColor.lightred,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.inventory_2_outlined,
                            color: AppColor.stockUnitColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.032),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2. Select Product',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockUnitColor,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Choose the brick or paver block',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.gey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.01),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownOpen = !isDropdownOpen;
                            });
                          },
                          child: Container(
                            height: Sizes.screenHeight * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.lightred,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: Sizes.screenHeight * 0.068,
                                  width: Sizes.screenWidth * 0.181,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6),
                                    ),
                                    child: (selectedProduct?.imageUrl != null &&
                                            selectedProduct!.imageUrl
                                                .toString()
                                                .isNotEmpty)
                                        ? Image.network(
                                            selectedProduct!.imageUrl.toString(),
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error,
                                                    stackTrace) =>
                                                Image.asset(
                                                    'assets/bricks.jpg',
                                                    fit: BoxFit.cover),
                                          )
                                        : Image.asset(
                                            'assets/bricks.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),

                                SizedBox(width: Sizes.screenWidth * 0.032),

                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        selectedProduct?.name?.toString() ??
                                            'Select Product',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),

                                      SizedBox(height: Sizes.screenHeight * 0.004),

                                      Text(
                                        'Code: ${selectedProduct?.sku ?? 'N/A'} | Size: ${selectedProduct?.dimensions ?? 'N/A'}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: AppColor.gey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    isDropdownOpen
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    size: 23,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (isDropdownOpen)
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: stockViewModel.loading
                                ? Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : stockList.isEmpty
                                    ? Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Center(
                                          child: Text(
                                            'No Products Available',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Column(
                                        children: stockList.map((product) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedProduct = product;
                                                isDropdownOpen = false;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 12,
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          product.name?.toString() ??
                                                              '',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Code: ${product.sku ?? 'N/A'} | Size: ${product.dimensions ?? 'N/A'}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 11,
                                                            color: AppColor.gey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                          ),
                      ],
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.027,
                  vertical: Sizes.screenHeight * 0.006,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.069,
                          width: Sizes.screenWidth * 0.149,
                          decoration: BoxDecoration(
                            color: AppColor.lightred,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.business,
                            color: AppColor.stockUnitColor,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.032),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3. Production Quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockUnitColor,
                              ),
                            ),
                            SizedBox(height: Sizes.screenHeight * 0.004),
                            Text(
                              'Enter total pieces produced today',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: AppColor.gey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.012),
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.052,
                          width: Sizes.screenWidth * 0.133,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.inventory_2,
                            color: AppColor.stockUnitColor,
                            size: 20,
                          ),
                        ),

                        Expanded(
                          child: Container(
                            height: Sizes.screenHeight * 0.052,
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.screenWidth * 0.032,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: AppColor.grey),
                            ),
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              controller: quanityController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: '5000',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey.shade400,
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: Sizes.screenHeight * 0.052,
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.screenWidth * 0.037,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Pieces',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColor.gey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.027,
                  vertical: Sizes.screenHeight * 0.007,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColor.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.060,
                            width: Sizes.screenWidth * 0.138,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: (selectedProduct?.imageUrl != null &&
                                      selectedProduct!.imageUrl
                                          .toString()
                                          .isNotEmpty)
                                  ? Image.network(
                                      selectedProduct!.imageUrl.toString(),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset('assets/bricks.jpg',
                                                  fit: BoxFit.cover),
                                    )
                                  : Image.asset(
                                      'assets/bricks.jpg',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedProduct?.name?.toString() ??
                                      'Select Product',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.stockUnitColor,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Code: ${selectedProduct?.sku ?? 'N/A'}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 9),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Size: ${selectedProduct?.dimensions ?? 'N/A'}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),
                                if (selectedProduct?.colour != null &&
                                    selectedProduct!.colour
                                        .toString()
                                        .isNotEmpty) ...[
                                  SizedBox(height: 2),
                                  Text(
                                    'Colour: ${selectedProduct?.colour}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8),

                    // Divider
                    Container(height: 120, width: 1, color: Color(0xFFEBE3DD)),

                    SizedBox(width: 8),

                    // Stock Details
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFCE9E4),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.inventory_2,
                                  color: Color(0xFF731209),
                                  size: 18,
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Current Stock',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                    Text(
                                      '${selectedProduct?.stockQuantity ?? 0}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('Pieces',
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 6),

                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color(0xFFEAF5EE),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD6F0E0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.settings,
                                    color: Color(0xFF0F7D41),
                                    size: 18,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'After Production',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        '${(int.tryParse(selectedProduct?.stockQuantity?.toString() ?? '0') ?? 0) + (int.tryParse(quanityController.text.trim()) ?? 0)}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0F7D41),
                                        ),
                                      ),
                                      Text(
                                        'Pieces',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: AppColor.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.04,
                  vertical: Sizes.screenHeight * 0.015,
                ),
                child: Row(
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
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
                      text: 'Save Production',
                      isLoading: context
                          .watch<AddproductionviewModel>()
                          .loading,
                      onPressed: () async {
                        await handleAddprduction();
                      },
                      fontSize: 15,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' Add Production ',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  "Record today's brick or paver block production",
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

