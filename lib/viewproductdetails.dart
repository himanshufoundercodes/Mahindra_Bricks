import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/url_launcher.dart';
import 'package:mahindra_bricks/utils/utils.dart';
import 'package:mahindra_bricks/viewmodel/ordersListviewmodel.dart';
import 'package:mahindra_bricks/viewmodel/recievedpaymentview_model.dart';
import 'package:mahindra_bricks/viewmodel/updateorderview_model.dart';
import 'package:mahindra_bricks/viewmodel/user_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'Constant/Constant_Appbar.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Constantpaymentcard.dart';
import 'Constant/ConstnatTextfield.dart';
import 'Constant/Constnat_Appbutton.dart';
import 'Constant/Sizes.dart';
import 'core/constant/api_constant.dart';
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
  OrderdsDataModel? currentOrder;
  TextEditingController pendingBalanceController = TextEditingController();
  TextEditingController amountPaidController = TextEditingController();

  String selectedPaymentMode = 'Cash';
  String? selectedMode;
  String? selectedPayment;
  bool isPaymentExpanded = false;
  String selectedStatus = 'Pending';
  bool isVehicleDropdownOpen = false;
  VehicleModel? selectedVehicle;
  bool isOrderCompleted = false;
  List<OrderPaymentItem> paymentHistoryList = [];

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

  String _formatTodayDate() {
    final now = DateTime.now();
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final day = now.day.toString().padLeft(2, '0');
    final month = months[now.month - 1];
    final year = now.year;
    return '$day $month $year';
  }

  void _addNewPaymentRecord(double amount, String mode) {
    final String formattedDate = _formatTodayDate();
    final newPayment = OrderPaymentItem(
      date: formattedDate,
      amount: amount.toStringAsFixed(2),
      mode: mode,
      notes: 'Installment',
      addedBy: 'Admin',
    );
    paymentHistoryList.insert(0, newPayment);
  }

  Future<void> receivePaymentApi() async {
    final order = currentOrder ?? widget.orderData;
    if (order == null) {
      Utils.showErrorMessage(context, 'Order details not available');
      return;
    }

    final double paidAmountInput = double.tryParse(amountPaidController.text.trim()) ?? 0;
    if (paidAmountInput <= 0) {
      Utils.showErrorMessage(context, 'Please enter valid payment amount');
      return;
    }

    final paymentViewModel = Provider.of<ReceivePaymentViewModel>(
      context,
      listen: false,
    );

    bool success = await paymentViewModel.receivePayment(
      url: '${ApiConstants.baseUrl}orders/${order.id}/pay',
      amount: paidAmountInput,
      paymentOption: selectedPaymentMode.toLowerCase() == 'online' ? 2 : 1,
    );

    if (mounted) {
      if (success) {
        amountPaidController.clear();

        dynamic respData = paymentViewModel.paymentResponse?['data'] ??
            paymentViewModel.paymentResponse?['order'];

        setState(() {
          _addNewPaymentRecord(paidAmountInput, selectedPaymentMode);

          if (respData != null && respData is Map<String, dynamic>) {
            currentOrder = OrderdsDataModel.fromJson(respData);
            if (currentOrder!.payments.isNotEmpty) {
              paymentHistoryList = List.from(currentOrder!.payments);
            }
          } else {
            final baseOrder = currentOrder ?? widget.orderData!;
            double oldPaid = double.tryParse(baseOrder.amount_paid.replaceAll(',', '')) ?? 0;
            double totalAmt = double.tryParse(baseOrder.total_amount.replaceAll(',', '')) ?? 0;
            double advAmt = double.tryParse(baseOrder.advance_amount.replaceAll(',', '')) ?? 0;
            double newPaid = oldPaid + paidAmountInput;
            double newRem = totalAmt - (newPaid + advAmt);
            if (newRem < 0) newRem = 0;

            currentOrder = OrderdsDataModel(
              id: baseOrder.id,
              order_number: baseOrder.order_number,
              invoice_no: baseOrder.invoice_no,
              client_id: baseOrder.client_id,
              client_name: baseOrder.client_name,
              client_mobile: baseOrder.client_mobile,
              delivery_address: baseOrder.delivery_address,
              delivery_location: baseOrder.delivery_location,
              delivery_date: baseOrder.delivery_date,
              vehicle_number: baseOrder.vehicle_number,
              order_type: baseOrder.order_type,
              order_status: baseOrder.order_status,
              dispatch_status: baseOrder.dispatch_status,
              sub_total: baseOrder.sub_total,
              transport_charge: baseOrder.transport_charge,
              labour_charge: baseOrder.labour_charge,
              discount: baseOrder.discount,
              total_amount: baseOrder.total_amount,
              advance_amount: baseOrder.advance_amount,
              amount_paid: newPaid.toStringAsFixed(2),
              remaining_balance: newRem.toStringAsFixed(2),
              payment_mode: selectedPaymentMode,
              order_date: baseOrder.order_date,
              notes: baseOrder.notes,
              created_at: baseOrder.created_at,
              updated_at: baseOrder.updated_at,
              payment_status: newRem <= 0 ? 'Paid' : 'Partial',
              total_pieces: baseOrder.total_pieces,
              amount_in_words: baseOrder.amount_in_words,
              invoice_url: baseOrder.invoice_url,
              items: baseOrder.items,
              primary_item: baseOrder.primary_item,
              payments: paymentHistoryList,
            );
          }
        });

        Provider.of<OrdersListViewModel>(
          context,
          listen: false,
        ).OrdersApi();

        Utils.showSuccessMessage(
          context,
          'Payment Received Successfully!',
        );
      } else {
        Utils.showErrorMessage(
          context,
          paymentViewModel.errorMessage ?? 'Payment Failed',
        );
      }
    }
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
        : (order.invoice_no.isNotEmpty ? order.invoice_no : '${order.id}');

    // Show loading progress dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final tempDir = await getTemporaryDirectory();
      final String filePath = '${tempDir.path}/Invoice_ORD_$orderNum.pdf';
      final File pdfFile = File(filePath);

      final token = await UserViewModel().getToken();
      final dio = Dio();

      await dio.download(
        invoiceUrl,
        filePath,
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
            'Accept': 'application/pdf',
          },
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );

      // Dismiss loading dialog
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      if (await pdfFile.exists() && (await pdfFile.length()) > 0) {
        final xFile = XFile(
          pdfFile.path,
          mimeType: 'application/pdf',
          name: 'Invoice_ORD_$orderNum.pdf',
        );
        await Share.shareXFiles(
          [xFile],
          text: 'Invoice for Order #ORD-$orderNum',
          subject: 'Invoice #ORD-$orderNum',
        );
      } else {
        throw Exception('Downloaded PDF file is empty');
      }
    } catch (e) {
      // Dismiss loading dialog if still visible
      if (mounted) {
        try {
          Navigator.of(context, rootNavigator: true).pop();
        } catch (_) {}
      }

      // Fallback: Share text link if PDF download fails
      try {
        final String message = 'Order Invoice (#ORD-$orderNum):\n$invoiceUrl';
        if (order.client_mobile.trim().isNotEmpty) {
          await CustomLauncher.whatsapp(
            order.client_mobile.trim(),
            message: message,
          );
        } else {
          await Share.share(message);
        }
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
    currentOrder = widget.orderData;

    final order = widget.orderData;
    if (order != null) {
      if (order.payments.isNotEmpty) {
        paymentHistoryList = List.from(order.payments);
      } else {
        double adv = double.tryParse(order.advance_amount.replaceAll(',', '')) ?? 0;
        double paid = double.tryParse(order.amount_paid.replaceAll(',', '')) ?? 0;

        if (adv > 0) {
          paymentHistoryList.add(
            OrderPaymentItem(
              date: _formatDateOnly(order.order_date.isNotEmpty ? order.order_date : order.created_at),
              amount: order.advance_amount,
              mode: order.payment_mode.isNotEmpty ? order.payment_mode : 'Cash',
              notes: 'Advance',
              addedBy: 'Admin',
            ),
          );
        }

        if (paid > 0 && paid != adv) {
          double diff = paid - adv;
          if (diff > 0) {
            paymentHistoryList.add(
              OrderPaymentItem(
                date: _formatDateOnly(order.updated_at.isNotEmpty ? order.updated_at : order.created_at),
                amount: diff.toStringAsFixed(2),
                mode: order.payment_mode.isNotEmpty ? order.payment_mode : 'Cash',
                notes: 'Installment',
                addedBy: 'Admin',
              ),
            );
          }
        }
      }
    }

    if (widget.orderData != null && widget.orderData!.order_status.isNotEmpty) {
      final s = widget.orderData!.order_status.trim();

      isOrderCompleted =
          s.toLowerCase() == 'completed' ||
              s.toLowerCase() == 'dispatched';

      String formattedStatus = s.isEmpty
          ? 'Pending'
          : '${s[0].toUpperCase()}${s.substring(1).toLowerCase()}';

      if (formattedStatus == 'Dispatched') {
        formattedStatus = 'Completed';
      }

      if (['Pending', 'Completed']
          .contains(formattedStatus)) {
        selectedStatus = formattedStatus;
      } else {
        selectedStatus = 'Pending';
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

    final order = currentOrder ?? widget.orderData;

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
                              final String itemImage = item.image_url.isNotEmpty
                                  ? item.image_url
                                  : (order.primary_item?.image_url ?? '');
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
                                          child: _buildProductImage(itemImage),
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
                                        child: _buildProductImage(
                                          order?.primary_item?.image_url ?? '',
                                        ),
                                      ),
                                      SizedBox(width: Sizes.screenWidth * 0.013),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              order?.primary_item?.product_name.isNotEmpty == true
                                                  ? order!.primary_item!.product_name
                                                  : 'Red Bricks\n(Standard)',
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black,
                                              ),
                                            ),
                                            Text(
                                              'Code: ${order?.primary_item?.product_sku.isNotEmpty == true ? order!.primary_item!.product_sku : 'RB-001'}',
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
                                _productCell(order?.primary_item?.dimensions.isNotEmpty == true ? order!.primary_item!.dimensions : '230 × 110 ×\n70 mm'),
                                _productCell(order?.primary_item?.colour.isNotEmpty == true ? order!.primary_item!.colour : 'Red'),
                                _productCell(order?.primary_item?.quantity.isNotEmpty == true ? '${order!.primary_item!.quantity} pcs' : '3,000\npcs'),
                                _productCell(order?.primary_item?.rate.isNotEmpty == true ? order!.primary_item!.rate : '5.00'),
                                _productCell(order?.primary_item?.amount.isNotEmpty == true ? order!.primary_item!.amount : '15,000.00'),
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.grey,
                ),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPaymentExpanded = !isPaymentExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          'Payment History',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.stockAmountColor,
                          ),
                        ),

                        Icon(
                          isPaymentExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Color(0xFF782A17),
                          size: 22,
                        ),
                      ],
                    ),
                  ),

                  if (isPaymentExpanded) ...[

                    SizedBox(height: 10),

                    LayoutBuilder(
                      builder: (context, constraints) {

                        double width = constraints.maxWidth;

                        return Column(
                          children: [
                            Container(
                              color: Color(0xFFF7F7F7),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.25,
                                    child: Padding(
                                      padding:  EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Date',
                                        style: GoogleFonts.poppins(fontSize: 9),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: width * 0.18,
                                    child: Text(
                                      'Amount',
                                      style: GoogleFonts.poppins(fontSize: 9),
                                    ),
                                  ),

                                  SizedBox(
                                    width: width * 0.14,
                                    child: Text(
                                      'Mode',
                                      style: GoogleFonts.poppins(fontSize: 9),
                                    ),
                                  ),

                                  SizedBox(
                                    width: width * 0.20,
                                    child: Text(
                                      'Notes',
                                      style: GoogleFonts.poppins(fontSize: 9),
                                    ),
                                  ),

                                  SizedBox(
                                    width: width * 0.23,
                                    child: Text(
                                      'Added By',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(fontSize: 9),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Divider(height: 1),
                            if (paymentHistoryList.isEmpty)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Center(
                                  child: Text(
                                    'No payment history available',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: AppColor.gey,
                                    ),
                                  ),
                                ),
                              )
                            else
                              ...paymentHistoryList.asMap().entries.map((entry) {
                                final item = entry.value;
                                final bool isLast = entry.key == paymentHistoryList.length - 1;
                                String displayDate = item.date;
                                if (displayDate.contains('T') || displayDate.contains('-')) {
                                  displayDate = _formatDateOnly(displayDate);
                                }
                                if (displayDate.isEmpty) displayDate = '-';

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.25,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Text(
                                                displayDate,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(fontSize: 9),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.18,
                                            child: Text(
                                              '₹ ${item.amount}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.14,
                                            child: Text(
                                              item.mode.isNotEmpty ? item.mode : 'Cash',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: 9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.20,
                                            child: Text(
                                              item.notes.isNotEmpty ? item.notes : '-',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: 9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.23,
                                            child: Text(
                                              item.addedBy.isNotEmpty ? item.addedBy : 'Admin',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: 9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (!isLast) const Divider(height: 1),
                                  ],
                                );
                              }).toList(),
                          ],
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
            if (!isOrderCompleted) ...[
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF8F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFF1E5DF),
                    ),
                  ),

                  child: Column(
                    children: [

                      // Heading Row
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFFFCEBE5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.receipt_long,
                              color: Color(0xFF782A17),
                              size: 20,
                            ),
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              'Order Payment',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF782A17),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      // Payment Amount and Payment Mode
                      Row(
                        children: [

                          // Payment Amount TextField
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  'Payment Amount',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF782A17),
                                  ),
                                ),
                                SizedBox(height: 5),
                                AppTextField(
                                  controller: amountPaidController,
                                  hintText: 'Enter Amount',
                                  keyboardType: TextInputType.number,
                                  hintFontSize: 13,
                                  height: Sizes.screenHeight * 0.045,
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
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF782A17),
                                  ),
                                ),

                                SizedBox(height: 5),

                                Container(
                                  height: Sizes.screenHeight * 0.043,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Color(0xFFE5B66F),
                                    ),
                                  ),

                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: selectedPaymentMode,

                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 18,
                                        color: Color(0xFF782A17),
                                      ),

                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.black87,
                                      ),
                                      items: [
                                        'Cash',
                                        'Online',
                                      ].map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList(),

                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedPaymentMode = value;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      // Payment Received Button
                      CustomButton(
                        text: 'Payment Received',
                        height: Sizes.screenHeight * 0.043,
                        fontWeight: FontWeight.w500,
                        isLoading: Provider.of<ReceivePaymentViewModel>(context).loading,
                        onPressed: () async {
                          await receivePaymentApi();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],

            SizedBox(height: Sizes.screenHeight * 0.005),
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
                          isOrderCompleted ? 'Payment Status' : 'Update Order Status',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColor.stockTitleColor,
                          ),
                        ),
                      ),
                      if (!isOrderCompleted)
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
                              'Completed',
                            ].map((status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Row(
                                  children: [
                                    Icon(
                                      status == 'Pending'
                                          ? Icons.access_time
                                          : Icons.check_circle,
                                      color: status == 'Pending'
                                          ? AppColor.yellow
                                          : Colors.green,
                                      size: 17,
                                    ),
                                    SizedBox(width: Sizes.screenWidth * 0.019),
                                    Text(
                                      status,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: status == 'Pending'
                                            ? AppColor.yellow
                                            : Colors.green,
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
                  if (isOrderCompleted) ...[
                    SizedBox(height: Sizes.screenHeight * 0.008),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amount Paid',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.gey,
                                ),
                              ),
                              SizedBox(height: Sizes.screenHeight * 0.008),
                              AppTextField(
                                controller: amountPaidController,
                                hintText: 'Enter Amount',
                                keyboardType: TextInputType.number,
                                hintFontSize: 13,
                                height: Sizes.screenHeight * 0.045,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Sizes.screenWidth * 0.025),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment Mode',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.gey,
                                ),
                              ),
                              SizedBox(height: Sizes.screenHeight * 0.005),
                              Container(
                                height: Sizes.screenHeight * 0.043,
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.screenWidth * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedPaymentMode,
                                    items: ['Cash', 'Online'].map((mode) {
                                      return DropdownMenuItem(
                                        value: mode,
                                        child: Text(
                                          mode,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: AppColor.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          selectedPaymentMode = value;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: Sizes.screenHeight * 0.008),
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

                      Expanded(
                        child: CustomButton(
                          text: isOrderCompleted
                              ? 'Payment Received'
                              : 'Update Status',

                          height: Sizes.screenHeight * 0.049,
                          fontWeight: FontWeight.w500,

                          isLoading: Provider.of<UpdateOrderViewModel>(context).loading,

                          onPressed: () async {
                            if (order == null) return;

                            if (isOrderCompleted) {
                              await receivePaymentApi();
                            } else {

                              Map<String, dynamic> data = {
                                "order_status": selectedStatus,
                                "dispatch_status": "Completed on 06 Nov",
                                "vehicle_number": selectedVehicle?.vehicle_number ?? '',
                                "payment_option": 2,
                                "amount_paid": int.tryParse(order.amount_paid) ?? 0,
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
                                  setState(() {
                                    if (selectedStatus.toLowerCase() == 'completed') {
                                      isOrderCompleted = true;
                                    }
                                  });

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
                            }
                          },
                        ),
                      ),
                      SizedBox(width: Sizes.screenWidth * 0.020),
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

  Widget _buildProductImage(String imageUrl) {
    final String image = imageUrl.trim();
    if (image.startsWith('http://') || image.startsWith('https://')) {
      return Image.network(
        image,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/bricks.jpg',
            fit: BoxFit.contain,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              height: Sizes.screenHeight * 0.02,
              width: Sizes.screenWidth * 0.04,
              child:  CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColor.stockAmountColor,
              ),
            ),
          );
        },
      );
    } else if (image.isNotEmpty) {
      return Image.asset(
        image,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/bricks.jpg',
            fit: BoxFit.contain,
          );
        },
      );
    }
    return Image.asset(
      'assets/bricks.jpg',
      fit: BoxFit.contain,
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
