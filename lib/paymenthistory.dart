import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:mahindra_bricks/Constant/constant_dateformatter.dart';
import 'package:mahindra_bricks/viewmodel/paymenthistoryview_model.dart';
import 'package:provider/provider.dart';

class Paymenthistory extends StatefulWidget {
  final dynamic labourId;
  const Paymenthistory({super.key, this.labourId});

  @override
  State<Paymenthistory> createState() => _PaymenthistoryState();
}

class _PaymenthistoryState extends State<Paymenthistory> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaymentHistoryViewModel>(
        context,
        listen: false,
      ).labourPayoutHistoryApi(labourId: widget.labourId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentHistory = Provider.of<PaymentHistoryViewModel>(context);
    final historyList = paymentHistory.paymentHistoryModel?.data ?? [];

    return Scaffold(
      body: RefreshIndicator(
        color: const Color(0xFF782A17),
        onRefresh: () async {
          await Provider.of<PaymentHistoryViewModel>(
            context,
            listen: false,
          ).labourPayoutHistoryApi(labourId: widget.labourId);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                height: Sizes.screenHeight * 0.060,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF782A17),
                    size: 24,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: const Color(0xFFF0E8E3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment History',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF782A17),
                          ),
                        ),
                        Text(
                          'View All',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF782A17),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Date',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xFF687386),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Amount',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xFF687386),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Mode',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xFF687386),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Notes',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xFF687386),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Added By',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xFF687386),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (paymentHistory.loading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF782A17),
                          ),
                        ),
                      )
                    else if (historyList.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: Text(
                            'No payment history found',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF687386),
                            ),
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: historyList.length,
                        itemBuilder: (context, index) {
                          final item = historyList[index];

                          // Date formatting
                          String formattedDate = '-';
                          if (item.paymentDate != null && item.paymentDate.toString().isNotEmpty) {
                            formattedDate = DataFormatter.dateShort(item.paymentDate);
                          } else if (item.createdAt != null && item.createdAt.toString().isNotEmpty) {
                            formattedDate = DataFormatter.dateShort(item.createdAt);
                          }

                          // Amount formatting
                          String amountStr = '-';
                          if (item.amount != null) {
                            amountStr = '₹ ${item.amount}';
                          }

                          // Mode, Notes, AddedBy
                          String modeStr = item.paymentMode?.toString() ?? '-';
                          String notesStr = item.notes?.toString() ?? '-';
                          if (notesStr.trim().isEmpty) notesStr = '-';
                          String addedByStr = item.addedBy?.toString() ?? '-';
                          if (addedByStr.trim().isEmpty) addedByStr = '-';

                          final bool isLast = index == historyList.length - 1;

                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: isLast
                                  ? null
                                  : const Border(
                                      bottom: BorderSide(
                                        color: Color(0xFFEAEAEA),
                                        width: 0.6,
                                      ),
                                    ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    formattedDate,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: const Color(0xFF45505E),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    amountStr,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: const Color(0xFF45505E),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    modeStr,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: const Color(0xFF45505E),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    notesStr,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: const Color(0xFF45505E),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    addedByStr,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: const Color(0xFF45505E),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
