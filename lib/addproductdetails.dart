import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant_Color.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String selectedColour = 'Red';
  String productStatus = 'Active';
  int activeBottomButton = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F4),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: Sizes.screenWidth * 0.12,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Color(0xFFFFF9F0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF702B1C),
                        size: 27,
                      ),
                    ),

                    SizedBox(width: 20),
                    Container(
                      height: Sizes.screenWidth * 0.094,
                      width: Sizes.screenWidth * 0.094,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFB58B76),
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'MAHINDRA BRICKS',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF702B1C),
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'P A V E R   B L O C K S',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              color: Color(0xFF702B1C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(18, 7, 16, 12),
                color: Color(0xFFFFF8F4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Product',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF702B1C),
                      ),
                    ),

                    SizedBox(height: 1),
                    Text(
                      'Add new brick or paver block to your inventory',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCF8),
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
                          color: Color(0xFF702B1C),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Product Image',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF702B1C),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '(Optional)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
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
                            },
                            child: Container(
                              height: Sizes.screenWidth * 0.262,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFD5CEC7),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 27,
                                    color: Color(0xFF555555),
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
                                    color: Colors.grey
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
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/bricks.jpg',
                                    fit: BoxFit.contain,
                                  ),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFCF8),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFBEDE7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.assignment,
                            color: Color(0xFF702B1C),
                            size: 20,
                          ),
                          SizedBox(width: 10),
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

                    SizedBox(height: 8),

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
                                    TextSpan(text: 'Product Name '),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              TextField(
                                style: GoogleFonts.poppins(fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: 'eg: Red Bricks (Standard)',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 10,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDD8D4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16),

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
                                    TextSpan(text: 'Product Code / SKU '),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              TextField(
                                style: GoogleFonts.poppins(fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: 'eg: RB -001',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 10,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDD8D4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                              SizedBox(height: 4),
                              DropdownButtonFormField<String>(
                                initialValue: 'Bricks',
                                isExpanded: true,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 8,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDD8D4),
                                    ),
                                  ),
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'Bricks',
                                    child: Text('Bricks'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Paver Blocks',
                                    child: Text('Paver Blocks'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Other',
                                    child: Text('Other'),
                                  ),
                                ],
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Type / Design',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 4),
                              TextField(
                                style: GoogleFonts.poppins(fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: 'e.g. Standard, Zigzag, I Shape',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 10,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDD8D4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
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
                      SizedBox(width: 10),
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
                  SizedBox(height: 12),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('Length (mm)'),
                              SizedBox(height: 5),
                              inputField('230'),
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
                              inputField('110'),
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
                              inputField('70'),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
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
                              inputField('15000'),
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
                              inputField('1000'),
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
                          Icon(
                            Icons.info,
                            color: Color(0xFF858585),
                            size: 16,
                          ),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
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
                              inputField('5.00'),
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
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF303030),
                                ),
                              ),
                              SizedBox(height: 5),
                              inputField('8.00'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Container(
                    padding:  EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:  Color(0xFFFFFCF9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding:  EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color:  Color(0xFFFBECE5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                               Icon(
                                Icons.description,
                                size: 19,
                                color: Color(0xFF702B1C),
                              ),
                               SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Additional Details ',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color:  Color(0xFF702B1C),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(Optional)',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                         SizedBox(height: 10),

                        Text(
                          'Description / Notes',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color:  Color(0xFF303030),
                          ),
                        ),

                         SizedBox(height: 10),

                        TextFormField(
                          maxLines: 2,
                          style: GoogleFonts.poppins(fontSize: 12),
                          decoration: InputDecoration(
                            hintText: 'Standard red clay bricks suitable for construction.',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 7,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFFFFCF9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0DAD4),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0DAD4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:  Color(0xFFFFFCF9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: Sizes.screenHeight * 0.045,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBECE5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.toggle_on,
                                  size: 24,
                                  color: Color(0xFF702B1C),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    'Product Status',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF702B1C),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          flex: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                productStatus = 'Active';
                              });
                            },
                            child: Container(
                              height: Sizes.screenHeight * 0.044,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFCF9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: productStatus == 'Active'
                                      ? AppColor.stockTitleColor
                                      : const Color(0xFFE0DAD4),
                                  width: productStatus == 'Active' ? 1.4 : 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    productStatus == 'Active'
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    size: 14,
                                    color: productStatus == 'Active'
                                        ? AppColor.stockTitleColor
                                        : Colors.grey,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Active',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: .w600,
                                      color: const Color(0xFF702B1C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),
                        Expanded(
                          flex: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                productStatus = 'Inactive';
                              });
                            },
                            child: Container(
                              height: Sizes.screenHeight * 0.044,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFCF9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: productStatus == 'Inactive'
                                      ? AppColor.stockTitleColor
                                      : const Color(0xFFE0DAD4),
                                  width: productStatus == 'Inactive' ? 1.4 : 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    productStatus == 'Inactive'
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    size: 14,
                                    color: productStatus == 'Inactive'
                                        ? AppColor.stockTitleColor
                                        : Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Inactive',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: .w600,
                                      color: productStatus == 'Inactive'
                                          ? const Color(0xFF702B1C)
                                          : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
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
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeBottomButton = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: activeBottomButton == 1 ? Color(0xFF702B1C) : Color(0xFFFBECE5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(
                          color: activeBottomButton == 1 ? Colors.white : Color(0xFF702B1C),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: SizedBox(
                  height: Sizes.screenHeight * 0.048,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeBottomButton = 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: activeBottomButton == 2 ? Color(0xFF702B1C) : Colors.white,
                      elevation: 0,
                      side: activeBottomButton == 2 ? BorderSide.none : BorderSide(color: Color(0xFF702B1C)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        'Save & Add Another',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: activeBottomButton == 2
                              ? Colors.white
                              : const Color(0xFF702B1C),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: Sizes.screenHeight * 0.048,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeBottomButton = 3;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: activeBottomButton == 3 ? Color(0xFF702B1C) : Colors.white,
                      elevation: 0,
                      side: activeBottomButton == 3 ? BorderSide.none : BorderSide(color: Color(0xFF702B1C)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        'Save Product',
                        style: GoogleFonts.poppins(
                          color: activeBottomButton == 3 ? Colors.white : Color(0xFF702B1C),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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

  Widget inputField(String value) {
    return SizedBox(
      height: Sizes.screenWidth * 0.099,
      child: TextFormField(
        initialValue: value,
        keyboardType: TextInputType.number,
        style: GoogleFonts.poppins(
          fontSize: 13, 
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          filled: true,
          fillColor: Color(0xFFFFFCF9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xFFE0DAD4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xFFE0DAD4),
            ),
          ),
        ),
      ),
    );
  }

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
              color: isSelected
                  ? AppColor.stockAmountColor
                  : Color(0xFFE0DAD4),
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
                    color: isSelected
                        ? Color(0xFF702B1C)
                        : Colors.black87,
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