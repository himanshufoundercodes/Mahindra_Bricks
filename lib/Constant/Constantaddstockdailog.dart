
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';
import 'package:provider/provider.dart';

import '../addcementstock.dart';
import '../utils/utils.dart';
import '../viewmodel/addcementstock_viewmodel.dart';
import 'ConstnatTextfield.dart';
import 'Constnat_Appbutton.dart';

class CustomAddStockDialog extends StatefulWidget {
  const CustomAddStockDialog({super.key});

  @override
  State<CustomAddStockDialog> createState() =>
      _CustomAddStockDialogState();
}

class _CustomAddStockDialogState
    extends State<CustomAddStockDialog> {

  DateTime selectedDate = DateTime.now();

  final TextEditingController quantityController =
  TextEditingController();

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  Future<void> handleCementStock() async {

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
    context.read<AddcementstockViewmodel>();

    if (viewModel.loading) return;

    final success = await viewModel.addCementStockApi(
      quantityController.text.trim(),
      DateFormat('yyyy-MM-dd').format(selectedDate),
    );

    if (!mounted) return;

    if (success) {

      Utils.showSuccessMessage(
        context,
        'Add new Stock Successfully!',
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
          viewModel.errorMessage ?? 'Stock add failed';

      Utils.showErrorMessage(
        context,
        message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final addCementViewModel =
    context.watch<AddcementstockViewmodel>();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: const Color(0xFFFFFBF8),
          borderRadius: BorderRadius.circular(13),
        ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // HEADER

              Row(
                children: [

                  Container(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.12,

                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE9E2),
                      borderRadius: BorderRadius.circular(9),
                    ),

                    child: Image.asset(
                      'assets/bag.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      'Add new Stock',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFB51F16),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: addCementViewModel.loading
                        ? null
                        : () => Navigator.pop(context),

                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF737373),
                      size: 23,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // DATE LABEL

              RichText(
                text: TextSpan(
                  text: 'Date ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: const [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              // DATE FIELD

              InkWell(
                onTap: addCementViewModel.loading
                    ? null
                    : () async {

                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),

                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context)
                              .colorScheme
                              .copyWith(
                            primary: const Color(0xFFB51F16),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (date != null && mounted) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },

                child: Container(
                  height: Sizes.screenHeight * 0.045,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: const Color(0xFFD8D8D8),
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
                            color: const Color(0xFF374151),
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.calendar_month,
                        size: 19,
                        color: Color(0xFF657080),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // QUANTITY LABEL

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
                      style: GoogleFonts.poppins(
                        color: AppColor.red,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              // QUANTITY FIELD

              AppTextField(
                suffix: Text(
                  'Bags',
                  style: TextStyle(
                    color: AppColor.gey,
                  ),
                ),

                controller: quantityController,
                keyboardType: TextInputType.number,
                hintText: 'Enter number of bags',
              ),

              const SizedBox(height: 18),

              // BUTTONS

              Row(
                children: [

                  CustomButton(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.39,
                    text: 'Cancel',
                    type: CustomButtonType.outlined,
                    textColor: AppColor.red,
                    borderColor: AppColor.red,

                    onPressed: addCementViewModel.loading
                        ? null
                        : () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(width: 10),

                  CustomButton(
                    height: Sizes.screenHeight * 0.050,
                    width: Sizes.screenWidth * 0.39,
                    text: 'Add Stock',
                    iconOnLeft: false,

                    isLoading: addCementViewModel.loading,

                    onPressed: addCementViewModel.loading
                        ? null
                        : () async {
                      await handleCementStock();
                    },
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
