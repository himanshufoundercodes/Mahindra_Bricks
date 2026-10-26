import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

import 'Constant/Conctantcementstock.dart';
import 'Constant/Constantaddstockdailog.dart';
import 'Constant/Constantheader.dart';
class Addcementstock extends StatefulWidget {
  const Addcementstock({super.key});

  @override
  State<Addcementstock> createState() => _AddcementstockState();
}

class _AddcementstockState extends State<Addcementstock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36),
            CustomHeader(),
            SizedBox(height: 10),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cement Stock',
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF9E1B12),
                            letterSpacing: -0.3,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Manage your cement stock and usage',
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF7B838B),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  const SizedBox(width: 8),
        
                  Container(
                    height: Sizes.screenHeight * 0.038,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFCFA),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFFF0E5DE),
                      ),
                    ),
                    child: InkWell(
        
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return CustomAddStockDialog(
                              title: 'Add Cement Stock',
                              quantityLabel: 'Number of Bags',
                              buttonText: 'Add Stock',
                              quantityUnit: 'Bags',
                              onSubmit: (date, quantity) {
                                print('Selected Date: $date');
                                print('Quantity: $quantity');
        
                                // Yahan baad mein API ya stock save karne ka code likhna.
                              },
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 12,
                            color: Color(0xFF9E1B12),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '17 Oct 2026',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF9E1B12),
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 15,
                            color: Color(0xFF9E1B12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.42,
              children: [
                CementStockCard(
                  title: 'Current Stock',
                  value: '240 Bags',
                  icon: Icons.inventory_2_outlined,
                  backgroundColor: const Color(0xFFFFF0EB),
                  iconColor: const Color(0xFF9E3020),
                  valueColor: const Color(0xFFAD1E18),
                  imagePath: 'assets/r1.jpg',
                ),
        
                CementStockCard(
                  title: "Today's Stock In",
                  value: '50 Bags',
                  icon: Icons.download,
                  backgroundColor: const Color(0xFFFFF7E6),
                  iconColor: const Color(0xFFB96B00),
                  valueColor: const Color(0xFFB45D00),
                ),
        
                CementStockCard(
                  title: "Today's Used",
                  value: '18 Bags',
                  icon: Icons.trending_up,
                  backgroundColor: const Color(0xFFEEF8EC),
                  iconColor: const Color(0xFF087443),
                  valueColor: const Color(0xFF087443),
                ),
        
                CementStockCard(
                  title: 'Closing Stock (Today)',
                  value: '240 Bags',
                  icon: Icons.calendar_month,
                  backgroundColor: const Color(0xFFEBF4FF),
                  iconColor: const Color(0xFF0968C5),
                  valueColor: const Color(0xFF0968C5),
                  subtitle: '(Current Stock + Stock In - Used)',
                ),
              ],
            ),
        
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Buttons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: Sizes.screenHeight * 0.055,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC9251B),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add New Stock',
                                        maxLines: 1,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Record cement received',
                                        maxLines: 1,
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
        
                    const SizedBox(width: 8),
        
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: Sizes.screenHeight * 0.060,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFEDE8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.description,
                                  color: Color(0xFF9E2118),
                                  size: 23,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Record Cement Usage',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF8E1B12),
                                        ),
                                      ),
                                      Text(
                                        'Record cement used',
                                        maxLines: 1,
                                        style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          color: const Color(0xFF8E1B12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 14),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFCFA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFF5EDE7),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Activity",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF9E1B12),
                          ),
                        ),
        
                        const SizedBox(height: 8),
        
                        // Cement Stock Received
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFF2EDE9),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 34,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE6F5E9),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.move_to_inbox,
                                  color: Color(0xFF17824B),
                                  size: 19,
                                ),
                              ),
        
                              const SizedBox(width: 9),
        
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cement Stock Received',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF263238),
                                      ),
                                    ),
                                    Text(
                                      '10:30 AM  |  Supplier: UltraTech',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: const Color(0xFF89919A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
        
                              const SizedBox(width: 4),
        
                              Text(
                                '+50 Bags',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF087443),
                                ),
                              ),
                            ],
                          ),
                        ),
        
                        const SizedBox(height: 5),
        
                        // Cement Used
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFF2EDE9),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.050,
                                width: Sizes.screenHeight * 0.034,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFEAE5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.trending_up,
                                  color: Color(0xFFD9362B),
                                  size: 19,
                                ),
                              ),
        
                              const SizedBox(width: 9),
        
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cement Used',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF263238),
                                      ),
                                    ),
                                    Text(
                                      '12:15 PM  |  Paver Block Production',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 8,
                                        color: const Color(0xFF89919A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
        
                              const SizedBox(width: 4),
        
                              Text(
                                '-18 Bags',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFD32F2F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
