import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/dailypayout.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/labour_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/savepaymentview_model.dart';
import 'package:provider/provider.dart';

import 'Constantcustomecalender.dart';
import 'Sizes.dart';

class GiveAdvancePopup extends StatefulWidget {
  final String? labourId;
  final String? labourName;

  const GiveAdvancePopup({
    super.key,
    this.labourId,
    this.labourName,
  });

  @override
  State<GiveAdvancePopup> createState() => _GiveAdvancePopupState();
}

class _GiveAdvancePopupState extends State<GiveAdvancePopup> {
  final Color redColor = const Color(0xFF98251D);

  String? selectedLabourId;
  String selectedPayment = 'Cash';

  DateTime selectedDate = DateTime.now();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.labourId != null && widget.labourId!.isNotEmpty) {
      selectedLabourId = widget.labourId;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final labourVM = Provider.of<LabourListViewModel>(context, listen: false);
      if (labourVM.labourListModel == null) {
        labourVM.LabourApi().then((_) {
          if (mounted &&
              selectedLabourId == null &&
              labourVM.labourListModel?.data != null &&
              labourVM.labourListModel!.data!.isNotEmpty) {
            setState(() {
              selectedLabourId =
                  labourVM.labourListModel!.data!.first.id.toString();
            });
          }
        });
      } else if (selectedLabourId == null &&
          labourVM.labourListModel?.data != null &&
          labourVM.labourListModel!.data!.isNotEmpty) {
        setState(() {
          selectedLabourId =
              labourVM.labourListModel!.data!.first.id.toString();
        });
      }
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} '
        '${[
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ][date.month - 1]} ${date.year}';
  }

  Future<void> handleSaveAdvance() async {
    if (selectedLabourId == null || selectedLabourId!.isEmpty) {
      Utils.showErrorMessage(context, 'Please select a labourer');
      return;
    }

    if (amountController.text.trim().isEmpty ||
        double.tryParse(amountController.text.trim()) == null ||
        double.parse(amountController.text.trim()) <= 0) {
      Utils.showErrorMessage(context, 'Enter a valid advance amount');
      return;
    }

    final dateStr =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

    final savePaymentVM =
        Provider.of<SavePaymentViewModel>(context, listen: false);

    final success = await savePaymentVM.savePaymentApi(
      selectedLabourId!,
      amountController.text.trim(),
      dateStr,
      selectedPayment.toLowerCase(),
      "advance",
      notesController.text.trim(),
    );

    if (!mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, 'Advance saved successfully!');
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Dailypayout(),
        ),
      );
    } else {
      Utils.showErrorMessage(
        context,
        savePaymentVM.errorMessage ?? 'Failed to save advance',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final labourVM = Provider.of<LabourListViewModel>(context);
    final labourList = labourVM.labourListModel?.data ?? [];

    if (selectedLabourId == null && labourList.isNotEmpty) {
      selectedLabourId = labourList.first.id.toString();
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFCF8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.volunteer_activism,
                    color: redColor,
                    size: 29,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Give Advance',
                      style: GoogleFonts.poppins(
                        color: redColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Text(
                'Labourer *',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              const SizedBox(height: 4),

              widget.labourName != null && widget.labourName!.isNotEmpty
                  ? Container(
                      height: Sizes.screenHeight * 0.046,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F3EF),
                        border: Border.all(color: const Color(0xFFEAE4DD)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        widget.labourName!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF263747),
                        ),
                      ),
                    )
                  : Container(
                      height: Sizes.screenHeight * 0.046,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFEAE4DD)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedLabourId,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: Text(
                            'Select Labourer',
                            style: GoogleFonts.poppins(fontSize: 11),
                          ),
                          items: labourList.map((labour) {
                            final name = (labour.name != null &&
                                    labour.name.toString().isNotEmpty)
                                ? labour.name.toString()
                                : 'Labour #${labour.id}';
                            final code = labour.labourCode != null
                                ? ' (${labour.labourCode})'
                                : '';
                            return DropdownMenuItem<String>(
                              value: labour.id.toString(),
                              child: Text(
                                '$name$code',
                                style: GoogleFonts.poppins(fontSize: 11),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedLabourId = value;
                              });
                            }
                          },
                        ),
                      ),
                    ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Advance Amount *',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          height: Sizes.screenHeight * 0.046,
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              prefixText: '₹  ',
                              hintText: 'Enter amount',
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                  color: Color(0xFFEAE4DD),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                  color: Color(0xFFEAE4DD),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Payment Date *',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
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
                            height: Sizes.screenHeight * 0.046,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFEAE4DD),
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 17,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    formatDate(selectedDate),
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                'Payment Mode *',
                style: TextStyle(fontSize: 11),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  paymentButton('Cash', Icons.money, 'Cash'),
                   SizedBox(width: 5),
                  paymentButton('UPI', Icons.payments, 'UPI'),
                   SizedBox(width: 5),
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                'Notes (Optional)',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 5),

              SizedBox(
                height: Sizes.screenHeight * 0.046,
                child: TextField(
                  controller: notesController,
                  style: GoogleFonts.poppins(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'e.g. Festival advance, personal reason...',
                    hintStyle: const TextStyle(fontSize: 10),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 9,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Color(0xFFEAE4DD),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Color(0xFFEAE4DD),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Sizes.screenHeight * 0.046,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: redColor,
                          side: BorderSide(color: redColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: SizedBox(
                      height: Sizes.screenHeight * 0.046,
                      child: ElevatedButton(
                        onPressed: () async {
                          await handleSaveAdvance();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Provider.of<SavePaymentViewModel>(context).loading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Save Advance',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentButton(String title, IconData icon, String value) {
    bool isSelected = selectedPayment == value;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPayment = value;
          });
        },
        child: Container(
          height: Sizes.screenHeight * 0.046,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF0EC) : Colors.white,
            border: Border.all(
              color: isSelected ? redColor : const Color(0xFFEAE4DD),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? redColor : Colors.blueGrey,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  title,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: isSelected ? redColor : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
