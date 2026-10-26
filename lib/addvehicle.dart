import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Constant/Constantheader.dart';
import 'Constant/Sizes.dart';
import 'addvihclecategory.dart';

class Addvehicle extends StatefulWidget {
  Addvehicle({super.key});

  @override
  State<Addvehicle> createState() => _AddvehicleState();
}

class _AddvehicleState extends State<Addvehicle> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> vehicles = [
    {
      'name': 'Truck',
      'number': 'UP32 AB 1234',
      'driver': 'Ramesh Kumar',
      'capacity': 'Capacity: 5,000 Pieces',
      'image': 'assets/Tru.jpg',
    },
    {
      'name': 'Tractor',
      'number': 'UP32 CD 5678',
      'driver': 'Suresh Yadav',
      'capacity': 'Capacity: 3,000 Pieces',
      'image': 'assets/tractor.jpg',
    },
    {
      'name': 'Pickup',
      'number': 'UP32 EF 9012',
      'driver': 'Amit Singh',
      'capacity': 'Capacity: 2,000 Pieces',
      'image': 'assets/trucstyle.jpg',
    },
    {
      'name': 'Mini Truck',
      'number': 'UP32 GH 3456',
      'driver': 'Rahul Kumar',
      'capacity': 'Capacity: 1,000 Pieces',
      'image': 'assets/Tru.jpg',
    },
    {
      'name': 'Pickup',
      'number': 'UP32 EF 9012',
      'driver': 'Amit Singh',
      'capacity': 'Capacity: 2,000 Pieces',
      'image': 'assets/trucstyle.jpg',
    },
  ];

  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredVehicles = vehicles.where((vehicle) {
      return vehicle.values.any(
        (value) => value.toLowerCase().contains(searchText.toLowerCase()),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFFFFCFA),
      body: Column(
        children: [
          SizedBox(height: 35),

          CustomHeader(),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vehicle',
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xFF8E1B12),
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.7,
                        ),
                      ),
                      Text(
                        'manage your factory vehicle',
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFF687078),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  Addvihclecategory()));
                  },
                  child: Container(
                    height: Sizes.screenHeight * 0.039,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF860D05),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 16),
                        SizedBox(width: 3),
                        Text(
                          'Add Vehicle',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            height: Sizes.screenHeight * 0.048,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFFAF5F2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFD5D0CC), width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Color(0xFF183342), size: 26),

                SizedBox(width: 12),

                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
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
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Expanded(
            child: filteredVehicles.isEmpty
                ? Center(child: Text('No vehicles found'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: filteredVehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = filteredVehicles[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFFF1E8E2)),
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
                                vehicle['image']!,
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
                                    vehicle['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Color(0xFFB32616),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 3),

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
                                          vehicle['number']!,
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
                                          vehicle['driver']!,
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
                                        Icons.inventory_2,
                                        size: 12,
                                        color: Color(0xFF9B351F),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          vehicle['capacity']!,
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

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8, right: 2),
                                  child: GestureDetector(
                                    onTap: () {},
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
          ),
        ],
      ),
    );
  }
}
