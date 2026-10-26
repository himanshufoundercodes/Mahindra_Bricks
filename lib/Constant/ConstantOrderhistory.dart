
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistoryItem {
  final String orderNo;
  final String date;
  final String product;
  final String quantity;
  final String totalAmount;
  final String paidAmount;
  final String pendingAmount;
  final String status;

  const OrderHistoryItem({
    required this.orderNo,
    required this.date,
    required this.product,
    required this.quantity,
    required this.totalAmount,
    required this.paidAmount,
    required this.pendingAmount,
    required this.status,
  });
}

class OrderHistoryTable extends StatelessWidget {
  final List<OrderHistoryItem> orders;
  final Function(OrderHistoryItem)? onOrderTap;

  const OrderHistoryTable({
    super.key,
    required this.orders,
    this.onOrderTap,
  });

  static const Color brown = Color(0xFF81241B);
  static const Color borderColor = Color(0xFFEDE3DE);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8E5DE),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(
                  Icons.receipt_long,
                  color: brown,
                  size: 27,
                ),
              ),
              const SizedBox(width: 12),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order History',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: brown,
                    ),
                  ),
                  Text(
                    'Recent and past orders of this client',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF687078),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Horizontal Scroll Table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                children: [
                  // Table Heading
                  Row(
                    children: const [
                      _OrderCell('#', 32, isHeader: true),
                      _OrderCell('Order No.', 100, isHeader: true),
                      _OrderCell('Date', 82, isHeader: true),
                      _OrderCell('Product & Qty', 95, isHeader: true),
                      _OrderCell('Total Amount', 82, isHeader: true),
                      _OrderCell('Paid / Pending', 90, isHeader: true),
                      _OrderCell('Status', 102, isHeader: true),
                      _OrderCell('', 38, isHeader: true),
                    ],
                  ),

                  // Dynamic Order Rows
                  ...List.generate(orders.length, (index) {
                    return OrderHistoryTile(
                      number: index + 1,
                      order: orders[index],
                      onTap: () {
                        onOrderTap?.call(orders[index]);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Custom Tile
class OrderHistoryTile extends StatelessWidget {
  final int number;
  final OrderHistoryItem order;
  final VoidCallback? onTap;

  const OrderHistoryTile({
    super.key,
    required this.number,
    required this.order,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Color statusBg;
    IconData statusIcon;

    switch (order.status.toLowerCase()) {
      case 'dispatched':
        statusColor = const Color(0xFF218044);
        statusBg = const Color(0xFFE0F3E4);
        statusIcon = Icons.local_shipping;
        break;

      case 'completed':
        statusColor = const Color(0xFF218044);
        statusBg = const Color(0xFFE0F3E4);
        statusIcon = Icons.check_circle;
        break;

      default:
        statusColor = const Color(0xFFE58A00);
        statusBg = const Color(0xFFFFF0D7);
        statusIcon = Icons.access_time;
    }

    return Row(
      children: [
        _OrderCell('$number', 32),
        _OrderCell(order.orderNo, 100),
        _OrderCell(order.date, 82),
        _OrderCell(
          '${order.product}\n${order.quantity}',
          95,
        ),
        _OrderCell(order.totalAmount, 82),

        // Paid / Pending
        Container(
          width: 90,
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 7),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xFFEDE3DE)),
              bottom: BorderSide(color: Color(0xFFEDE3DE)),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.paidAmount,
                style:  GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xFF172A40),
                ),
              ),
              Text(
                '/ ${order.pendingAmount}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: order.pendingAmount == '₹ 0'
                      ?  Color(0xFF172A40)
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),

        // Status Badge
        Container(
          width: 102,
          height: 52,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xFFEDE3DE)),
              bottom: BorderSide(color: Color(0xFFEDE3DE)),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: statusBg,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(statusIcon, size: 15, color: statusColor),
                const SizedBox(width: 4),
                Text(
                  order.status,
                  style: TextStyle(
                    fontSize: 11,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          width: 38,
          height: 52,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFFF9E8E3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 22,
                  color: Color(0xFF81241B),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Reusable Table Cell
class _OrderCell extends StatelessWidget {
  final String text;
  final double width;
  final bool isHeader;

  const _OrderCell(
      this.text,
      this.width, {
        this.isHeader = false,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: BoxConstraints(
        minHeight: isHeader ? 30 : 52,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 6,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: isHeader ? const Color(0xFFFFEEEE) : null,
        border: const Border(
          right: BorderSide(color: Color(0xFFEDE3DE)),
          bottom: BorderSide(color: Color(0xFFEDE3DE)),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: isHeader ? 9 : 11,
          fontWeight: isHeader ? FontWeight.w600 : FontWeight.normal,
          color: isHeader
              ?  Color(0xFF81241B)
              :  Color(0xFF263747),
        ),
      ),
    );
  }
}
