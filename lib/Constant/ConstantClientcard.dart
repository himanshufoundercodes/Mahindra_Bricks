import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class ClientCard extends StatelessWidget {
  final String companyName;
  final String mobileNumber;
  final String location;
  final String totalOrders;
  final String totalPurchase;
  final String pendingBalance;
  final Color pendingBalanceColor;
  final String statusText;
  final Color statusBgColor;
  final Color statusTextColor;
  final VoidCallback? onCall;
  final VoidCallback? onArrowTap;

  ClientCard({
    super.key,
    required this.companyName,
    required this.mobileNumber,
    required this.location,
    required this.totalOrders,
    required this.totalPurchase,
    required this.pendingBalance,
    this.pendingBalanceColor = const Color(0xFFE53935),
    this.statusText = 'Active Client',
    this.statusBgColor = const Color(0xFFE6F4E7),
    this.statusTextColor = const Color(0xFF287A38),
    this.onCall,
    this.onArrowTap, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFCFA),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFF3EAE5)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Sizes.screenHeight * 0.032,
                width: Sizes.screenWidth * 0.070,
                decoration: BoxDecoration(
                  color: Color(0xFFFBEAE5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.apartment,
                  color: Color(0xFF963025),
                  size: 16,
                ),
              ),

              SizedBox(width: 9),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            companyName,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF172033),
                            ),
                          ),
                        ),
                        SizedBox(width: 3),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: statusBgColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            statusText,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: statusTextColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: onCall,
                          child: Container(
                            height: Sizes.screenHeight * 0.036,
                            width: Sizes.screenWidth * 0.065,
                            decoration: BoxDecoration(
                              color: Color(0xFFFBEAE5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.call,
                              size: 15,
                              color: Color(0xFF963025),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, -4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 12,
                                color: Color(0xFF626262),
                              ),
                              SizedBox(width: 4),
                              Text(
                                mobileNumber,
                                style: GoogleFonts.poppins(
                                  fontSize: 10.5,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 12,
                                color: Color(0xFF777777),
                              ),
                              SizedBox(width: 4),
                              Text(
                                location,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Color(0xFF555555),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 8),
          Divider(height: 1, color: Color(0xFFEFE7E2)),
          SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _infoItem(
                  icon: Icons.receipt,
                  title: 'Total Orders',
                  value: totalOrders,
                  valueColor: Color(0xFF172033),
                ),
              ),

              Container(
                height: Sizes.screenHeight * 0.032,
                width: 1,
                color: Color(0xFFE8E1DC),
              ),

              Expanded(
                child: _infoItem(
                  icon: Icons.inventory_2,
                  title: 'Total Purchase',
                  value: totalPurchase,
                  valueColor: Color(0xFF172033),
                ),
              ),

              Container(
                height: 32,
                width: 1,
                color: Color(0xFFE8E1DC),
              ),

              Expanded(
                child: _infoItem(
                  icon: Icons.currency_rupee,
                  title: 'Pending Balance',
                  value: '₹ $pendingBalance',
                  valueColor: pendingBalanceColor,
                ),
              ),

              GestureDetector(
                onTap: onArrowTap,
                child: Container(
                  height: Sizes.screenHeight * 0.040,
                  width: Sizes.screenWidth * 0.06,
                  margin: EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFFBEAE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: Color(0xFF963025),
                    size: 19,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem({
    required IconData icon,
    required String title,
    required String value,
    required Color valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFF963025),
            size: 17,
          ),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 8.5,
                    color: Color(0xFF777777),
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
