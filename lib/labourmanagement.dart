import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/model/labour_model.dart';
import 'package:mahindra_bricks/viewmodel/labour_viewmodel.dart';
import 'package:provider/provider.dart';
import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'addlabour.dart';
import 'circularprogressindicator.dart';
import 'labourdetail.dart';
import 'url_launcher.dart';

class Labourmanagement extends StatefulWidget {
  Labourmanagement({super.key});

  @override
  State<Labourmanagement> createState() => _LabourmanagementState();
}

class _LabourmanagementState extends State<Labourmanagement> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LabourListViewModel>(
        context,
        listen: false,
      ).LabourApi();
    });
  }

  List<LabourListModel> getFilteredLabourList(List<LabourListModel>? apiList) {
    if (apiList == null) return [];
    String query = searchController.text.toLowerCase();
    return apiList.where((labour) {
      final name = labour.name?.toString().toLowerCase() ?? '';
      final mobile = labour.mobile?.toString() ?? '';
      return name.contains(query) || mobile.contains(query);
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LabourList = Provider.of<LabourListViewModel>(context);
    final filteredLabourList = getFilteredLabourList(LabourList.labourListModel);
    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar:  ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<LabourListViewModel>(context, listen: false).LabourApi();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: Sizes.screenHeight * 0.02,),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: Sizes.screenHeight * 0.008),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027,),
              child: Container(
                width: Sizes.screenWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.037,
                  vertical: Sizes.screenHeight * 0.010,
                ),
                decoration: BoxDecoration(
                  color: AppColor.lightred,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  children: [
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      width: Sizes.screenWidth * 0.107,
                      decoration: BoxDecoration(
                        color: AppColor.lightredbg,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.groups,
                        size: 25,
                        color: AppColor.stockUnitColor,
                      ),
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.035),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Labour",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColor.gey,
                          ),
                        ),
                        SizedBox(height: Sizes.screenHeight * 0.0025,),
                        Text(
                          LabourList.labourListModel != null 
                              ? LabourList.labourListModel!.length.toString() 
                              : "0",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            height: 1.1,
                            fontWeight: FontWeight.w600,
                            color:AppColor.stockTitleColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: Sizes.screenHeight * 0.015),

            Container(
              height: Sizes.screenHeight * 0.049,
              margin: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.021),
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027),
              decoration: BoxDecoration(
                color:AppColor.white38,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.grey, width: Sizes.screenWidth * 0.003),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 25, color: AppColor.gey),
                  SizedBox(width: Sizes.screenWidth * 0.037),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: "Search labour name or mobile number...",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          color: AppColor.gey,
                        ),
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: Sizes.screenHeight * 0.01),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.021),
            //   child: Column(
            //     children: filteredLabourList.map((labour) {
            //       return Container(
            //         height: Sizes.screenHeight * 0.074,
            //         margin: EdgeInsets.only(bottom: Sizes.screenHeight * 0.01),
            //         padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027,),
            //         decoration: BoxDecoration(
            //           color: AppColor.white,
            //           borderRadius: BorderRadius.circular(9),
            //           border: Border.all(color: AppColor.grey),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => Labourdetail(),
            //                   ),
            //                 );
            //               },
            //               child: SizedBox(
            //                 width: Sizes.screenWidth * 0.38,
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       labour["name"]!,
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                       style: GoogleFonts.poppins(
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w700,
            //                         color: AppColor.black,
            //                       ),
            //                     ),
            //                     Row(
            //                       children: [
            //                         Icon(
            //                           Icons.call,
            //                           size: 13,
            //                           color: AppColor.gey,
            //                         ),
            //                         SizedBox(
            //                           width: Sizes.screenWidth * 0.009,
            //                         ),
            //                         Text(
            //                           labour["mobile"]!,
            //                           style: GoogleFonts.poppins(
            //                             fontSize: 11,
            //                             color: AppColor.gey,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //
            //             Container(
            //               height: Sizes.screenHeight * 0.038,
            //               width: Sizes.screenWidth * 0.003,
            //               color: AppColor.grey,
            //             ),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Daily Rate",
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 10,
            //                     color: AppColor.gey,
            //                   ),
            //                 ),
            //                 SizedBox(height: Sizes.screenHeight * 0.004),
            //                 Text(
            //                   "₹ ${labour["rate"]}",
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 13,
            //                     height: 1.1,
            //                     fontWeight: FontWeight.w700,
            //                     color: AppColor.stockUnitColor,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Container(
            //               height: Sizes.screenHeight * 0.075,
            //               width: Sizes.screenWidth * 0.075,
            //               decoration: BoxDecoration(
            //                 color: AppColor.lightgreen,
            //                 shape: BoxShape.circle,
            //               ),
            //               child: IconButton(
            //                 padding: EdgeInsets.zero,
            //                 onPressed: () {},
            //                 icon: Icon(
            //                   Icons.call,
            //                   size: 16,
            //                   color: AppColor.green,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     }).toList(),
            //   ),
            // ),


              Column(
                children: [
                  SizedBox(height: 15),

                  if (LabourList.loading)
                    Center(
                      child: Circularprogressindicator(),
                    )

                  else if (LabourList.errorMessage != null)
                    Center(
                      child: Column(
                        children: [
                          Text(LabourList.errorMessage!),

                          CustomButton(
                            text: 'Retry',
                            onPressed: LabourList.LabourApi,
                          ),
                        ],
                      ),
                    )
                    else
                  ListView.builder(
                    itemCount: filteredLabourList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final labour = filteredLabourList[index];
                      return Container(
                        height: Sizes.screenHeight * 0.074,
                        margin: EdgeInsets.only(
                          bottom: Sizes.screenHeight * 0.01,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.027,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Labourdetail(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: Sizes.screenWidth * 0.38,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      labour.name?.toString() ?? "N/A",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 13,
                                          color: AppColor.gey,
                                        ),
                                        SizedBox(
                                          width: Sizes.screenWidth * 0.009,
                                        ),
                                        Text(
                                          labour.mobile?.toString() ?? "N/A",
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            color: AppColor.gey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              height: Sizes.screenHeight * 0.038,
                              width: Sizes.screenWidth * 0.003,
                              color: AppColor.grey,
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily Rate",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: AppColor.gey,
                                  ),
                                ),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.004,
                                ),
                                Text(
                                  "₹ ${labour.daily_rate?.toString() ?? "0"}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    height: 1.1,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.stockUnitColor,
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              height: Sizes.screenHeight * 0.075,
                              width: Sizes.screenWidth * 0.075,
                              decoration: BoxDecoration(
                                color: AppColor.lightgreen,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  if (labour.mobile != null) {
                                    CustomLauncher.call(labour.mobile.toString());
                                  }
                                },
                                icon: Icon(
                                  Icons.call,
                                  size: 16,
                                  color: AppColor.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
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
                  'Labour Management',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Management all factory labour workers',
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
              height: Sizes.screenHeight * 0.043,
              width: Sizes.screenWidth * 0.293,
              text: 'Add Labour',
              fontSize:  12,
              fontWeight: .w500,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addlabour()),
                );
              },
              iconOnLeft: true,
              icon: Icons.add,
              iconSize: 18,
              iconSpacing: 2,
            ),

          ],
        ),
      ),
    );
  }
}
