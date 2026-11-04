
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/viewmodel/vehicle_viewmodel.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'addvihclecategory.dart';
import 'circularprogressindicator.dart';

class Addvehicle extends StatefulWidget {
  const Addvehicle({super.key});

  @override
  State<Addvehicle> createState() => _AddvehicleState();
}

class _AddvehicleState extends State<Addvehicle> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VehicleViewmodel>(
        context,
        listen: false,
      ).vehicleApi();
    });
  }

  @override
  Widget build(BuildContext context) {

    final vehicleProvider = Provider.of<VehicleViewmodel>(context);

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
          await Provider.of<VehicleViewmodel>(
            context,
            listen: false,
          ).vehicleApi();
        },

        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),

          child: SafeArea(
            child: Column(
              children: [

                SizedBox(height: Sizes.screenHeight * 0.006),

                _buildHeader(),

                SizedBox(height: Sizes.screenHeight * 0.018),
                Container(
                  height: Sizes.screenHeight * 0.048,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12),

                  decoration: BoxDecoration(
                    color: AppColor.bglighttext,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.grey,
                      width: Sizes.screenWidth * 0.0025,
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
                            hintText: 'Search vehicles...',
                            hintStyle: GoogleFonts.poppins(
                              color: AppColor.gey,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
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

                SizedBox(height: 15),
                if (vehicleProvider.loading)
                  Center(
                    child: Circularprogressindicator(),
                  )

                else if (vehicleProvider.errorMessage != null)
                  Center(
                    child: Column(
                      children: [

                        Text(vehicleProvider.errorMessage!),

                        CustomButton(
                          text: 'Retry',
                          onPressed: vehicleProvider.vehicleApi,
                        ),
                      ],
                    ),
                  )
                else if (vehicleProvider.vehicleList.isEmpty)
                    Center(
                      child: Text('No Vehicles Found'),
                    )

                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: vehicleProvider.vehicleList.length,
                      itemBuilder: (context, index) {
                        final item = vehicleProvider.vehicleList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFF1E8E2),
                            ),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.070,
                                width: Sizes.screenWidth * 0.17,

                                decoration: BoxDecoration(
                                  color: Color(0xFFFFF1E8),
                                  borderRadius: BorderRadius.circular(9),
                                ),

                                padding: EdgeInsets.all(7),

                                child: Image.asset(
                                  'assets/Tru.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,

                                  children: [

                                    Text(
                                      item.vehicle_name?.toString() ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,

                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Color(0xFFB32616),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),

                                    // Vehicle Number
                                    Row(
                                      children: [

                                        Icon(
                                          Icons.dns_outlined,
                                          size: 13,
                                          color: Color(0xFF9B351F),
                                        ),

                                        SizedBox(width: 5),

                                        Expanded(
                                          child: Text(
                                            item.vehicle_number?.toString() ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF687078),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 3),

                                    Row(
                                      children: [

                                        Icon(
                                          Icons.person,
                                          size: 13,
                                          color: Color(0xFF9B351F),
                                        ),

                                        SizedBox(width: 5),

                                        Expanded(
                                          child: Text(
                                            item.driver_name?.toString() ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3),

                                    Row(
                                      children: [

                                        Icon(
                                          Icons.call,
                                          size: 13,
                                          color: Color(0xFF9B351F),
                                        ),

                                        SizedBox(width: 5),

                                        Expanded(
                                          child: Text(
                                            item.driver_mobile?.toString() ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,

                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 3),


                                    Row(
                                      children: [

                                        Icon(
                                          Icons.inventory_2,
                                          size: 12,
                                          color: Color(0xFF9B351F),
                                        ),

                                        SizedBox(width: 5),

                                        Expanded(
                                          child: Text(
                                            'Capacity: ${item.capacity_pieces ?? 0} Pieces',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 6),

                              // Call and More Options
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(top: 8, right: 2),

                                    child: GestureDetector(
                                      onTap: () {

                                      },

                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,

                                        children: [

                                          Container(
                                            height: Sizes.screenHeight * 0.040,
                                            width: Sizes.screenWidth * 0.12,

                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFEAE3),
                                              shape: BoxShape.circle,
                                            ),

                                            child: Icon(
                                              Icons.call,
                                              color: Color(0xFFB32616),
                                              size: 18,
                                            ),
                                          ),

                                          SizedBox(height: 3),

                                          Text(
                                            'Call',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Color(0xFFB32616),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: Sizes.screenWidth * 0.040,
                                    height: Sizes.screenHeight * 0.035,

                                    child: PopupMenuButton<String>(
                                      padding: EdgeInsets.zero,
                                      iconSize: 22,

                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Color(0xFF7D838B),
                                      ),

                                      onSelected: (value) {},

                                      itemBuilder: (context) => [

                                        PopupMenuItem(
                                          value: 'edit',
                                          child: Text('Edit'),
                                        ),

                                        PopupMenuItem(
                                          value: 'delete',
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
        vertical: Sizes.screenHeight * 0.010,
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.screenWidth * 0.010,
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [

                Text(
                  'Vehicle',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),

                Text(
                  'Manage your factory vehicle',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: GoogleFonts.poppins(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gey,
                  ),
                ),
              ],
            ),

            SizedBox(width: 8),

            CustomButton(
              padding: EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),

              height: 35,
              width: 100,
              text: 'Add Vehicle',
              fontSize: 12,
              fontWeight: FontWeight.w500,

              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Addvihclecategory()));
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
