import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Constant_Color.dart';
import 'package:mahindra_bricks/model/stocklist_model.dart' as stock_model;
import 'package:mahindra_bricks/model/vehicle_model.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/addorder_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/clientview_model.dart';
import 'package:mahindra_bricks/viewmodel/stocklist_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/vehicle_viewmodel.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constantbutton.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Sizes.dart';
import 'addclient.dart';

class Neworder extends StatefulWidget {
  const Neworder({super.key});

  @override
  State<Neworder> createState() => _NeworderState();
}

class _NeworderState extends State<Neworder> {
  final TextEditingController OrdermobileController = TextEditingController();
  final TextEditingController OrderaddressController = TextEditingController();
  final TextEditingController OrderadvanceController = TextEditingController();
  final TextEditingController OrdertransportController =
      TextEditingController();
  final TextEditingController OrderlabourController = TextEditingController();
  final TextEditingController OrderdiscountController = TextEditingController();

  final Color brown = const Color(0xFF702B1C);
  final Color backgroundColor = const Color(0xFFFEF6F3);
  final Color borderColor = const Color(0xFFE5E0DD);

  String? selectedClient;
  List<dynamic> selectedProducts = [];
  Map<String, TextEditingController> productQuantityControllers = {};
  Map<String, TextEditingController> productRateControllers = {};

  bool isProductDropdownOpen = false;
  stock_model.Data? selectedProduct;
  int? selectedProductId;
  int? selectedPaymentOptionId;

  bool isVehicleDropdownOpen = false;
  VehicleModel? selectedVehicle;

  String selectedPaymentMode = '1';
  DateTime selectedDeliveryDate = DateTime(2026, 12, 10);

  bool validateMobileNumber(String mobile) {
    if (mobile.length != 10) {
      Utils.showErrorMessage(context, 'Mobile number must be 10 digits');
      return false;
    }
    if (!RegExp(r'^[6-9]').hasMatch(mobile)) {
      Utils.showErrorMessage(context, 'Please Enter valid mobile number');
      return false;
    }
    if (RegExp(r'(\d)\1{3,}').hasMatch(mobile)) {
      Utils.showErrorMessage(context, 'Please Enter valid mobile number');
      return false;
    }
    return true;
  }

