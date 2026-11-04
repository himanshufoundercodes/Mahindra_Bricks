import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/model/cementstock_model.dart';
import 'package:mahindra_bricks/viewmodel/addcementstock_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/cementstockview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Conctantcementstock.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantaddstockdailog.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantheader.dart';
import 'Constant/customerecordcementusage.dart';
import 'circularprogressindicator.dart';

class Addcementstock extends StatefulWidget {
  Addcementstock({super.key});

  @override
  State<Addcementstock> createState() => _AddcementstockState();
}

class _AddcementstockState extends State<Addcementstock> {
  final TextEditingController textController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')} "
        "${[
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ][date.month - 1]} ${date.year}";
  }
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CementStockViewModel>(
        context,
        listen: false,
      ).cementStockApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cementStock = Provider.of<CementStockViewModel>(context);
    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.stockAmountColor,
        backgroundColor: Colors.white,
        displacement: 30,
          onRefresh: () async {
            await Provider.of<CementStockViewModel>(
              context,
              listen: false,
            ).cementStockApi();
          },
        child: cementStock.loading
            ? Center(
          child: Transform.translate(
            offset: Offset(0, -105),
            child: Circularprogressindicator(),
          ),
        ):
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 36),
              CustomHeader(),
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
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
                              color: Color(0xFF9E1B12),
                              letterSpacing: -0.3,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Manage your cement stock and usage',
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7B838B),
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8),

                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: CustomCalendar(
                                isRange: false,
                                selectedDate: selectedDate,
                                onDateSelected: (date) {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: Sizes.screenHeight * 0.036,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFCFA),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFFF0E5DE),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 12,
                              color: Color(0xFF9E1B12),
                            ),
                            SizedBox(width: 3),
                            Text(
                              formatDate(selectedDate),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9E1B12),
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 15,
                              color: Color(0xFF9E1B12),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.42,
                children: [
                  CementStockCard(
                    title: 'Current Stock',
                    value: '${cementStock.cementStockModel?.summary?.current_stock.toString()} bags',
                    icon: Icons.inventory_2_outlined,
                    backgroundColor: Color(0xFFFFF0EB),
                    iconColor: Color(0xFF9E3020),
                    valueColor: Color(0xFFAD1E18),
                    imagePath: 'assets/r1.jpg',
                  ),

                  CementStockCard(
                    title: "Today's Stock In",
                    value: '${cementStock.cementStockModel?.summary?.today_stock_in.toString()} bags',
                    icon: Icons.download,
                    backgroundColor: Color(0xFFFFF7E6),
                    iconColor: Color(0xFFB96B00),
                    valueColor: Color(0xFFB45D00),
                  ),

                  CementStockCard(
                    title: "Today's Used",
                    value: '${cementStock.cementStockModel?.summary?.today_used.toString()} bags',
                    icon: Icons.trending_up,
                    backgroundColor: Color(0xFFEEF8EC),
                    iconColor: Color(0xFF087443),
                    valueColor: Color(0xFF087443),
                  ),

                  CementStockCard(
                    title: 'Closing Stock (Today)',
                    value: '${cementStock.cementStockModel?.summary?.closing_stock.toString()} bags',
                    icon: Icons.calendar_month,
                    backgroundColor: Color(0xFFEBF4FF),
                    iconColor: Color(0xFF0968C5),
                    valueColor: Color(0xFF0968C5),
                    subtitle: '(Current Stock + Stock In - Used)',
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: Sizes.screenHeight * 0.055,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFC9251B),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return CustomAddStockDialog(
                                            );
                                          },
                                        );
                                      },
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: Sizes.screenHeight * 0.060,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEDE8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Color(0xFF9E2118),
                                    size: 23,
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Customerecordcementusage(
                                            );
                                          },
                                        );
                                      },
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
                                              color: Color(0xFF8E1B12),
                                            ),
                                          ),
                                          Text(
                                            'Record cement used',
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              color: Color(0xFF8E1B12),
                                            ),
                                          ),
                                        ],
                                      ),
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

                  SizedBox(height: 14),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFCFA),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFF5EDE7),
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
                              color: Color(0xFF9E1B12),
                            ),
                          ),

                          SizedBox(height: 8),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xFFF2EDE9),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE6F5E9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.move_to_inbox,
                                    color: Color(0xFF17824B),
                                    size: 19,
                                  ),
                                ),

                                SizedBox(width: 9),

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
                                          color: Color(0xFF263238),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 4),

                                Text(
                                  '+${cementStock.cementStockModel?.summary?.today_stock_in.toString()} bags',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF087443),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xFFF2EDE9),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: Sizes.screenHeight * 0.050,
                                  width: Sizes.screenHeight * 0.034,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFEAE5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.trending_up,
                                    color: Color(0xFFD9362B),
                                    size: 19,
                                  ),
                                ),

                                SizedBox(width: 9),

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
                                          color: Color(0xFF263238),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 4),

                                Text(
                                  '-${cementStock.cementStockModel?.summary?.today_stock_in.toString()} bags',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD32F2F),
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
      ),
    );
  }
}
