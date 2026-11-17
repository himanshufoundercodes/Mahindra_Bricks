import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/url_launcher.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/ordersListviewmodel.dart';
import 'package:mahindra_bricks/viewmodel/updateorderview_model.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantpaymentcard.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'Constant/constant_dateformatter.dart';
import 'model/orderlist_model.dart';
import 'model/vehicle_model.dart';
import 'viewmodel/vehicle_viewmodel.dart';

class Viewproductdetails extends StatefulWidget {
  final OrderdsDataModel? orderData;
  Viewproductdetails({super.key, this.orderData});

  @override
  State<Viewproductdetails> createState() => _ViewproductdetailsState();
}

class _ViewproductdetailsState extends State<Viewproductdetails> {
  String selectedStatus = 'Pending';
  bool isVehicleDropdownOpen = false;
  VehicleModel? selectedVehicle;

  String _formatDateOnly(String? rawDate) {
    if (rawDate == null || rawDate.trim().isEmpty) return '';
    String str = rawDate.trim();
    if (str.contains(',')) {
      str = str.split(',')[0].trim();
    }
    if (str.contains('T')) {
      str = str.split('T')[0].trim();
    } else if (str.contains(' ')) {
      List<String> parts = str.split(' ');
      if (parts.length > 1 && parts[1].contains(':')) {
        str = parts[0].trim();
      }
    }
    return str;
  }