  Future<void> saveNewOrder() async {
    if (selectedClient == null || selectedClient!.isEmpty) {
      Utils.showErrorMessage(context, 'Please select a client');
      return;
    }
    String mobile = OrdermobileController.text.trim();

    if (mobile.isNotEmpty && !validateMobileNumber(mobile)) {
      return;
    }

    if (selectedProducts.isEmpty) {
      Utils.showErrorMessage(context, 'Please select at least one product');
      return;
    }

    List<Map<String, dynamic>> itemsPayload = [];

    for (var product in selectedProducts) {
      String key = product.id.toString();
      final qtyText = productQuantityControllers[key]?.text.trim() ?? '';
      final rateText = productRateControllers[key]?.text.trim() ?? '';

      final qty = int.tryParse(qtyText) ?? 0;
      final rate = double.tryParse(rateText) ?? 0;

      final productName = product.name?.toString() ?? 'Product';
      final availableStock =
          (double.tryParse(product.stockQuantity?.toString() ?? '0') ?? 0)
              .toInt();

      if (qty <= 0) {
        Utils.showErrorMessage(
          context,
          'Please enter quantity for $productName',
        );
        return;
      }

      if (qty > availableStock) {
        Utils.showErrorMessage(
          context,
          'Quantity for $productName cannot exceed available stock ($availableStock)',
        );
        return;
      }

      if (rate <= 0) {
        Utils.showErrorMessage(context, 'Please enter rate for $productName');
        return;
      }

      final pId = product.id is int
          ? product.id as int
          : int.tryParse(product.id.toString()) ?? 0;

      itemsPayload.add({"product_id": pId, "quantity": qty, "rate": rate});
    }

    final deliveryDateStr =
        "${selectedDeliveryDate.year}-${selectedDeliveryDate.month.toString().padLeft(2, '0')}-${selectedDeliveryDate.day.toString().padLeft(2, '0')}";

    final addOrderVM = Provider.of<AddOrderViewModel>(context, listen: false);
    final success = await addOrderVM.orderApi(
      selectedClient!,
      deliveryDateStr,
      OrderaddressController.text.trim(),
      selectedVehicle?.vehicle_number?.toString() ?? "",
      selectedPaymentMode,
      OrdertransportController.text.trim().isEmpty
          ? "0"
          : OrdertransportController.text.trim(),
      OrderlabourController.text.trim().isEmpty
          ? "0"
          : OrderlabourController.text.trim(),
      OrderdiscountController.text.trim().isEmpty
          ? "0"
          : OrderdiscountController.text.trim(),
      OrderadvanceController.text.trim().isEmpty
          ? "0"
          : OrderadvanceController.text.trim(),
      itemsPayload,
    );

    if (!mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, 'Order created successfully');
      Navigator.pop(context);
    } else {
      Utils.showErrorMessage(
        context,
        addOrderVM.errorMessage ?? 'Order creation failed',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    OrdertransportController.addListener(() => setState(() {}));
    OrderlabourController.addListener(() => setState(() {}));
    OrderdiscountController.addListener(() => setState(() {}));
    OrderadvanceController.addListener(() => setState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClientListViewModel>(context, listen: false).clintApi();
      Provider.of<VehicleViewmodel>(context, listen: false).vehicleApi().then((
        _,
      ) {
        if (mounted) {
          final vehicleVM = Provider.of<VehicleViewmodel>(
            context,
            listen: false,
          );
          if (vehicleVM.vehicleList.isNotEmpty && selectedVehicle == null) {
            setState(() {
              selectedVehicle = vehicleVM.vehicleList.first;
            });
          }
        }
      });
      Provider.of<StocklistViewmodel>(
        context,
        listen: false,
      ).stockListApi().then((_) {
        if (mounted) {
          final stockVM = Provider.of<StocklistViewmodel>(
            context,
            listen: false,
          );
          if (stockVM.stockListModel?.data != null &&
              stockVM.stockListModel!.data!.isNotEmpty) {
            if (selectedProducts.isEmpty) {
              setState(() {
                final firstProd = stockVM.stockListModel!.data!.first;
                selectedProducts.add(firstProd);
                String productKey = firstProd.id.toString();

                final qCtrl = TextEditingController();
                qCtrl.addListener(() => setState(() {}));
                productQuantityControllers[productKey] = qCtrl;

                String rate =
                    firstProd.sellingPrice?.toString() ??
                    firstProd.pricePerUnit?.toString() ??
                    '';
                final rCtrl = TextEditingController(text: rate);
                rCtrl.addListener(() => setState(() {}));
                productRateControllers[productKey] = rCtrl;

                selectedProduct = firstProd;
                selectedProductId = firstProd.id is int
                    ? firstProd.id as int
                    : int.tryParse(firstProd.id.toString());
              });
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    OrdermobileController.dispose();
    OrderaddressController.dispose();
    OrderadvanceController.dispose();
    OrdertransportController.dispose();
    OrderlabourController.dispose();
    OrderdiscountController.dispose();
    for (var controller in productQuantityControllers.values) {
      controller.dispose();
    }
    for (var controller in productRateControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clientList = Provider.of<ClientListViewModel>(context);
    final stockViewModel = Provider.of<StocklistViewmodel>(context);
    final stockList = stockViewModel.stockListModel?.data ?? [];
    final vehicleViewModel = Provider.of<VehicleViewmodel>(context);
    final vehicleList = vehicleViewModel.vehicleList;

    if (selectedVehicle == null && vehicleList.isNotEmpty) {
      selectedVehicle = vehicleList.first;
    }

    if (selectedProducts.isEmpty && stockList.isNotEmpty) {
      final firstProd = stockList.first;
      selectedProducts.add(firstProd);
      String productKey = firstProd.id.toString();

      final qCtrl = TextEditingController();
      qCtrl.addListener(() => setState(() {}));
      productQuantityControllers[productKey] = qCtrl;

      String rate =
          firstProd.sellingPrice?.toString() ??
          firstProd.pricePerUnit?.toString() ??
          '';
      final rCtrl = TextEditingController(text: rate);
      rCtrl.addListener(() => setState(() {}));
      productRateControllers[productKey] = rCtrl;

      selectedProduct = firstProd;
      selectedProductId = firstProd.id is int
          ? firstProd.id as int
          : int.tryParse(firstProd.id.toString());
    }

    double itemTotal = selectedProducts.fold<double>(0.0, (sum, product) {
      String key = product.id.toString();
      double qty =
          double.tryParse(productQuantityControllers[key]?.text.trim() ?? '') ??
          0;
      double rate =
          double.tryParse(productRateControllers[key]?.text.trim() ?? '') ?? 0;
      return sum + (qty * rate);
    });

    double transportCharge =
        double.tryParse(OrdertransportController.text.trim()) ?? 0;
    double labourCharge =
        double.tryParse(OrderlabourController.text.trim()) ?? 0;
    double discount = double.tryParse(OrderdiscountController.text.trim()) ?? 0;
    double totalAmount = itemTotal + transportCharge + labourCharge - discount;
    if (totalAmount < 0) totalAmount = 0;
    double advanceAmount =
        double.tryParse(OrderadvanceController.text.trim()) ?? 0;
    double remainingBalance = totalAmount - advanceAmount;

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 12),
                padding:  EdgeInsets.fromLTRB(13, 10, 13, 13),
                decoration: BoxDecoration(
                  color:  AppColor.white38,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color:  AppColor.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Sizes.screenHeight * 0.047,
                          width: Sizes.screenWidth * 0.095,
                          decoration:  BoxDecoration(
                            color: AppColor.lightredbg,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.person, color: brown, size: 28),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Client Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockAmountColor,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addclient(),
                              ),
                            );
                            if (context.mounted) {
                              Provider.of<ClientListViewModel>(
                                context,
                                listen: false,
                              ).clintApi();
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.stockAmountColor,
                            side: BorderSide(color: AppColor.stockUnitColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding:  EdgeInsets.symmetric(
                              horizontal: Sizes.screenWidth * 0.020,
                              vertical: Sizes.screenHeight * 0.008,
                            ),
                            minimumSize:  Size(0, 34),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               Icon(Icons.add, size: 18),
                              SizedBox(width: Sizes.screenWidth * 0.012),
                              Text(
                                'Add New Client',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.010),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColor.gey,
                        ),
                        children: [
                           TextSpan(text: 'Select Client '),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.poppins(
                              color: AppColor.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.005),
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColor.white38,
                        border: Border.all(color: AppColor.grey),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                           Icon(
                            Icons.search,
                            color: AppColor.gey,
                            size: 21,
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.020),
                          Expanded(
                            child: clientList.loading
                                ?  Center(
                                    child: SizedBox(
                                      height: Sizes.screenHeight * 0.022,
                                      width: Sizes.screenWidth * 0.045,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedClient,
                                      isExpanded: true,
                                      hint: Text(
                                        'Select client name or mobile number',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color:  AppColor.gey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      icon:  Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 21,
                                        color: AppColor.gey,
                                      ),
                                      items: clientList.clientListModel?.data?.map((
                                        clientItem,
                                      ) {
                                        final company =
                                            clientItem.companyName
                                                ?.toString() ??
                                            '';
                                        final contact =
                                            clientItem.contactPerson
                                                ?.toString() ??
                                            '';
                                        final name = company.isNotEmpty
                                            ? company
                                            : (contact.isNotEmpty
                                                  ? contact
                                                  : 'Client #${clientItem.id}');
                                        final mobile =
                                            clientItem.mobile != null &&
                                                clientItem.mobile
                                                    .toString()
                                                    .isNotEmpty
                                            ? ' (${clientItem.mobile})'
                                            : '';
                                        return DropdownMenuItem<String>(
                                          value: clientItem.id.toString(),
                                          child: Text(
                                            '$name$mobile',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedClient = value;
                                        });
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.013),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile Number',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: AppColor.gey,
                                ),
                              ),
                              SizedBox(height: 3),
                              SizedBox(
                                height: Sizes.screenHeight * 0.052,
                                child: AppTextField(
                                  controller: OrdermobileController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  hintText: 'Enter number',
                                  height: Sizes.screenHeight * 0.050,
                                  hintTextHeight: Sizes.screenHeight * 0.008,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: AppColor.gey,
                                  ),
                                  children: [
                                     TextSpan(text: 'Delivery Address '),
                                    TextSpan(
                                      text: '*',
                                      style: GoogleFonts.poppins(
                                        color: AppColor.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Sizes.screenHeight * 0.004),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child: AppTextField(
                                  controller: OrderaddressController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Enter Address',
                                  height: Sizes.screenHeight * 0.050,
                                  hintTextHeight: Sizes.screenHeight * 0.005,
                                  hintFontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: Sizes.screenHeight * 0.010),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.020,
                ),
                child: Container(
                  padding:  EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    color:  AppColor.white38,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.034,
                            width: Sizes.screenWidth * 0.07,
                            decoration: BoxDecoration(
                              color:  AppColor.lightredbg,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Icon(
                              Icons.inventory_2,
                              color: AppColor.stockAmountColor,
                              size: 18,
                            ),
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.020),
                          Text(
                            'Product Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Sizes.screenHeight * 0.007),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Product ',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: AppColor.gey,
                              ),
                            ),
                            TextSpan(
                              text: '*',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: AppColor.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.004),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductDropdownOpen = !isProductDropdownOpen;
                          });
                        },
                        child: Container(
                          height: Sizes.screenHeight * 0.052,
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.screenWidth * 0.012,
                          ),
                          decoration: BoxDecoration(
                            color:  AppColor.white,
                            border: Border.all(color: AppColor.grey),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.034,
                                width: Sizes.screenWidth * 0.07,
                                color:  Color(0xFFF9E9E2),
                                child:
                                    (selectedProduct?.imageUrl != null &&
                                        selectedProduct!.imageUrl
                                            .toString()
                                            .isNotEmpty)
                                    ? Image.network(
                                        selectedProduct!.imageUrl.toString(),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                                  'assets/bricks.jpg',
                                                  fit: BoxFit.contain,
                                                ),
                                      )
                                    : Image.asset(
                                        'assets/bricks.jpg',
                                        fit: BoxFit.contain,
                                      ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.012),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedProduct?.name?.toString() ??
                                          'Select Product',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color:  AppColor.gey,
                                      ),
                                    ),
                                    SizedBox(height: Sizes.screenHeight * 0.001),
                                    Text(
                                      '${selectedProduct?.dimensions ?? 'N/A'} | ${selectedProduct?.colour ?? 'Red'}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 9,
                                        color: AppColor.gey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isProductDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 18,
                                color: AppColor.gey,
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (isProductDropdownOpen)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: const Color(0xFFDDE0E3)),
                          ),
                          child: stockViewModel.loading
                              ? const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : stockList.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Center(
                                    child: Text(
                                      'No Products Available',
                                      style: GoogleFonts.poppins(fontSize: 11),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: stockList.map((product) {
                                    bool isSelected = selectedProducts.any(
                                      (item) =>
                                          item.id.toString() ==
                                          product.id.toString(),
                                    );

                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          String productKey = product.id
                                              .toString();

                                          if (isSelected) {
                                            selectedProducts.removeWhere(
                                              (item) =>
                                                  item.id.toString() ==
                                                  productKey,
                                            );
                                            productQuantityControllers
                                                .remove(productKey)
                                                ?.dispose();
                                            productRateControllers
                                                .remove(productKey)
                                                ?.dispose();
                                          } else {
                                            selectedProducts.add(product);

                                            final qCtrl =
                                                TextEditingController();
                                            qCtrl.addListener(
                                              () => setState(() {}),
                                            );
                                            productQuantityControllers[productKey] =
                                                qCtrl;

                                            String rate =
                                                product.sellingPrice
                                                    ?.toString() ??
                                                product.pricePerUnit
                                                    ?.toString() ??
                                                '';
                                            final rCtrl = TextEditingController(
                                              text: rate,
                                            );
                                            rCtrl.addListener(
                                              () => setState(() {}),
                                            );
                                            productRateControllers[productKey] =
                                                rCtrl;
                                          }

                                          selectedProduct =
                                              selectedProducts.isNotEmpty
                                              ? selectedProducts.last
                                              : null;

                                          selectedProductId =
                                              selectedProduct?.id is int
                                              ? selectedProduct?.id as int
                                              : int.tryParse(
                                                  selectedProduct?.id
                                                          .toString() ??
                                                      '',
                                                );
                                        });
                                      },
                                      child: Container(
                                        color: isSelected
                                            ?  Color(0xFFFFF0EE)
                                            : Colors.white,
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: Sizes.screenHeight * 0.037,
                                              width: Sizes.screenWidth * 0.075,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color:  Color(0xFFF9E9E2),
                                              ),
                                              child:
                                                  (product.imageUrl != null &&
                                                      product.imageUrl
                                                          .toString()
                                                          .isNotEmpty)
                                                  ? Image.network(
                                                      product.imageUrl
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder:
                                                          (
                                                            context,
                                                            error,
                                                            stackTrace,
                                                          ) => Image.asset(
                                                            'assets/bricks.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                    )
                                                  : Image.asset(
                                                      'assets/bricks.jpg',
                                                      fit: BoxFit.contain,
                                                    ),
                                            ),
                                            SizedBox(width: Sizes.screenWidth * 0.020),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.name?.toString() ??
                                                        '',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Size: ${product.dimensions ?? 'N/A'} | Stock: ${product.stockQuantity ?? 0}',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 9,
                                                      color:  Color(
                                                        0xFF687078,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              isSelected
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined,
                                              color: isSelected
                                                  ?  Color(0xFF24713C)
                                                  :  Color(0xFF9AA0A6),
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ),

                      // SELECTED PRODUCTS CARDS
                      if (selectedProducts.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Selected Products',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                              ),
                            ),
                            Text(
                              '${selectedProducts.length} Products',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColor.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Sizes.screenHeight * 0.006),
                        ...selectedProducts.map((product) {
                          String productKey = product.id.toString();
                          TextEditingController quantityController =
                              productQuantityControllers[productKey] ??
                              TextEditingController();
                          TextEditingController rateController =
                              productRateControllers[productKey] ??
                              TextEditingController();

                          final availableStock =
                              (double.tryParse(
                                        product.stockQuantity?.toString() ??
                                            '0',
                                      ) ??
                                      0)
                                  .toInt();

                          final double singleItemTotal =
                              (double.tryParse(quantityController.text) ?? 0) *
                              (double.tryParse(rateController.text) ?? 0);

                          return Container(
                            margin: EdgeInsets.only(
                              bottom: Sizes.screenHeight * 0.010,
                            ),
                            padding:  EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:  AppColor.grey,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: Sizes.screenHeight * 0.047,
                                      width: Sizes.screenWidth * 0.095,
                                      decoration: BoxDecoration(
                                        color:  Color(0xFFF9E9E2),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child:
                                          (product.imageUrl != null &&
                                              product.imageUrl
                                                  .toString()
                                                  .isNotEmpty)
                                          ? Image.network(
                                              product.imageUrl.toString(),
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Image.asset(
                                                    'assets/bricks.jpg',
                                                    fit: BoxFit.contain,
                                                  ),
                                            )
                                          : Image.asset(
                                              'assets/bricks.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                    ),
                                    SizedBox(width: Sizes.screenWidth * 0.020),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name?.toString() ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color:  AppColor.black,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            '${product.dimensions ?? 'N/A'} | ${product.colour ?? 'Red'}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              color:  AppColor.gey,
                                            ),
                                          ),
                                          Text(
                                            'Stock: $availableStock pcs',
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              color: AppColor.green,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedProducts.removeWhere(
                                            (item) =>
                                                item.id.toString() ==
                                                productKey,
                                          );
                                          productQuantityControllers
                                              .remove(productKey)
                                              ?.dispose();
                                          productRateControllers
                                              .remove(productKey)
                                              ?.dispose();

                                          selectedProduct =
                                              selectedProducts.isNotEmpty
                                              ? selectedProducts.last
                                              : null;

                                          selectedProductId =
                                              selectedProduct?.id is int
                                              ? selectedProduct?.id as int
                                              : int.tryParse(
                                                  selectedProduct?.id
                                                          .toString() ??
                                                      '',
                                                );
                                        });
                                      },
                                      child: Container(
                                        padding:  EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color:  AppColor.lightredbg,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child:  Icon(
                                          Icons.close,
                                          color: AppColor.red2,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Sizes.screenHeight * 0.011),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Quantity (pcs)',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color:  AppColor.gey,
                                            ),
                                          ),
                                          SizedBox(height: Sizes.screenHeight * 0.004),
                                          SizedBox(
                                            height: Sizes.screenHeight * 0.039,
                                            child: AppTextField(
                                              controller: quantityController,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              hintText: 'Enter Qty',
                                              hintFontSize: 13,
                                              height:
                                                  Sizes.screenHeight * 0.039,
                                              hintTextHeight:
                                                  Sizes.screenHeight * 0.0001,
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  int enteredQty =
                                                      int.tryParse(value) ?? 0;

                                                  if (enteredQty >
                                                      availableStock) {
                                                    quantityController.text =
                                                        availableStock > 0
                                                        ? availableStock
                                                              .toString()
                                                        : '';

                                                    quantityController
                                                            .selection =
                                                        TextSelection.fromPosition(
                                                          TextPosition(
                                                            offset:
                                                                quantityController
                                                                    .text
                                                                    .length,
                                                          ),
                                                        );

                                                    Utils.showErrorMessage(
                                                      context,
                                                      'Quantity cannot exceed available stock ($availableStock)',
                                                    );
                                                  }
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: Sizes.screenWidth * 0.012),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rate (₹)',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color:  AppColor.gey,
                                            ),
                                          ),
                                          SizedBox(height: Sizes.screenHeight * 0.004),
                                          SizedBox(
                                            height: Sizes.screenHeight * 0.039,
                                            child: AppTextField(
                                              prefixIcon: Icons.currency_rupee,
                                              controller: rateController,
                                              keyboardType:
                                                   TextInputType.numberWithOptions(
                                                    decimal: true,
                                                  ),
                                              hintText: 'Enter Rate',
                                              height:
                                                  Sizes.screenHeight * 0.039,
                                              hintTextHeight:
                                                  Sizes.screenHeight * 0.0001,
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: Sizes.screenWidth * 0.012),
                                    Expanded(
                                      child: Container(
                                        height: Sizes.screenHeight * 0.059,
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: Sizes.screenWidth * 0.012,
                                          vertical: Sizes.screenHeight * 0.005,
                                        ),
                                        decoration: BoxDecoration(
                                          color:  AppColor.bgbacklight,
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Item Total',
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: AppColor.stockUnitColor,
                                              ),
                                            ),
                                            SizedBox(height: Sizes.screenHeight * 0.001),
                                            Text(
                                              '₹ ${singleItemTotal.toStringAsFixed(2)}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.stockTitleColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                      SizedBox(height: Sizes.screenHeight * 0.007),
                    ],
                  ),
                ),
              ),

              SizedBox(height: Sizes.screenHeight * 0.010),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.020,
                ),
                child: Container(
                  padding:  EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    color:  AppColor.white38,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color:  AppColor.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.034,
                            width: Sizes.screenWidth * 0.07,
                            decoration: BoxDecoration(
                              color:  AppColor.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Icon(
                              Icons.directions_bus,
                              color: AppColor.stockAmountColor,
                              size: 18,
                            ),
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.020),
                          Text(
                            'Vehicle Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.007),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Vehicle ',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: AppColor.gey,
                              ),
                            ),
                            TextSpan(
                              text: '*',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: AppColor.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.004),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isVehicleDropdownOpen = !isVehicleDropdownOpen;
                          });
                        },
                        child: Container(
                          height: Sizes.screenHeight * 0.052,
                          padding:  EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border.all(color:  AppColor.grey),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.034,
                                width: Sizes.screenWidth * 0.07,
                                decoration: BoxDecoration(
                                  color:  AppColor.bgbacklight,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Icon(
                                  Icons.local_shipping_outlined,
                                  color: AppColor.stockAmountColor,
                                  size: 18,
                                ),
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.020),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedVehicle?.vehicle_name
                                              ?.toString() ??
                                          'Select Vehicle',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color:  AppColor.black,
                                      ),
                                    ),
                                    SizedBox(height: Sizes.screenHeight * 0.001),
                                    Text(
                                      'Number: ${selectedVehicle?.vehicle_number ?? 'N/A'}  |  Driver: ${selectedVehicle?.driver_name ?? 'N/A'}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 9,
                                        color: AppColor.gey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isVehicleDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 18,
                                color:  AppColor.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isVehicleDropdownOpen)
                        Container(
                          width: double.infinity,
                          margin:  EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: const Color(0xFFDDE0E3)),
                          ),
                          child: vehicleViewModel.loading
                              ? const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : vehicleList.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Center(
                                    child: Text(
                                      'No Vehicles Available',
                                      style: GoogleFonts.poppins(fontSize: 11),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: vehicleList.map((vehicle) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedVehicle = vehicle;
                                          isVehicleDropdownOpen = false;
                                        });
                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(
                                          horizontal: Sizes.screenWidth * 0.020,
                                          vertical: Sizes.screenHeight * 0.010,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: Sizes.screenHeight * 0.037,
                                              width: Sizes.screenWidth * 0.075,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color:  AppColor.bgbacklight,
                                              ),
                                              child:  Icon(
                                                Icons.directions_bus,
                                                color: AppColor.stockAmountColor,
                                                size: 16,
                                              ),
                                            ),
                                            SizedBox(width: Sizes.screenWidth * 0.020),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${vehicle.vehicle_name ?? ''} (${vehicle.vehicle_number ?? ''})',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Driver: ${vehicle.driver_name ?? 'N/A'} | Phone: ${vehicle.driver_mobile ?? 'N/A'}',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 9,
                                                      color: AppColor.gey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Sizes.screenHeight * 0.012),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.screenWidth * 0.020,
                ),
                child: Container(
                  padding:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:  AppColor.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.042,
                            width: Sizes.screenWidth * 0.085,
                            decoration: BoxDecoration(
                              color: AppColor.bgbacklight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:  Icon(
                              Icons.calculate,
                              size: 23,
                              color: AppColor.stockAmountColor,
                            ),
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.025),
                          Text(
                            'Amount Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Sizes.screenHeight * 0.006),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.006,
                          vertical: Sizes.screenHeight * 0.006,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color:  AppColor.gey,
                              ),
                            ),
                            Text(
                              '₹ ${itemTotal.toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                       Divider(height: Sizes.screenHeight * 0.001, color: AppColor.grey),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: Sizes.screenWidth * 0.006,
                          vertical: Sizes.screenHeight * 0.005,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transport Charge',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.gey,
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                controller: OrdertransportController,
                                keyboardType:
                                     TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color:  AppColor.gey,
                                  ),
                                  prefixIcon:  Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: AppColor.gey,
                                  ),
                                  prefixIconConstraints:  BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding:  EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:  BorderSide(
                                      color: AppColor.gey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:  BorderSide(
                                      color: AppColor.gey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Divider(height: Sizes.screenHeight * 0.001, color: AppColor.grey),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Labour Charge',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.gey,
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                controller: OrderlabourController,
                                keyboardType:
                                     TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: const Color(0xFF858B94),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: Sizes.screenHeight * 0.001, color: AppColor.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount (Optional)',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.gey,
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                controller: OrderdiscountController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: const Color(0xFF858B94),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                            Text(
                              '₹ ${totalAmount.toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFF0E6E0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.040,
                            width: Sizes.screenWidth * 0.080,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.account_balance_wallet,
                              size: 22,
                              color: Color(0xFF81241B),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Payment Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Advance Amount',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF34404B),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.043,
                                  child: AppTextField(
                                    // prefixIcon: Icons.currency_rupee,
                                    controller: OrderadvanceController,
                                    keyboardType: TextInputType.number,
                                    hintText: 'Enter amount',
                                    height: Sizes.screenHeight * 0.040,
                                    hintTextHeight: Sizes.screenHeight * 0.001,
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
                                Text(
                                  'Payment Mode',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF34404B),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.043,
                                  child: DropdownButtonFormField<String>(
                                    value: selectedPaymentMode,
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: const Color(0xFF263747),
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 9,
                                          ),
                                      filled: true,
                                      fillColor: const Color(0xFFFCFCFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('Cash'),
                                      ),
                                      DropdownMenuItem(
                                        value: '2',
                                        child: Text('UPI'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          selectedPaymentMode = value;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEEE),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Remaining Balance',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                            Text(
                              '₹ ${remainingBalance.toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.stockTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SaveCancelButtons(
                  saveText: 'Save Order',
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  onSave: () async {
                    await saveNewOrder();
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildHeader() {
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
                  'New Order',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Create a new sales order',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 9,
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
