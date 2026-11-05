import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:provider/provider.dart';
import '../addcementstock.dart';
import '../utils/utils.dart';
import '../viewmodel/recordcementview_model.dart';
import 'ConstnatTextfield.dart';
import 'Constnat_Appbutton.dart';
class Customerecordcementusage extends StatefulWidget {
  const Customerecordcementusage({super.key});

  @override
  State<Customerecordcementusage> createState() => _CustomerecordcementusageState();
}

class _CustomerecordcementusageState extends State<Customerecordcementusage> {
  DateTime selectedDate = DateTime.now();

  final TextEditingController quantityController = TextEditingController();

  bool showCalendar = true;
  bool isLoading = false;

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  Future<void> handleRecordCementStock() async {

    if (quantityController.text.trim().isEmpty) {
      Utils.showErrorMessage(
        context,
        'Please enter number of bags',
      );
      return;
    }

    if (int.tryParse(quantityController.text.trim()) == null ||
        int.parse(quantityController.text.trim()) <= 0) {
      Utils.showErrorMessage(
        context,
        'Please enter a valid quantity',
      );
      return;
    }

    final viewModel =
    context.read<RecordCementViewModel>();

    if (viewModel.loading) return;

    final success = await viewModel.recordCementStockApi(
      quantityController.text.trim(),
      DateFormat('yyyy-MM-dd').format(selectedDate),
    );

    if (!mounted) return;

    if (success) {

      Utils.showSuccessMessage(
        context,
        'Add New Usages Successfully!',
      );

      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      if (!mounted) return;

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Addcementstock(),
        ),
      );

    } else {

      final message =
          viewModel.errorMessage ?? 'Stock record failed';

      Utils.showErrorMessage(
        context,
        message,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final addRecordCementViewModel =
    context.watch<RecordCementViewModel>();
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
                      'Record Cement Usage',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.red,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: isLoading ? null : () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: Color(0xFF737373),
                      size: 23,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // DATE LABEL
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

              // DATE FIELD
              InkWell(
                onTap: () {
                  setState(() {
                    //  showCalendar = !showCalendar;
                  });
                },

                child: Container(
                  height: Sizes.screenHeight * 0.045,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Color(0xFFD8D8D8)),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat('dd MMM yyyy').format(selectedDate),

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

              // CALENDAR
              Container(
                margin: EdgeInsets.only(top: 4),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),

                  border: Border.all(color: Color(0xFFF0E8E3)),
                ),

                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context).colorScheme
                        .copyWith(primary: Color(0xFFB51F16)),
                  ),

                  child: CalendarDatePicker(
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),

                    onDateChanged: (date) {
                      setState(() {
                        selectedDate = date;
                        showCalendar = true;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 12),

              RichText(
                text: TextSpan(
                  text: 'Number of Bags',

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
              AppTextField(
                suffix:Text('Bags'),
                controller: quantityController,
                keyboardType: TextInputType.number,
                hintText: 'Enter number of bags',
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  CustomButton(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.39,
                    text: 'Cancel',
                    type: CustomButtonType.outlined,
                    textColor: AppColor.red,
                    borderColor: AppColor.red,
                    onPressed: addRecordCementViewModel.loading
                        ? null
                        : () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.39,
                    text: 'Add Stock',
                    iconOnLeft: false,
                    isLoading: addRecordCementViewModel.loading,
                    onPressed: addRecordCementViewModel.loading
                        ? null
                        : () async {
                      await handleRecordCementStock();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