  Future<void> _shareInvoiceOnWhatsApp(OrderdsDataModel? order) async {
    if (order == null) {
      Utils.showErrorMessage(context, 'Order details not available');
      return;
    }

    final String invoiceUrl = order.invoice_url.trim();

    if (invoiceUrl.isEmpty) {
      Utils.showErrorMessage(context, 'Invoice URL not found');
      return;
    }

    final String orderNum = order.order_number.isNotEmpty
        ? order.order_number
        : order.invoice_no;

    final String message =
        'Order Invoice (#ORD-$orderNum):\n$invoiceUrl';

    try {
      if (order.client_mobile.trim().isNotEmpty) {
        await CustomLauncher.whatsapp(
          order.client_mobile.trim(),
          message: message,
        );
      } else {
        await Share.share(message);
      }
    } catch (e) {
      try {
        await Share.share(message);
      } catch (err) {
        if (mounted) {
          Utils.showErrorMessage(context, 'Could not share invoice: $err');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.orderData != null && widget.orderData!.order_status.isNotEmpty) {
      final s = widget.orderData!.order_status.trim();
      final formattedStatus = s.isEmpty
          ? 'Pending'
          : '${s[0].toUpperCase()}${s.substring(1).toLowerCase()}';
      if (['Pending', 'Processing', 'Completed', 'Cancelled', 'Dispatched']
          .contains(formattedStatus)) {
        selectedStatus = formattedStatus;
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VehicleViewmodel>(context, listen: false).vehicleApi().then((_) {
        if (mounted) {
          final vehicleVM = Provider.of<VehicleViewmodel>(context, listen: false);
          if (vehicleVM.vehicleList.isNotEmpty && selectedVehicle == null) {
            setState(() {
              if (widget.orderData != null &&
                  widget.orderData!.vehicle_number.isNotEmpty) {
                final match = vehicleVM.vehicleList.firstWhere(
                  (v) =>
                      v.vehicle_number?.toString().trim().toUpperCase() ==
                      widget.orderData!.vehicle_number.trim().toUpperCase(),
                  orElse: () => vehicleVM.vehicleList.first,
                );
                selectedVehicle = match;
              } else {
                selectedVehicle = vehicleVM.vehicleList.first;
              }
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final vehicleViewModel = Provider.of<VehicleViewmodel>(context);
    final vehicleList = vehicleViewModel.vehicleList;
    if (selectedVehicle == null && vehicleList.isNotEmpty) {
      if (widget.orderData != null &&
          widget.orderData!.vehicle_number.isNotEmpty) {
        selectedVehicle = vehicleList.firstWhere(
          (v) =>
              v.vehicle_number?.toString().trim().toUpperCase() ==
              widget.orderData!.vehicle_number.trim().toUpperCase(),
          orElse: () => vehicleList.first,
        );
      } else {
        selectedVehicle = vehicleList.first;
      }
    }

    final order = widget.orderData;

    String getClientLocation(OrderdsDataModel? o) {
      if (o == null) return 'N/A';
      if (o.delivery_address.trim().isNotEmpty &&
          o.delivery_address.trim().toLowerCase() != 'null') {
        return o.delivery_address.trim();
      }
      if (o.delivery_location.trim().isNotEmpty &&
          o.delivery_location.trim().toLowerCase() != 'null') {
        return o.delivery_location.trim();
      }
      return 'N/A';
    }

    String getDeliveryLocation(OrderdsDataModel? o) {
      if (o == null) return 'N/A';
      if (o.delivery_location.trim().isNotEmpty &&
          o.delivery_location.trim().toLowerCase() != 'null') {
        return o.delivery_location.trim();
      }
      if (o.delivery_address.trim().isNotEmpty &&
          o.delivery_address.trim().toLowerCase() != 'null') {
        return o.delivery_address.trim();
      }
      return 'N/A';
    }

    final String clientLocationText = getClientLocation(order);
    final String deliveryLocationText = getDeliveryLocation(order);

    final String orderTimeStr = (order != null &&
            order.created_at.isNotEmpty &&
            order.created_at.toLowerCase() != 'null')
        ? order.created_at
        : (order?.order_date ?? '');

    final String displayOrderDate = orderTimeStr.isNotEmpty
        ? _formatDateOnly(orderTimeStr)
        : '-';

    final String displayDeliveryDate =
        order != null && order.delivery_date.isNotEmpty
            ? _formatDateOnly(order.delivery_date)
            : '16 Oct 2026';

    return Scaffold(
      backgroundColor: AppColor.bodybackgroundColor,
      appBar: const ConstantAppBar(
        title: 'Dashboard',
        showBranding: true,
        showBackButton: true,
        logoAsset: 'assets/logo.jpg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.021,
                vertical: Sizes.screenHeight * 0.012,
              ),
              color: AppColor.lightredbg,
              child: Row(
                children: [
                  _buildHeader(),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          order != null && order.order_number.isNotEmpty
                              ? 'ORD-${order.order_number}'
                              : 'ORD-2026-0010',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          ),
                        ),
                        Text(
                          displayOrderDate,
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: AppColor.gey,
                          ),
                        ),
                        SizedBox(height: Sizes.screenHeight * 0.005),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.screenWidth * 0.021,
                            vertical: Sizes.screenHeight * 0.006,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.lightyellow,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedStatus,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.yellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.021,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Sizes.screenHeight * 0.049,
                      width: Sizes.screenWidth * 0.105,
                      decoration: BoxDecoration(
                        color: AppColor.lightredbg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: AppColor.stockUnitColor,
                      ),
                    ),
                    SizedBox(width: Sizes.screenWidth * 0.037),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Client Details',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.006),
                          Text(
                            order != null && order.client_name.isNotEmpty
                                ? order.client_name
                                : 'ROYAL BROTHERS GROUP OF COMPANY',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.gey,
                            ),
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.006),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 18,
                                color: AppColor.gey,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.032),
                              Text(
                                order != null && order.client_mobile.isNotEmpty
                                    ? order.client_mobile
                                    : '9685538768',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.screenHeight * 0.005),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 19,
                                color: AppColor.gey,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.032),
                              Expanded(
                                child: Text(
                                  clientLocationText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: AppColor.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.027,
                vertical: Sizes.screenHeight * 0.010,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColor.grey,
                    width: Sizes.screenWidth * 0.003,
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
                            color: AppColor.lightredbg,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.local_shipping,
                            color: AppColor.stockUnitColor,
                            size: 23,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027),
                        Text(
                          'Delivery Details',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockUnitColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vehicle Number',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  order != null && order.vehicle_number.isNotEmpty
                                      ? order.vehicle_number
                                      : 'MP532G8604',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                                SizedBox(height: Sizes.screenHeight * 0.0025),
                                Text(
                                  'Delivery Date',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  displayDeliveryDate,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Sizes.screenHeight * 0.089,
                          width: Sizes.screenWidth * 0.003,
                          color: AppColor.grey,
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.053),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.gey,
                                size: 20,
                              ),
                              SizedBox(width: Sizes.screenWidth * 0.021),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery Location',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.gey,
                                      ),
                                    ),
                                    Text(
                                      deliveryLocationText,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ],
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.027,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColor.grey,
                    width: Sizes.screenWidth * 0.003,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            height: Sizes.screenHeight * 0.043,
                            width: Sizes.screenWidth * 0.095,
                            decoration: BoxDecoration(
                              color: AppColor.bgback,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.receipt_long,
                              color: AppColor.stockTitleColor,
                              size: 23,
                            ),
                          ),
                          SizedBox(width: Sizes.screenWidth * 0.027),
                          Text(
                            'Invoice Details',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.stockTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Sizes.screenHeight * 0.002),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Invoice No.',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: AppColor.gey,
                                ),
                              ),
                              Text(
                                order != null && order.invoice_no.isNotEmpty
                                    ? order.invoice_no
                                    : '10',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027),
                        Container(
                          height: Sizes.screenHeight * 0.039,
                          width: Sizes.screenWidth * 0.003,
                          color: AppColor.grey,
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.030),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 19,
                              color: AppColor.gey,
                            ),
                            SizedBox(width: Sizes.screenWidth * 0.022),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Date',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  displayOrderDate,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.020),
                        Container(
                          height: Sizes.screenHeight * 0.039,
                          width: Sizes.screenWidth * 0.003,
                          color: AppColor.grey,
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.020),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.point_of_sale,
                              size: 19,
                              color: AppColor.gey,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Type',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: AppColor.gey,
                                  ),
                                ),
                                Text(
                                  order != null && order.order_type.isNotEmpty
                                      ? order.order_type
                                      : 'Sales Order',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.027),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white38,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey),
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
                            color: AppColor.bgback,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.view_in_ar,
                            color: AppColor.stockTitleColor,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.027),
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
                    SizedBox(height: Sizes.screenHeight * 0.012),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                          color: AppColor.grey,
                          width: Sizes.screenWidth * 0.0019,
                        ),
                        columnWidths: const {
                          0: FixedColumnWidth(30),
                          1: FixedColumnWidth(155),
                          2: FixedColumnWidth(75),
                          3: FixedColumnWidth(55),
                          4: FixedColumnWidth(60),
                          5: FixedColumnWidth(65),
                          6: FixedColumnWidth(75),
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: AppColor.bgbacklight,
                            ),
                            children: [
                              '#',
                              'Product',
                              'Size',
                              'Colour',
                              'Quantity',
                              'Rate (₹)',
                              'Amount (₹)',
                            ].map((heading) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.screenWidth * 0.011,
                                  vertical: Sizes.screenHeight * 0.010,
                                ),
                                child: Text(
                                  heading,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.stockTitleColor,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          if (order != null && order.items.isNotEmpty)
                            ...order.items.asMap().entries.map((entry) {
                              final index = entry.key;
                              final item = entry.value;
                              return TableRow(
                                children: [
                                  _productCell('${index + 1}'),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: Sizes.screenHeight * 0.042,
                                          width: Sizes.screenWidth * 0.17,
                                          child: Image.asset(
                                            'assets/bricks.jpg',
                                            fit: BoxFit.contain,
                                            errorBuilder: (context, error, stack) {
                                              return Icon(
                                                Icons.image_outlined,
                                                size: 30,
                                                color: AppColor.red,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(width: Sizes.screenWidth * 0.013),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.product_name,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.black,
                                                ),
                                              ),
                                              Text(
                                                'Code: ${item.product_sku.isNotEmpty ? item.product_sku : 'RB-001'}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 9,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _productCell(
                                      item.dimensions.isNotEmpty ? item.dimensions : '-'),
                                  _productCell(
                                      item.colour.isNotEmpty ? item.colour : '-'),
                                  _productCell('${item.quantity} pcs'),
                                  _productCell(item.rate),
                                  _productCell(item.amount),
                                ],
                              );
                            })
                          else
                            TableRow(
                              children: [
                                _productCell('1'),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: Sizes.screenHeight * 0.042,
                                        width: Sizes.screenWidth * 0.17,
                                        child: Image.asset(
                                          'assets/bricks.jpg',
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error, stack) {
                                            return Icon(
                                              Icons.image_outlined,
                                              size: 30,
                                              color: AppColor.red,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(width: Sizes.screenWidth * 0.013),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Red Bricks\n(Standard)',
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black,
                                              ),
                                            ),
                                            Text(
                                              'Code: RB-001',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _productCell('230 × 110 ×\n70 mm'),
                                _productCell('Red'),
                                _productCell('3,000\npcs'),
                                _productCell('5.00'),
                                _productCell('15,000.00'),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Sizes.screenHeight * 0.01),
            CustomAmountPaymentCard(
              icon: Icons.calculate,
              title: 'Amount Details',
              details: [
                {
                  'label': 'Sub Total',
                  'value':
                      '₹ ${order != null && order.sub_total.isNotEmpty ? order.sub_total : '15,000.00'}'
                },
                {
                  'label': 'Transport Charge',
                  'value':
                      '₹ ${order != null && order.transport_charge.isNotEmpty ? order.transport_charge : '4,100.00'}'
                },
                {
                  'label': 'Labour Charge',
                  'value':
                      '₹ ${order != null && order.labour_charge.isNotEmpty ? order.labour_charge : '900.00'}'
                },
                {
                  'label': 'Total Amount',
                  'value':
                      '₹ ${order != null && order.total_amount.isNotEmpty ? order.total_amount : '20,000.00'}',
                  'highlight': 'true',
                },
              ],
              showFooter: true,
              footerTitle: 'Amount In Words',
              footerValue: order != null && order.amount_in_words.isNotEmpty
                  ? order.amount_in_words
                  : 'Twenty Thousand Rupees only',
            ),
            CustomAmountPaymentCard(
              icon: Icons.account_balance_wallet,
              title: 'Payment Details',
              details: [
                {
                  'label': 'Total Amount',
                  'value':
                      '₹ ${order != null && order.total_amount.isNotEmpty ? order.total_amount : '20,000.00'}'
                },
                {
                  'label': 'Advance Amount',
                  'value':
                      '₹ ${order != null && order.advance_amount.isNotEmpty ? order.advance_amount : '0.00'}'
                },
                {
                  'label': 'Amount Paid',
                  'value':
                      '₹ ${order != null && order.amount_paid.isNotEmpty ? order.amount_paid : '0.00'}'
                },
                {
                  'label': 'Remaining Balance',
                  'value':
                      '₹ ${order != null && order.remaining_balance.isNotEmpty ? order.remaining_balance : '20,000.00'}',
                  'highlight': 'true',
                },
                {
                  'label': 'Payment Mode',
                  'value': order != null && order.payment_mode.isNotEmpty
                      ? order.payment_mode
                      : 'Credit'
                },
              ],
            ),
            SizedBox(height: Sizes.screenHeight * 0.01),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.027,
                vertical: Sizes.screenHeight * 0.006,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white38,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.grey),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: Sizes.screenHeight * 0.044,
                        width: Sizes.screenWidth * 0.09,
                        decoration: BoxDecoration(
                          color: AppColor.bgback,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: AppColor.stockTitleColor,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: Sizes.screenWidth * 0.024),
                      Expanded(
                        child: Text(
                          'Update Order Status',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                      ),
                      Container(
                        height: Sizes.screenHeight * 0.047,
                        padding: EdgeInsets.symmetric(
                            horizontal: Sizes.screenWidth * 0.021),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedStatus,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.black,
                              size: 20,
                            ),
                            items: [
                              'Pending',
                              'Processing',
                              'Dispatched',
                            ].map((status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: AppColor.yellow,
                                      size: 17,
                                    ),
                                    SizedBox(width: Sizes.screenWidth * 0.019),
                                    Text(
                                      status,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: AppColor.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.screenHeight * 0.012),
                  Row(
                    children: [
                      Container(
                        height: Sizes.screenHeight * 0.049,
                        width: Sizes.screenHeight * 0.049,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.share,
                            color: AppColor.black87,
                            size: 20,
                          ),
                          onPressed: () {
                            _shareInvoiceOnWhatsApp(order);
                          },
                        ),
                      ),

                      SizedBox(width: Sizes.screenWidth * 0.025),

                      // Update Status Button - Right Side
                      Expanded(
                        child: CustomButton(
                          text: 'Update Status',
                          height: Sizes.screenHeight * 0.049,
                          fontWeight: FontWeight.w500,
                          isLoading: Provider.of<UpdateOrderViewModel>(context).loading,
                          onPressed: () async {
                            if (order == null) return;

                            Map<String, dynamic> data = {
                              "order_status": selectedStatus,
                              "dispatch_status": "Dispatched on 06 Nov",
                              "vehicle_number": selectedVehicle?.vehicle_number ?? '',
                              "payment_option": 2,
                              "amount_paid": int.tryParse(
                                order.amount_paid,
                              ) ?? 0,
                            };

                            bool success = await Provider.of<UpdateOrderViewModel>(
                              context,
                              listen: false,
                            ).updateOrderApi(
                              order.id.toString(),
                              data,
                            );

                            if (context.mounted) {
                              if (success) {
                                setState(() {});

                                Provider.of<OrdersListViewModel>(
                                  context,
                                  listen: false,
                                ).OrdersApi();

                                Utils.showSuccessMessage(
                                  context,
                                  'Order Status Updated Successfully!',
                                );
                              } else {
                                Utils.showErrorMessage(
                                  context,
                                  'Order Status Update Failed',
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.screenHeight * 0.025),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCell(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenWidth * 0.008,
        vertical: Sizes.screenHeight * 0.012,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10,
            color: AppColor.black,
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
                  'Order Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockAmountColor,
                  ),
                ),
                Text(
                  'Order information and status',
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
