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
  final TextEditingController OrderquantityController = TextEditingController();
  final TextEditingController OrderrateController = TextEditingController();
  final TextEditingController OrderadvanceController = TextEditingController();
  final TextEditingController OrdertransportController = TextEditingController();
  final TextEditingController OrderlabourController = TextEditingController();
  final TextEditingController OrderdiscountController = TextEditingController();

  final Color brown = Color(0xFF702B1C);
  final Color backgroundColor = Color(0xFFFEF6F3);
  final Color borderColor = Color(0xFFE5E0DD);

  String? selectedClient;

  bool isProductDropdownOpen = false;
  stock_model.Data? selectedProduct;
  int? selectedProductId;
  int? selectedPaymentOptionId;

  bool isVehicleDropdownOpen = false;
  VehicleModel? selectedVehicle;

  String selectedPaymentMode = '1';
  DateTime selectedDeliveryDate = DateTime(2026, 12, 10);

  Future<void> saveNewOrder() async {
    if (selectedClient == null || selectedClient!.isEmpty) {
      Utils.showErrorMessage(context, 'Please select a client');
      return;
    }
    if (selectedProductId == null) {
      Utils.showErrorMessage(context, 'Please select a product');
      return;
    }

    if (OrderquantityController.text.trim().isEmpty) {
      Utils.showErrorMessage(context, 'Please enter quantity');
      return;
    }

    final enterQty = int.tryParse(OrderquantityController.text.trim()) ?? 0;
    final availableStock = (double.tryParse(selectedProduct?.stockQuantity?.toString() ?? '0') ?? 0).toInt();

    if (enterQty <= 0) {
      Utils.showErrorMessage(context, 'Please enter a valid quantity');
      return;
    }

    if (enterQty > availableStock) {
      Utils.showErrorMessage(context, 'Quantity cannot exceed available stock ($availableStock)');
      return;
    }

    if (OrderrateController.text.trim().isEmpty) {
      Utils.showErrorMessage(context, 'Please enter rate');
      return;
    }

    final deliveryDateStr =
        "${selectedDeliveryDate.year}-${selectedDeliveryDate.month.toString().padLeft(2, '0')}-${selectedDeliveryDate.day.toString().padLeft(2, '0')}";

    List<Map<String, dynamic>> items = [
      {
        "product_id": selectedProductId,
        "quantity": int.tryParse(OrderquantityController.text.trim()) ?? 0,
        "rate": double.tryParse(OrderrateController.text.trim()) ?? 0,
      }
    ];

    final addOrderVM = Provider.of<AddOrderViewModel>(context, listen: false);
    final success = await addOrderVM.orderApi(
      selectedClient!,
      deliveryDateStr,
      selectedVehicle?.vehicle_number?.toString() ?? "",
      selectedPaymentMode,
      OrdertransportController.text.trim().isEmpty ? "0" : OrdertransportController.text.trim(),
      OrderlabourController.text.trim().isEmpty ? "0" : OrderlabourController.text.trim(),
      OrderdiscountController.text.trim().isEmpty ? "0" : OrderdiscountController.text.trim(),
      OrderadvanceController.text.trim().isEmpty ? "0" : OrderadvanceController.text.trim(),
      items,
    );

    if (!mounted) return;

    if (success) {
      Utils.showSuccessMessage(context, 'Order created successfully');
      Navigator.pop(context);
    } else {
      Utils.showErrorMessage(context, addOrderVM.errorMessage ?? 'Order creation failed');
    }
  }

  @override
  void initState() {
    super.initState();
    OrderquantityController.addListener(() => setState(() {}));
    OrderrateController.addListener(() => setState(() {}));
    OrdertransportController.addListener(() => setState(() {}));
    OrderlabourController.addListener(() => setState(() {}));
    OrderdiscountController.addListener(() => setState(() {}));
    OrderadvanceController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClientListViewModel>(context, listen: false).clintApi();
      Provider.of<VehicleViewmodel>(context, listen: false).vehicleApi().then((_) {
        if (mounted) {
          final vehicleVM = Provider.of<VehicleViewmodel>(context, listen: false);
          if (vehicleVM.vehicleList.isNotEmpty && selectedVehicle == null) {
            setState(() {
              selectedVehicle = vehicleVM.vehicleList.first;
            });
          }
        }
      });
      Provider.of<StocklistViewmodel>(context, listen: false).stockListApi().then((_) {
        if (mounted) {
          final stockVM = Provider.of<StocklistViewmodel>(context, listen: false);
          if (stockVM.stockListModel?.data != null && stockVM.stockListModel!.data!.isNotEmpty) {
            if (selectedProduct == null) {
              setState(() {
                selectedProduct = stockVM.stockListModel!.data!.first;
                selectedProductId = selectedProduct?.id is int
                    ? selectedProduct?.id as int
                    : int.tryParse(selectedProduct?.id.toString() ?? '');
                if (selectedProduct?.sellingPrice != null) {
                  OrderrateController.text = selectedProduct!.sellingPrice.toString();
                } else if (selectedProduct?.pricePerUnit != null) {
                  OrderrateController.text = selectedProduct!.pricePerUnit.toString();
                }
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
    OrderquantityController.dispose();
    OrderrateController.dispose();
    OrderadvanceController.dispose();
    OrdertransportController.dispose();
    OrderlabourController.dispose();
    OrderdiscountController.dispose();
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

    if (selectedProduct == null && stockList.isNotEmpty) {
      selectedProduct = stockList.first;
      selectedProductId = selectedProduct?.id is int
          ? selectedProduct?.id as int
          : int.tryParse(selectedProduct?.id.toString() ?? '');
      if (OrderrateController.text.isEmpty) {
        if (selectedProduct?.sellingPrice != null) {
          OrderrateController.text = selectedProduct!.sellingPrice.toString();
        } else if (selectedProduct?.pricePerUnit != null) {
          OrderrateController.text = selectedProduct!.pricePerUnit.toString();
        }
      }
    }
    double quantity = double.tryParse(OrderquantityController.text.trim()) ?? 0;
    double rate = double.tryParse(OrderrateController.text.trim()) ?? 0;
    double itemTotal = quantity * rate;
    double transportCharge = double.tryParse(OrdertransportController.text.trim()) ?? 0;
    double labourCharge = double.tryParse(OrderlabourController.text.trim()) ?? 0;
    double discount = double.tryParse(OrderdiscountController.text.trim()) ?? 0;
    double totalAmount = itemTotal + transportCharge + labourCharge - discount;
    if (totalAmount < 0) totalAmount = 0;
    double advanceAmount = double.tryParse(OrderadvanceController.text.trim()) ?? 0;
    double remainingBalance = totalAmount - advanceAmount;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Sizes.screenWidth * 0.15,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: brown, size: 27),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: Sizes.screenWidth * 0.112,
                      width: Sizes.screenWidth * 0.112,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFB58B76),
                          width: 1.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'MAHINDRA BRICKS',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: brown,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Text(
                            'P A V E R   B L O C K S',
                            style: GoogleFonts.poppins(
                              fontSize: 9,
                              letterSpacing: 0.5,
                              color: brown,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'New Order',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor
                            ),
                          ),
                          Text(
                            'Create a new sales order',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF66615D),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.fromLTRB(13, 10, 13, 13),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFDFC),
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Color(0xFFF1EAE6)),
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
                            color: Color(0xFFFFEFEB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.person, color: brown, size: 28),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Client Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: brown,
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
                              Provider.of<ClientListViewModel>(context, listen: false).clintApi();
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: brown,
                            side: BorderSide(color: brown.withOpacity(0.65)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            minimumSize: Size(0, 34),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, size: 18),
                              SizedBox(width: 5),
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
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Color(0xFF34404B),
                        ),
                        children: [
                          TextSpan(text: 'Select Client '),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.poppins(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFFCFCFC),
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xFF646B72),
                            size: 21,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: clientList.loading
                                ? Center(
                                    child: SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2),
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
                                          color: Color(0xFF858B94),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 21,
                                        color: Color(0xFF555B62),
                                      ),
                                      items: clientList.clientListModel?.data?.map((
                                        clientItem,
                                      ) {
                                        final company = clientItem.companyName?.toString() ?? '';
                                        final contact = clientItem.contactPerson?.toString() ?? '';
                                        final name = company.isNotEmpty
                                            ? company
                                            : (contact.isNotEmpty ? contact : 'Client #${clientItem.id}');
                                        final mobile = clientItem.mobile != null && clientItem.mobile.toString().isNotEmpty
                                            ? ' (${clientItem.mobile})'
                                            : '';
                                        return DropdownMenuItem<String>(
                                          value: clientItem.id.toString(),
                                          child: Text(
                                            '$name$mobile',
                                            style: GoogleFonts.poppins(fontSize: 12),
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
                    SizedBox(height: 11),
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
                                  color: Color(0xFF34404B),
                                ),
                              ),
                              SizedBox(height: 3),
                              SizedBox(
                                height: Sizes.screenHeight * 0.052,
                                // child: TextField(
                                //   keyboardType: TextInputType.phone,
                                //   inputFormatters: [
                                //     FilteringTextInputFormatter.digitsOnly,
                                //     LengthLimitingTextInputFormatter(10),
                                //   ],
                                //   style: GoogleFonts.poppins(fontSize: 11),
                                //   decoration: InputDecoration(
                                //     hintText: 'Enter mobile number',
                                //     hintStyle: GoogleFonts.poppins(
                                //       fontSize: 11,
                                //       color: Color(0xFF858B94),
                                //     ),
                                //     prefixIcon: Icon(
                                //       Icons.call,
                                //       size: 17,
                                //       color: Color(0xFF646B72),
                                //     ),
                                //     prefixIconConstraints: BoxConstraints(
                                //       minWidth: 38,
                                //     ),
                                //     contentPadding: EdgeInsets.symmetric(
                                //       horizontal: 8,
                                //       vertical: 10,
                                //     ),
                                //     filled: true,
                                //     fillColor: Color(0xFFFCFCFC),
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(7),
                                //       borderSide: BorderSide(
                                //         color: borderColor,
                                //       ),
                                //     ),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(7),
                                //       borderSide: BorderSide(
                                //         color: borderColor,
                                //       ),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(7),
                                //       borderSide: BorderSide(color: brown),
                                //     ),
                                //   ),
                                // ),
                                child:  AppTextField(
                                  controller: OrdermobileController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  hintText: 'Enter number',
                                  height: Sizes.screenHeight * 0.050,
                                  hintTextHeight: Sizes.screenHeight * 0.008,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 11),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF34404B),
                                  ),
                                  children: [
                                    TextSpan(text: 'Delivery Address '),
                                    TextSpan(
                                      text: '*',
                                      style: GoogleFonts.poppins(
                                        color: Colors.red.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3),
                              SizedBox(
                                height: Sizes.screenHeight * 0.055,
                                child:  AppTextField(
                                  prefix: Icon(
                                    Icons.location_on,
                                    size: 14,
                                  ),
                                  controller: OrderaddressController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Enter Compnay name',
                                  height: Sizes.screenHeight * 0.050,
                                  hintTextHeight: Sizes.screenHeight * 0.005,
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
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF0E6E0)),
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
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.inventory_2,
                              color: Color(0xFF8B291C),
                              size: 18,
                            ),
                          ),
                          SizedBox(width: 8),
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
                      SizedBox(height: 6),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Product ',
                              style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFF34404B)),
                            ),
                            TextSpan(
                              text: '*',
                              style: GoogleFonts.poppins(fontSize: 11, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isProductDropdownOpen = !isProductDropdownOpen;
                                });
                              },
                              child: Container(
                                height: Sizes.screenHeight * 0.052,
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFCFCFC),
                                  border: Border.all(color: Color(0xFFDDE0E3)),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: Sizes.screenHeight * 0.034,
                                      width: Sizes.screenWidth * 0.07,
                                      color: Color(0xFFF9E9E2),
                                      child: (selectedProduct?.imageUrl != null &&
                                              selectedProduct!.imageUrl.toString().isNotEmpty)
                                          ? Image.network(
                                              selectedProduct!.imageUrl.toString(),
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) =>
                                                  Image.asset('assets/bricks.jpg', fit: BoxFit.contain),
                                            )
                                          : Image.asset(
                                              'assets/bricks.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                    ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            selectedProduct?.name?.toString() ?? 'Select Product',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF263747),
                                            ),
                                          ),
                                          SizedBox(height: 1),
                                          Text(
                                            '${selectedProduct?.dimensions ?? 'N/A'}  |  ${selectedProduct?.colour ?? 'Red'}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              color: Color(0xFF687078),
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
                                      color: Color(0xFF59636F),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: Sizes.screenHeight * 0.052,
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F7F1),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Available Stock',
                                    style: GoogleFonts.poppins(
                                      fontSize: 9,
                                      color: Color(0xFF59636F),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    '${selectedProduct?.stockQuantity ?? 0} pcs',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF24713C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (isProductDropdownOpen)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Color(0xFFDDE0E3)),
                          ),
                          child: stockViewModel.loading
                              ? Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(child: CircularProgressIndicator()),
                                )
                              : stockList.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Center(
                                        child: Text(
                                          'No Products Available',
                                          style: GoogleFonts.poppins(fontSize: 11),
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: stockList.map((product) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedProduct = product;
                                              selectedProductId = product.id is int
                                                  ? product.id as int
                                                  : int.tryParse(product.id.toString());
                                              isProductDropdownOpen = false;

                                              if (product.sellingPrice != null) {
                                                OrderrateController.text = product.sellingPrice.toString();
                                              } else if (product.pricePerUnit != null) {
                                                OrderrateController.text = product.pricePerUnit.toString();
                                              }

                                              final availableStock = (double.tryParse(product.stockQuantity?.toString() ?? '0') ?? 0).toInt();
                                              final enteredQty = int.tryParse(OrderquantityController.text.trim()) ?? 0;
                                              if (enteredQty > availableStock) {
                                                OrderquantityController.text = availableStock > 0 ? availableStock.toString() : '';
                                                Utils.showErrorMessage(
                                                  context,
                                                  'Quantity adjusted to available stock ($availableStock)',
                                                );
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Color(0xFFF9E9E2),
                                                  ),
                                                  child: (product.imageUrl != null &&
                                                          product.imageUrl.toString().isNotEmpty)
                                                      ? Image.network(
                                                          product.imageUrl.toString(),
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context, error, stackTrace) =>
                                                              Image.asset('assets/bricks.jpg', fit: BoxFit.contain),
                                                        )
                                                      : Image.asset('assets/bricks.jpg', fit: BoxFit.contain),
                                                ),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        product.name?.toString() ?? '',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Size: ${product.dimensions ?? 'N/A'} | Stock: ${product.stockQuantity ?? 0}',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 9,
                                                          color: Color(0xFF687078),
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
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Quantity (pcs) ',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Color(0xFF34404B)),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.039,
                                  child: AppTextField(
                                    controller: OrderquantityController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    hintText: 'Enter Quantity',
                                    height: Sizes.screenHeight * 0.039,
                                    hintTextHeight: Sizes.screenHeight * 0.0001,
                                    onChanged: (value) {
                                      if (value.isEmpty) return;
                                      if (selectedProduct == null) {
                                        OrderquantityController.clear();
                                        Utils.showErrorMessage(context, 'Please select a product first');
                                        return;
                                      }
                                      final availableStock = (double.tryParse(selectedProduct?.stockQuantity?.toString() ?? '0') ?? 0).toInt();
                                      final enteredQty = int.tryParse(value.trim()) ?? 0;
                                      if (enteredQty > availableStock) {
                                        OrderquantityController.text = availableStock > 0 ? availableStock.toString() : '';
                                        OrderquantityController.selection = TextSelection.fromPosition(
                                          TextPosition(offset: OrderquantityController.text.length),
                                        );
                                        Utils.showErrorMessage(
                                          context,
                                          'Quantity cannot exceed available stock ($availableStock)',
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Rate (₹) ',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Color(0xFF34404B)),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: GoogleFonts.poppins(fontSize: 10, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.039,
                                  child: AppTextField(
                                    prefixIcon: Icons.currency_rupee,
                                    controller: OrderrateController,
                                    keyboardType: TextInputType.number,
                                    hintText: 'Enter Rate',
                                    height: Sizes.screenHeight * 0.035,
                                    hintTextHeight: Sizes.screenHeight * 0.0001,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Container(
                              height: Sizes.screenHeight * 0.059,
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF0EE),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item Total',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Color(0xFF81241B),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    '₹ ${((double.tryParse(OrderquantityController.text.trim()) ?? 0) * (double.tryParse(OrderrateController.text.trim()) ?? 0)).toStringAsFixed(2)}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
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
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFF0E6E0)),
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
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.directions_bus,
                              color: Color(0xFF8B291C),
                              size: 18,
                            ),
                          ),
                          SizedBox(width: 8),
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
                      SizedBox(height: 6),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Vehicle ',
                              style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFF34404B)),
                            ),
                            TextSpan(
                              text: '*',
                              style: GoogleFonts.poppins(fontSize: 11, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isVehicleDropdownOpen = !isVehicleDropdownOpen;
                          });
                        },
                        child: Container(
                          height: Sizes.screenHeight * 0.052,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFFCFCFC),
                            border: Border.all(color: Color(0xFFDDE0E3)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: Sizes.screenHeight * 0.034,
                                width: Sizes.screenWidth * 0.07,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9E9E2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.local_shipping_outlined,
                                  color: Color(0xFF8B291C),
                                  size: 18,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedVehicle?.vehicle_name?.toString() ?? 'Select Vehicle',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF263747),
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      'Number: ${selectedVehicle?.vehicle_number ?? 'N/A'}  |  Driver: ${selectedVehicle?.driver_name ?? 'N/A'}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 9,
                                        color: Color(0xFF687078),
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
                                color: Color(0xFF59636F),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isVehicleDropdownOpen)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Color(0xFFDDE0E3)),
                          ),
                          child: vehicleViewModel.loading
                              ? Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(child: CircularProgressIndicator()),
                                )
                              : vehicleList.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.all(12),
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
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Color(0xFFF9E9E2),
                                                  ),
                                                  child: Icon(
                                                    Icons.directions_bus,
                                                    color: Color(0xFF8B291C),
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${vehicle.vehicle_name ?? ''} (${vehicle.vehicle_number ?? ''})',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Driver: ${vehicle.driver_name ?? 'N/A'} | Phone: ${vehicle.driver_mobile ?? 'N/A'}',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 9,
                                                          color: Color(0xFF687078),
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFF0E6E0),
                    ),
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
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.calculate,
                              size: 23,
                              color: Color(0xFF81241B),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Amount Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            Text(
                              '₹ ${itemTotal.toStringAsFixed(4)}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF172A40),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFEDE3DE),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transport Charge',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF59636F),
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                controller: OrdertransportController,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFEDE3DE),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
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
                                color: Color(0xFF59636F),
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                controller: OrderlabourController,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFEDE3DE),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
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
                                color: Color(0xFF59636F),
                              ),
                            ),
                            SizedBox(
                              width: Sizes.screenWidth * 0.205,
                              height: Sizes.screenHeight * 0.033,
                              child: TextField(
                                controller: OrderdiscountController,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0.00',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Color(0xFF858B94),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 14,
                                    color: Color(0xFF59636F),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDE0E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEEEE),
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFF0E6E0),
                    ),
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
                              color: Color(0xFFF8E7E1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.account_balance_wallet,
                              size: 22,
                              color: Color(0xFF81241B),
                            ),
                          ),
                          SizedBox(width: 10),
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
                      SizedBox(height: 8),
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
                                    color: Color(0xFF34404B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.043,
                                  child: AppTextField(
                                    prefixIcon: Icons.currency_rupee,
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
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Mode',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF34404B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: Sizes.screenHeight * 0.043,
                                  child: DropdownButtonFormField<String>(
                                    value: selectedPaymentMode,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF263747),
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 9),
                                      filled: true,
                                      fillColor: Color(0xFFFCFCFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                          color: Color(0xFFDDE0E3),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
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
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEEEE),
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
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
