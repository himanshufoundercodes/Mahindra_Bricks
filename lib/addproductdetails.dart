import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/addnewproductview_model.dart';
import 'package:mahindra_bricks/viewmodel/categoryview_model.dart';
import 'package:mahindra_bricks/Constant/Constant_bottomnav.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productTypeController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController hightController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController minimumStockController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController selllingPriceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedColour = 'Red';
  String productStatus = 'Active';
  int activeBottomButton = 3;

  String? selectedCategory;
  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: Sizes.screenHeight * 0.20,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryViewModel>(context, listen: false).categoryApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addproduct = Provider.of<CategoryViewModel>(context);

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
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 19,
                          color: AppColor.stockAmountColor,
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.02),
                        Text(
                          'Product Image',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockAmountColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '(Optional)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColor.gey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              showImagePicker();
                            },
                            child: Container(
                              height: Sizes.screenWidth * 0.262,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: selectedImage != null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          size: 27,
                                          color: AppColor.grey,
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          'Tap to add image',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFF555555),
                                          ),
                                        ),

                                        SizedBox(height: 3),

                                        Text(
                                          'JPG, PNG (Max 5 MB)',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          size: 27,
                                          color: AppColor.grey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Tap to add image',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFF555555),
                                          ),
                                        ),

                                        SizedBox(height: 3),

                                        Text(
                                          'JPG, PNG (Max 5 MB)',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          flex: 2,
                          child: Transform.translate(
                            offset: Offset(0, -15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Image Preview',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 7),
                                Container(
                                  height: Sizes.screenWidth * 0.262,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF8EFEC),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: selectedImage != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.file(
                                            selectedImage!,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Sizes.screenHeight * 0.00625),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.032,
                  vertical: Sizes.screenHeight * 0.00625,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.screenWidth * 0.03,
                        vertical: Sizes.screenHeight * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.lightredbg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.assignment,
                            color: Color(0xFF702B1C),
                            size: 20,
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.027),
                          Text(
                            'Basic Information',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF702B1C),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Sizes.screenHeight * 0.01),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.gey,
                                  ),
                                  children: [
                                    TextSpan(text: 'Product Name '),
                                    TextSpan(
                                      text: '*',
                                      style: GoogleFonts.poppins(
                                        color: AppColor.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Sizes.screenHeight * 0.005),
                              AppTextField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                hintText: 'eg: Red Bricks',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.010,
                              ),
                            ],
                          ),
                        ),

                        // SizedBox(width: 16),
                        //
                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       RichText(
                        //         text: TextSpan(
                        //           style: GoogleFonts.poppins(
                        //             fontSize: 12,
                        //             color: Color(0xFF333333),
                        //           ),
                        //           children: [
                        //             TextSpan(text: 'Product Code / SKU '),
                        //             TextSpan(
                        //               text: '*',
                        //               style: TextStyle(color: Colors.red),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(height: 4),
                        //       // TextField(
                        //       //   style: GoogleFonts.poppins(fontSize: 12),
                        //       //   decoration: InputDecoration(
                        //       //     hintText: 'eg: RB -001',
                        //       //     hintStyle: GoogleFonts.poppins(
                        //       //       fontSize: 12,
                        //       //       color: Colors.grey,
                        //       //     ),
                        //       //     contentPadding: EdgeInsets.symmetric(
                        //       //       horizontal: 11,
                        //       //       vertical: 10,
                        //       //     ),
                        //       //     isDense: true,
                        //       //     border: OutlineInputBorder(
                        //       //       borderRadius: BorderRadius.circular(8),
                        //       //     ),
                        //       //     enabledBorder: OutlineInputBorder(
                        //       //       borderRadius: BorderRadius.circular(8),
                        //       //       borderSide: BorderSide(
                        //       //         color: Color(0xFFDDD8D4),
                        //       //       ),
                        //       //     ),
                        //       //   ),
                        //       // ),
                        //       AppTextField(
                        //         controller: productCodeController,
                        //         keyboardType: TextInputType.text,
                        //         hintText: 'eg: RB -001',
                        //         height: Sizes.screenHeight * 0.050,
                        //         hintTextHeight: Sizes.screenHeight * 0.010,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),

                    SizedBox(height: Sizes.screenHeight * 0.0125),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF333333),
                                  ),
                                  children: [
                                    TextSpan(text: 'Category '),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Sizes.screenHeight * 0.005),
                              addproduct.loading
                                  ? Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: SizedBox(
                                          height: Sizes.screenHeight * 0.025,
                                          width: Sizes.screenWidth * 0.053,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Color(0xFF702B1C),
                                          ),
                                        ),
                                      ),
                                    )
                                  : DropdownButtonFormField<String>(
                                      value: selectedCategory,
                                      isExpanded: true,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),

                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: Sizes.screenWidth * 0.029,
                                          vertical: Sizes.screenHeight * 0.01,
                                        ),
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFDDD8D4),
                                          ),
                                        ),
                                      ),

                                      hint: Text("Select Category"),

                                      items: addproduct.categoryList.map((
                                        category,
                                      ) {
                                        return DropdownMenuItem<String>(
                                          value: category.id.toString(),
                                          child: Text(category.name ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCategory = value;
                                        });
                                        print("Selected Category ID: $value");
                                      },
                                    ),
                            ],
                          ),
                        ),
                      //  SizedBox(width: 16),

                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'Product Type / Design',
                        //         style: GoogleFonts.poppins(
                        //           fontSize: 12,
                        //           color: Color(0xFF333333),
                        //         ),
                        //       ),
                        //       SizedBox(height: 4),
                        //       // TextField(
                        //       //   style: GoogleFonts.poppins(fontSize: 12),
                        //       //   decoration: InputDecoration(
                        //       //     hintText: 'e.g. Standard, Zigzag, I Shape',
                        //       //     hintStyle: GoogleFonts.poppins(
                        //       //       fontSize: 12,
                        //       //       color: Colors.grey,
                        //       //     ),
                        //       //     contentPadding: EdgeInsets.symmetric(
                        //       //       horizontal: 11,
                        //       //       vertical: 10,
                        //       //     ),
                        //       //     isDense: true,
                        //       //     border: OutlineInputBorder(
                        //       //       borderRadius: BorderRadius.circular(8),
                        //       //     ),
                        //       //     enabledBorder: OutlineInputBorder(
                        //       //       borderRadius: BorderRadius.circular(8),
                        //       //       borderSide: BorderSide(
                        //       //         color: Color(0xFFDDD8D4),
                        //       //       ),
                        //       //     ),
                        //       //   ),
                        //       // ),
                        //       AppTextField(
                        //         controller: productTypeController,
                        //         keyboardType: TextInputType.text,
                        //         hintText: 'e.g. Standard, Zigzag',
                        //         height: Sizes.screenHeight * 0.050,
                        //         hintTextHeight: Sizes.screenHeight * 0.010,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFBECE5),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.straighten,
                        size: 20,
                        color: Color(0xFF702B1C),
                      ),
                      SizedBox(width: Sizes.screenWidth * 0.027),
                      Text(
                        'Size & Specification',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF702B1C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Sizes.screenHeight * 0.015),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('Length (mm)'),
                              SizedBox(height: Sizes.screenHeight * 0.00625),
                              AppTextField(
                                controller: lengthController,
                                keyboardType: TextInputType.number,
                                hintText: '230',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('Width (mm)'),
                              SizedBox(height: 5),
                              AppTextField(
                                controller: widthController,
                                keyboardType: TextInputType.number,
                                hintText: '110',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('Height'),
                              SizedBox(height: 5),
                              AppTextField(
                                controller: hightController,
                                keyboardType: TextInputType.number,
                                hintText: '70',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color(0xFF292929),
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(text: 'Colour '),
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: AppColor.red),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        colourBox('Red'),
                        SizedBox(width: 10),
                        colourBox('Grey'),
                        SizedBox(width: 10),
                        colourBox('Yellow'),
                        SizedBox(width: 10),
                        colourBox('Other'),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFBECE5),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.inventory_2,
                        color: Color(0xFF702B1C),
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Stock Information',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF702B1C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Initial Quantity(Pieces)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Color(0xFF292929),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              AppTextField(
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                                hintText: '15000',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Minimum Stock Alert',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Color(0xFF292929),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              AppTextField(
                                controller: minimumStockController,
                                keyboardType: TextInputType.number,
                                hintText: '1000',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEBEB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info, color: Color(0xFF858585), size: 16),
                          SizedBox(width: 8),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Stock status will be calculated automatically based on current quantity and minimum stock.',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Color(0xFF555555),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFBECE5),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 20,
                        color: Color(0xFF702B1C),
                      ),
                      SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pricing ',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF702B1C),
                              ),
                            ),
                            TextSpan(
                              text: '(Optional)',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cost Price per Piece (₹)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303030),
                                ),
                              ),
                              SizedBox(height: 5),
                              AppTextField(
                                controller: costPriceController,
                                keyboardType: TextInputType.number,
                                hintText: '5.00',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selling Price per Piece (₹)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303030),
                                ),
                              ),
                              SizedBox(height: 5),
                              AppTextField(
                                controller: selllingPriceController,
                                keyboardType: TextInputType.number,
                                hintText: '6.00',
                                height: Sizes.screenHeight * 0.050,
                                hintTextHeight: Sizes.screenHeight * 0.005,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Column(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         color: Color(0xFFFFFCF9),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             width: double.infinity,
              //             padding: EdgeInsets.symmetric(
              //               horizontal: 12,
              //               vertical: 8,
              //             ),
              //             decoration: BoxDecoration(
              //               color: Color(0xFFFBECE5),
              //               borderRadius: BorderRadius.circular(8),
              //             ),
              //             child: Row(
              //               children: [
              //                 Icon(
              //                   Icons.description,
              //                   size: 19,
              //                   color: Color(0xFF702B1C),
              //                 ),
              //                 SizedBox(width: 10),
              //                 RichText(
              //                   text: TextSpan(
              //                     children: [
              //                       TextSpan(
              //                         text: 'Additional Details ',
              //                         style: GoogleFonts.poppins(
              //                           fontSize: 14,
              //                           fontWeight: FontWeight.w600,
              //                           color: Color(0xFF702B1C),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: '(Optional)',
              //                         style: GoogleFonts.poppins(
              //                           fontSize: 12,
              //                           color: Colors.grey.shade700,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //
              //           SizedBox(height: 10),
              //           Text(
              //             'Description / Notes',
              //             style: GoogleFonts.poppins(
              //               fontSize: 13,
              //               color: Color(0xFF303030),
              //             ),
              //           ),
              //           SizedBox(height: 10),
              //           AppTextField(
              //             controller: descriptionController,
              //             keyboardType: TextInputType.text,
              //             hintText: 'Standard red clay bricks suitable for construction.',
              //             height: Sizes.screenHeight * 0.050,
              //             hintTextHeight: Sizes.screenHeight * 0.005,
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.all(8),
              //       decoration: BoxDecoration(
              //         color: Color(0xFFFFFCF9),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: Row(
              //         children: [
              //           Expanded(
              //             flex: 11,
              //             child: Container(
              //               height: Sizes.screenHeight * 0.045,
              //               decoration: BoxDecoration(
              //                 color: const Color(0xFFFBECE5),
              //                 borderRadius: BorderRadius.circular(8),
              //               ),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   const Icon(
              //                     Icons.toggle_on,
              //                     size: 24,
              //                     color: Color(0xFF702B1C),
              //                   ),
              //                    SizedBox(width: 5),
              //                   Flexible(
              //                     child: Text(
              //                       'Product Status',
              //                       maxLines: 1,
              //                       style: GoogleFonts.poppins(
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.w600,
              //                         color:  Color(0xFF702B1C),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //
              //            SizedBox(width: 8),
              //
              //           Expanded(
              //             flex: 10,
              //             child: GestureDetector(
              //               onTap: () {
              //                 setState(() {
              //                   productStatus = 'Active';
              //                 });
              //               },
              //               child: Container(
              //                 height: Sizes.screenHeight * 0.044,
              //                 decoration: BoxDecoration(
              //                   color: const Color(0xFFFFFCF9),
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     color: productStatus == 'Active'
              //                         ? AppColor.stockTitleColor
              //                         : const Color(0xFFE0DAD4),
              //                     width: productStatus == 'Active' ? 1.4 : 1,
              //                   ),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Icon(
              //                       productStatus == 'Active'
              //                           ? Icons.radio_button_checked
              //                           : Icons.radio_button_unchecked,
              //                       size: 14,
              //                       color: productStatus == 'Active'
              //                           ? AppColor.stockTitleColor
              //                           : Colors.grey,
              //                     ),
              //                     const SizedBox(width: 6),
              //                     Text(
              //                       'Active',
              //                       style: GoogleFonts.poppins(
              //                         fontSize: 11,
              //                         fontWeight: .w600,
              //                         color: const Color(0xFF702B1C),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //
              //           const SizedBox(width: 8),
              //           Expanded(
              //             flex: 10,
              //             child: GestureDetector(
              //               onTap: () {
              //                 setState(() {
              //                   productStatus = 'Inactive';
              //                 });
              //               },
              //               child: Container(
              //                 height: Sizes.screenHeight * 0.044,
              //                 decoration: BoxDecoration(
              //                   color: const Color(0xFFFFFCF9),
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     color: productStatus == 'Inactive'
              //                         ? AppColor.stockTitleColor
              //                         : const Color(0xFFE0DAD4),
              //                     width: productStatus == 'Inactive' ? 1.4 : 1,
              //                   ),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Icon(
              //                       productStatus == 'Inactive'
              //                           ? Icons.radio_button_checked
              //                           : Icons.radio_button_unchecked,
              //                       size: 14,
              //                       color: productStatus == 'Inactive'
              //                           ? AppColor.stockTitleColor
              //                           : Colors.grey,
              //                     ),
              //                     const SizedBox(width: 5),
              //                     Text(
              //                       'Inactive',
              //                       style: GoogleFonts.poppins(
              //                         fontSize: 11,
              //                         fontWeight: .w600,
              //                         color: productStatus == 'Inactive'
              //                             ? const Color(0xFF702B1C)
              //                             : Colors.black87,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0XFFfffcf9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: Sizes.screenHeight * 0.048,
                  child: CustomButton(
                    type: CustomButtonType.outlined,
                    backgroundColor: AppColor.grey,
                    textColor: AppColor.black87,
                    text: 'Cancel',
                    borderColor: Colors.grey,
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: Sizes.screenHeight * 0.048,
                  child: CustomButton(
                    text: 'Save Product',
                    isLoading: Provider.of<AddNewProductViewModel>(context).loading,
                    onPressed: () async {
                      if (selectedCategory == null) {
                        Utils.showErrorMessage(context, 'Please select a category');
                        return;
                      }
                      final addProduct = Provider.of<AddNewProductViewModel>(context,listen: false);
                      await addProduct.addProductApi(
                        productImage: selectedImage,
                        productName: nameController.text,
                        sku: productCodeController.text,
                        category: selectedCategory!,
                        productType: productTypeController.text,
                        lengthMm: lengthController.text,
                        widthMm: widthController.text,
                        heightMm: hightController.text,
                        colour: selectedColour,
                        initialQuantity: quantityController.text,
                        minStockAlert: minimumStockController.text,
                        costPrice: costPriceController.text,
                        sellingPrice: selllingPriceController.text,
                        description: descriptionController.text,
                        productStatus: productStatus,
                        context: context,
                      );
                      

                    },
                    iconOnLeft: false,
                  ),
                  // child: ElevatedButton(
                  //   onPressed: () {
                  //     if (selectedCategory == null) {
                  //       Utils.showErrorMessage(context, 'Please select a category');
                  //       return;
                  //     }
                  //     final addProduct = Provider.of<AddNewProductViewModel>(context,listen: false);
                  //     addProduct.addProductApi(
                  //       productImage: selectedImage,
                  //       productName: nameController.text,
                  //       sku: productCodeController.text,
                  //       category: selectedCategory!,
                  //       productType: productTypeController.text,
                  //       lengthMm: lengthController.text,
                  //       widthMm: widthController.text,
                  //       heightMm: hightController.text,
                  //       colour: selectedColour,
                  //       initialQuantity: quantityController.text,
                  //       minStockAlert: minimumStockController.text,
                  //       costPrice: costPriceController.text,
                  //       sellingPrice: selllingPriceController.text,
                  //       description: descriptionController.text,
                  //       productStatus: productStatus,
                  //       context: context,) ;
                  //
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: activeBottomButton == 3
                  //         ? Color(0xFF702B1C)
                  //         : Colors.white,
                  //     elevation: 0,
                  //     side: activeBottomButton == 3
                  //         ? BorderSide.none
                  //         : BorderSide(color: Color(0xFF702B1C)),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   child: FittedBox(
                  //     child: Text(
                  //       'Save Product',
                  //       style: GoogleFonts.poppins(
                  //         color: activeBottomButton == 3
                  //             ? Colors.white
                  //             : Color(0xFF702B1C),
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 13,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                  'Add Product',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Add new brick or paver block to your inventory',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
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
            //   width: 110,
            //   text: 'Add Category',
            //   fontSize:  12,
            //   fontWeight: .w500,
            //   onPressed: () {
            //     showModalBottomSheet(
            //       context: context,
            //       isScrollControlled: true,
            //       backgroundColor: Colors.transparent,
            //       builder: (context) {
            //         return  AddCategorySheet();
            //       },
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

  Widget labelText(String title) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: Color(0xFF292929),
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  // Widget inputField(String value) {
  //   return SizedBox(
  //     height: Sizes.screenWidth * 0.099,
  //     child: TextFormField(
  //       initialValue: value,
  //       keyboardType: TextInputType.number,
  //       style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  //         filled: true,
  //         fillColor: Color(0xFFFFFCF9),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: BorderSide(color: Color(0xFFE0DAD4)),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: BorderSide(color: Color(0xFFE0DAD4)),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget colourBox(String colour) {
    bool isSelected = selectedColour == colour;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedColour = colour;
          });
        },
        child: Container(
          height: Sizes.screenWidth * 0.088,
          decoration: BoxDecoration(
            color: Color(0xFFFFFCF9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColor.stockAmountColor : Color(0xFFE0DAD4),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 16,
                color: isSelected
                    ? AppColor.stockAmountColor
                    : Color(0xFF9E9E9E),
              ),
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  colour,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: isSelected ? Color(0xFF702B1C) : Colors.black87,
                    fontWeight: FontWeight.w500,
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
