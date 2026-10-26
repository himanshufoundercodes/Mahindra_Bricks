import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem {
  final String title;
  final String value;
  final Widget icon;
  final Color iconBgColor;
  final Color cardBgColor;
  final Color borderColor;
  final Color titleColor;
  final Color valueColor;

  SummaryItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBgColor,
    required this.cardBgColor,
    required this.borderColor,
    this.titleColor =  const Color(0xFF636A73),
    required this.valueColor,
  });
}

class HorizontalSummaryCards extends StatelessWidget {
  final List<SummaryItem>? items;

  HorizontalSummaryCards({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    final defaultItems = items ?? [
      SummaryItem(
        title: 'Total Orders',
        value: '12',
        icon: Icon(
          Icons.description_outlined,
          color: Color(0xFF81241B),
          size: 15,
        ),
        iconBgColor: Color(0xFFFDE8E6),
        cardBgColor: Color(0xFFFFF8F7),
        borderColor: Color(0xFFF7E6E3),
        titleColor: Color(0xFF636A73),
        valueColor: Color(0xFF81241B),
      ),
      SummaryItem(
        title: 'Total Purchase',
        value: '36,000 pcs',
        icon: _buildBricksIcon(Color(0xFF81241B)),
        iconBgColor: Color(0xFFFCF0D7),
        cardBgColor: Color(0xFFFFFBF3),
        borderColor: Color(0xFFF7EEDC),
        titleColor: Color(0xFF636A73),
        valueColor: Color(0xFF81241B),
      ),
      SummaryItem(
        title: 'Total Amount',
        value: '₹ 1,80,000',
        icon: Text(
          '₹',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF16A34A),
          ),
        ),
        iconBgColor: Color(0xFFDCF3E4),
        cardBgColor: Color(0xFFF2F9F5),
        borderColor: Color(0xFFE1F2E6),
        titleColor: Color(0xFF636A73),
        valueColor: Color(0xFF0F1E36),
      ),
      SummaryItem(
        title: 'Pending Balance',
        value: '₹ 20,000',
        icon: Icon(
          Icons.account_balance_wallet_rounded,
          color: Color(0xFF81241B),
          size: 15,
        ),
        iconBgColor: Color(0xFFFCE2E2),
        cardBgColor: Color(0xFFFFF5F5),
        borderColor: Color(0xFFF7DEDF),
        titleColor: Color(0xFF991B1B),
        valueColor: Color(0xFFDC2626),
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFFFFBF8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFF1E5DF),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: List.generate(defaultItems.length, (index) {
            final item = defaultItems[index];
            return Container(
              width: 125,
              margin: EdgeInsets.only(
                right: index == defaultItems.length - 1 ? 0 : 6,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: item.cardBgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: item.borderColor,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: item.iconBgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: item.icon,
                  ),
                  SizedBox(height: 3),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: item.titleColor,
                    ),
                  ),
                  SizedBox(height: 1),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.value,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: item.valueColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  static Widget _buildBricksIcon(Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        SizedBox(height: 1),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 7,
              height: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            SizedBox(width: 1),
            Container(
              width: 7,
              height: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
