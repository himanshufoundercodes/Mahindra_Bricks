import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/viewmodel/reportsview_model.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantcustomecalender.dart';
import 'Constant/Constantreportcard.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'circularprogressindicator.dart';
import 'drawer.dart';

class Report extends StatefulWidget {
  final Function(int)? onMenuTap;
  final int selectedIndex;

  const Report({
    super.key,
    this.onMenuTap,
    this.selectedIndex = 4,
  });

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  final List<Color> backgroundColors = const [
    AppColor.lightred,
    Color(0xFFF2F9F3),
    Color(0xFFF0F7FF),
    Color(0xFFFFF8EC),
    Color(0xFFFFF0F0),
  ];

  final List<String> defaultImages = const [
    "assets/r1.jpg",
    "assets/r2.jpg",
    "assets/r3.jpg",
    "assets/r4.jpg",
    "assets/r5.jpg",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReportsviewModel>(
        context,
        listen: false,
      ).ReportsApi();
    });
  }

  String formatApiDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Select date';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day.toString().padLeft(2, '0')} '
        '${months[date.month - 1]} ${date.year}';
  }

  String formatStringDate(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return 'Select date';
    final dt = DateTime.tryParse(rawDate);
    if (dt == null) return rawDate;
    return formatDate(dt);
  }

  void _fetchFilteredReports() {
    final String fromStr = formatApiDate(selectedStartDate);
    final String toStr = formatApiDate(selectedEndDate);

    Provider.of<ReportsviewModel>(
      context,
      listen: false,
    ).ReportsApi(
      fromDate: fromStr,
      toDate: toStr,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportsList = Provider.of<ReportsviewModel>(context);
    final reportModel = reportsList.reportListModel;
    final cardData = reportModel?.data ?? reportModel?.cards ?? [];

    final apiDateRange = reportModel?.dateRange;
    if (selectedStartDate == null && apiDateRange?.fromDate != null) {
      selectedStartDate = DateTime.tryParse(apiDateRange!.fromDate!);
    }
    if (selectedEndDate == null && apiDateRange?.toDate != null) {
      selectedEndDate = DateTime.tryParse(apiDateRange!.toDate!);
    }

    final String displayStartDate = selectedStartDate != null
        ? formatDate(selectedStartDate)
        : formatStringDate(apiDateRange?.fromDate);
    final String displayEndDate = selectedEndDate != null
        ? formatDate(selectedEndDate)
        : formatStringDate(apiDateRange?.toDate);

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showDrawer: true,
        logoAsset: 'assets/logo.jpg',
      ),
      drawer: MahindraDrawer(
        onMenuTap: widget.onMenuTap,
        selectedIndex: widget.selectedIndex,
      ),
      body: RefreshIndicator(
        color: AppColor.stockAmountColor,
        backgroundColor: Colors.white,
        displacement: 50,
        onRefresh: () async {
          _fetchFilteredReports();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(
                title: reportModel?.title,
                subtitle: reportModel?.subtitle,
              ),
              SizedBox(height: Sizes.screenHeight * 0.006),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        child: CustomCalendar(
                          isRange: true,
                          startDate: selectedStartDate ?? DateTime.now(),
                          endDate: selectedEndDate ?? DateTime.now(),
                          onRangeSelected: (start, end) {
                            setState(() {
                              selectedStartDate = start;
                              selectedEndDate = end;
                            });
                            Navigator.pop(dialogContext);
                            _fetchFilteredReports();
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: Sizes.screenHeight * 0.047,
                  margin: EdgeInsets.symmetric(
                      horizontal: Sizes.screenWidth * 0.04),
                  padding: EdgeInsets.symmetric(
                      horizontal: Sizes.screenWidth * 0.027),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: AppColor.stockUnitColor,
                        size: 20,
                      ),
                      SizedBox(width: Sizes.screenWidth * 0.027),
                      Expanded(
                        child: Text(
                          '$displayStartDate  -  $displayEndDate',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF273142),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.black,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Sizes.screenHeight * 0.012),
              if (reportsList.loading)
                const Center(
                  child: Circularprogressindicator(),
                )
              else if (reportsList.errorMessage != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(reportsList.errorMessage!),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Retry',
                          onPressed: _fetchFilteredReports,
                        ),
                      ],
                    ),
                  ),
                )
              else if (cardData.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'No reports available',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColor.gey,
                      ),
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    final item = cardData[index];
                    final imagePath = (item.image != null && item.image!.isNotEmpty)
                        ? item.image!
                        : defaultImages[index % defaultImages.length];

                    final details = (item.stats ?? []).map((stat) {
                      return {
                        "label": stat.label ?? "",
                        "value": stat.value ?? "",
                        "color": "FFAD2018",
                      };
                    }).toList();

                    return CustomReportCard(
                      title: item.title ?? "",
                      subtitle: item.subtitle ?? "",
                      imagePath: imagePath,
                      backgroundColor:
                          backgroundColors[index % backgroundColors.length],
                      iconBackgroundColor: const Color(0xFFFCEBE8),
                      details: details,
                      onTap: () {},
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({String? title, String? subtitle}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenHeight * 0.010,
        vertical: Sizes.screenHeight * 0.010,
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
                  title ?? 'Report',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  subtitle ?? 'View and analyze your factory report',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
