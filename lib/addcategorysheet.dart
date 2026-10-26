import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class AddCategorySheet extends StatefulWidget {
  AddCategorySheet({super.key});

  @override
  State<AddCategorySheet> createState() => _AddCategorySheetState();
}

class _AddCategorySheetState extends State<AddCategorySheet> {
  final TextEditingController categoryController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  @override
  void dispose() {
    categoryController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color brown = Color(0xFF941008);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(28, 10, 24, 24),
        decoration: BoxDecoration(
          color: Color(0xFFFFFCFA),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Category",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF851008),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Create a new brick or paver category",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF687078),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: Sizes.screenHeight * 0.075,
                      width: Sizes.screenWidth * 0.080,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8E9E5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Color(0xFF851008),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Category Name "),
                    TextSpan(
                      text: "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 6),

              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  hintText: "Enter category name",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0xFF858D94),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      color: Color(0xFFD5D8DC),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      color: Color(0xFFD5D8DC),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              Text(
                "Description",
                style: TextStyle(fontSize: 14),
              ),

              SizedBox(height: 6),

              TextField(
                controller: descriptionController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Enter description (optional)",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF858D94),
                  ),
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      color: Color(0xFFD5D8DC),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      color: Color(0xFFD5D8DC),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    if (categoryController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter category name"),
                        ),
                      );
                      return;
                    }

                    String categoryName =
                    categoryController.text;
                    String description =
                    descriptionController.text;

                    Navigator.pop(context);

                    debugPrint("Category: $categoryName");
                    debugPrint("Description: $description");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Text(
                    "Save Category",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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
}
