import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constnat_Appbutton.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewmodel/categoryview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'addcategorysheet.dart';
import 'addproductdetails.dart';
import 'circularprogressindicator.dart';

class Brickscategory extends StatefulWidget {
  Brickscategory({super.key});

  @override
  State<Brickscategory> createState() => _BrickscategoryState();
}

class _BrickscategoryState extends State<Brickscategory> {



  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryViewModel>(
        context,
        listen: false,
      ).categoryApi();
    });
  }

  final Color brickColor = Color(0xFF8E1B12);
  final Color backgroundColor = Color(0xFFFAF5F2);

  @override
  Widget build(BuildContext context) {

    final category23 = Provider.of<CategoryViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: RefreshIndicator(
        color: AppColor.stockAmountColor,
        backgroundColor: Colors.white,
        displacement: 50,

        onRefresh: () async {
          await Provider.of<CategoryViewModel>(
            context,
            listen: false,
          ).categoryApi();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Container(
                  height: Sizes.screenHeight * 0.048,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColor.gey,
                        size: 26,
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search categories...',
                            hintStyle: TextStyle(
                              color: Color(0xFF858A90),
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 15),
                if (category23.loading)
                  Center(
                    child: Circularprogressindicator(),
                  )
                else if (category23.errorMessage != null)
                  Center(
                    child: Column(
                      children: [
                        Text(category23.errorMessage!),
                        CustomButton(
                          text: 'Retry',
                          onPressed: category23.categoryApi,
                        ),
                      ],
                    ),
                  )
                else if (category23.categoryList.isEmpty)
                    Center(
                      child: Text('No Categories Found'),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: category23.categoryList.length,
                      itemBuilder: (context, index) {

                        final item = category23.categoryList[index];

                        return Container(
                          height: Sizes.screenHeight * 0.080,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFAF7F4),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFEAE3DE),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name?.toString() ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFF8E1B12),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item.description?.toString() ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFF72777D),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.screenHeight * 0.010,
          vertical: Sizes.screenHeight * 0.010
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
                  'Bricks/Paver Categories',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Manage your bricks and paver categories',
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

            CustomButton(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              height: 35,
              width: 110,
              text: 'Add Category',
              fontSize:  12,
              fontWeight: .w500,
              onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return  AddCategorySheet();
                    },
                  );
              },
              iconOnLeft: true,
              icon: Icons.add,
              iconSize: 15,
              iconSpacing: 2,
            ),

          ],
        ),
      ),
    );
  }
}
