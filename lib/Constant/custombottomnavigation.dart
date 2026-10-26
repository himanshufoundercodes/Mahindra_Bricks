
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding:  EdgeInsets.symmetric(
      ),
      decoration:  BoxDecoration(
        color: Color(0xFFFFFCF8),
        border: Border(
          top: BorderSide(
            color: Color(0xFFF0E7DF),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [

          navItem(
            index: 0,
            icon: Icons.home,
            title: 'Home',
          ),
          navItem(
            index: 1,
            icon: Icons.inventory_2,
            title: 'Stock',
          ),
          navItem(
            index: 2,
            icon: Icons.shopping_cart,
            title: 'Orders',
          ),

          navItem(
            index: 3,
            icon: Icons.groups,
            title: 'Labour',
          ),
          navItem(
            index: 4,
            icon: Icons.bar_chart,
            title: 'Reports',
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          onTap(index);
        },
        borderRadius: BorderRadius.circular(18),
        child: Container(
          margin:  EdgeInsets.only(bottom: 10, top: 2, left: 6, right: 4),
          decoration: BoxDecoration(
            color: isSelected
                ?  Color(0xFFFBE8DC)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                icon,
                size: 19,
                color: isSelected
                    ?  Color(0xFF782A17)
                    :  Color(0xFF858078),
              ),

               SizedBox(height: 2),

              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  fontWeight: isSelected
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: isSelected
                      ?  Color(0xFF782A17)
                      :  Color(0xFF77716D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

