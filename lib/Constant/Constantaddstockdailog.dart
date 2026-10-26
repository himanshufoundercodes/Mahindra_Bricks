import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class CustomAddStockDialog extends StatefulWidget {
  final String title;
  final String quantityLabel;
  final String buttonText;
  final String quantityUnit;
  final Function(DateTime date, String quantity)? onSubmit;

  CustomAddStockDialog({
    super.key,
    required this.title,
    required this.quantityLabel,
    required this.buttonText,
    this.quantityUnit = 'Bags',
    this.onSubmit,
  });

  @override
  State<CustomAddStockDialog> createState() =>
      _CustomAddStockDialogState();
}

class _CustomAddStockDialogState
    extends State<CustomAddStockDialog> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController quantityController =
  TextEditingController();

  bool showCalendar = true;

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0xFFFFFBF8),
          borderRadius: BorderRadius.circular(13),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.12,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE9E2),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Image.asset(
                      "assets/bag.jpg",
                      height: 10,
                      width: 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFB51F16),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: Color(0xFF737373),
                      size: 23,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              RichText(
                text: TextSpan(
                  text: 'Date ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),

              InkWell(
                onTap: () {
                  setState(() {
                    showCalendar = !showCalendar;
                  });
                },
                child: Container(
                  height: Sizes.screenHeight * 0.045,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Color(0xFFD8D8D8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat('dd MMM yyyy')
                              .format(selectedDate),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF374151),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: 19,
                        color: Color(0xFF657080),
                      ),
                    ],
                  ),
                ),
              ),

              if (showCalendar)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: Color(0xFFF0E8E3),
                    ),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context)
                          .colorScheme
                          .copyWith(
                        primary: Color(0xFFB51F16),
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                      onDateChanged: (date) {
                        setState(() {
                          selectedDate = date;
                          showCalendar = false;
                        });
                      },
                    ),
                  ),
                ),

              SizedBox(height: 12),

              RichText(
                text: TextSpan(
                  text: '${widget.quantityLabel} ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),

              Container(
                height: Sizes.screenHeight * 0.045,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: Color(0xFFD8D8D8),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText:
                          'Enter ${widget.quantityLabel.toLowerCase()}',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF9CA3AF),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      widget.quantityUnit,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Sizes.screenHeight * 0.045,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                          Color(0xFFB51F16),
                          side: BorderSide(
                            color: Color(0xFFB51F16),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: SizedBox(
                      height: Sizes.screenHeight * 0.045,
                      child: ElevatedButton(
                        onPressed: () {
                          if (quantityController.text
                              .trim()
                              .isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter quantity',
                                ),
                              ),
                            );
                            return;
                          }

                          widget.onSubmit?.call(
                            selectedDate,
                            quantityController.text.trim(),
                          );

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Color(0xFFB51F16),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          widget.buttonText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
}
