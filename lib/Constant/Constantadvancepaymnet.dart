import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constantcustomecalender.dart';
import 'Sizes.dart';

class GiveAdvancePopup extends StatefulWidget {
  GiveAdvancePopup({super.key});

  @override
  State<GiveAdvancePopup> createState() => _GiveAdvancePopupState();
}

class _GiveAdvancePopupState extends State<GiveAdvancePopup> {
  final Color redColor = Color(0xFF98251D);

  String selectedLabour = 'Rajesh Kumar (LB-001)';
  String selectedPayment = 'Cash';

  DateTime selectedDate = DateTime(2026, 10, 17);

  final TextEditingController amountController =
  TextEditingController(text: '2000');

  final TextEditingController notesController =
  TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(0xFFFFFCF8),
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
                  SizedBox(width: 10),
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
                    child: Icon(
                      Icons.close,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14),

              Text(
                'Labourer *',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              SizedBox(height: 4),

              Container(
                height: Sizes.screenHeight * 0.046,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFEAE4DD)),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedLabour,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: [
                      'Rajesh Kumar (LB-001)',
                      'Amit Kumar (LB-002)',
                      'Ramesh Kumar (LB-003)',
                    ].map((labour) {
                      return DropdownMenuItem(
                        value: labour,
                        child: Text(
                          labour,
                          style: TextStyle(fontSize: 11),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLabour = value!;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Advance Amount *',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: Sizes.screenHeight * 0.046,
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              prefixText: '₹  ',
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 9),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                  color: Color(0xFFEAE4DD),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                  color: Color(0xFFEAE4DD),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Date *',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );

                            if (date != null) {
                              setState(() {
                                selectedDate = date;
                              });
                            }
                          },
                         child:  InkWell(
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
                              padding: EdgeInsets.symmetric(horizontal: 7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFEAE4DD),
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 17,
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      formatDate(selectedDate),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Text(
                'Payment Mode *',
                style: TextStyle(fontSize: 11),
              ),
              SizedBox(height: 8),

              Row(
                children: [
                  paymentButton('Cash', Icons.money, 'Cash'),
                  SizedBox(width: 5),
                  paymentButton('UPI', Icons.payments, 'UPI'),
                  SizedBox(width: 5),
                ],
              ),

              SizedBox(height: 10),

              Text(
                'Notes (Optional)',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 5),

              SizedBox(
                height: Sizes.screenHeight * 0.046,
                child: TextField(
                  controller: notesController,
                  style: GoogleFonts.poppins(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'e.g. Festival advance, personal reason...',
                    hintStyle: TextStyle(fontSize: 10),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 9,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: Color(0xFFEAE4DD),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: Color(0xFFEAE4DD),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

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
                  SizedBox(width: 9),
                  Expanded(
                    child: SizedBox(
                      height: Sizes.screenHeight * 0.046,
                      child: ElevatedButton(
                        onPressed: () {
                          if (amountController.text.trim().isEmpty ||
                              double.tryParse(amountController.text) == null ||
                              double.parse(amountController.text) <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Enter a valid amount'),
                              ),
                            );
                            return;
                          }
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
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
            color: isSelected ? Color(0xFFFFF0EC) : Colors.white,
            border: Border.all(
              color: isSelected
                  ? redColor
                  : Color(0xFFEAE4DD),
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
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  title,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: isSelected ? redColor : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
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
