import 'package:mahindra_bricks/core/constant/api_constant.dart';

int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is num) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? double.tryParse(value)?.toInt() ?? 0;
  }
  return 0;
}

String _getFullImageUrl(String image) {
  if (image.isEmpty || image.toLowerCase() == 'null') {
    return '';
  }

  if (image.startsWith('http')) {
    return image;
  }

  final baseUri = Uri.parse(ApiConstants.baseUrl);
  final rootUri = baseUri.resolve('/');

  return rootUri.resolve(image).toString();
}

class OrderdsListModel {
  final int count;
  final List<OrderdsDataModel> data;

  OrderdsListModel({
    required this.count,
    required this.data,
  });

  factory OrderdsListModel.fromJson(Map<String, dynamic> json) {
    return OrderdsListModel(
      count: _toInt(json['count']),
      data: (json['data'] as List? ?? [])
          .map((e) => OrderdsDataModel.fromJson(e))
          .toList(),
    );
  }
}

class OrderdsDataModel {
  final int id;
  final String order_number;
  final String invoice_no;
  final String client_id;
  final String client_name;
  final String client_mobile;
  final String delivery_address;
  final String delivery_location;
  final String delivery_date;
  final String vehicle_number;
  final String order_type;
  final String order_status;
  final String dispatch_status;
  final String sub_total;
  final String transport_charge;
  final String labour_charge;
  final String discount;
  final String total_amount;
  final String advance_amount;
  final String amount_paid;
  final String remaining_balance;
  final String payment_mode;
  final String order_date;
  final String notes;
  final String created_at;
  final String updated_at;
  final String payment_status;
  final String total_pieces;
  final String amount_in_words;
  final String invoice_url;
  final List<OrderItemsModel> items;
  final OrderItemsModel? primary_item;

  OrderdsDataModel({
    required this.id,
    required this.order_number,
    required this.invoice_no,
    required this.client_id,
    required this.client_name,
    required this.client_mobile,
    required this.delivery_address,
    required this.delivery_location,
    required this.delivery_date,
    required this.vehicle_number,
    required this.order_type,
    required this.order_status,
    required this.dispatch_status,
    required this.sub_total,
    required this.transport_charge,
    required this.labour_charge,
    required this.discount,
    required this.total_amount,
    required this.advance_amount,
    required this.amount_paid,
    required this.remaining_balance,
    required this.payment_mode,
    required this.order_date,
    required this.notes,
    required this.created_at,
    required this.updated_at,
    required this.payment_status,
    required this.total_pieces,
    required this.amount_in_words,
    required this.invoice_url,
    required this.items,
    this.primary_item,
  });

  factory OrderdsDataModel.fromJson(Map<String, dynamic> json) {
    String extractKey(List<String> keys) {
      for (String k in keys) {
        if (json[k] != null) {
          String s = json[k].toString().trim();
          if (s.isNotEmpty && s.toLowerCase() != 'null') return s;
        }
      }
      if (json['client'] is Map) {
        Map c = json['client'] as Map;
        for (String k in keys) {
          if (c[k] != null) {
            String s = c[k].toString().trim();
            if (s.isNotEmpty && s.toLowerCase() != 'null') return s;
          }
        }
      }
      return '';
    }

    // Client Address (Client Details Card): Prioritize client_address -> address -> delivery_address
    String addressVal = extractKey([
      'client_address',
      'address',
      'delivery_address',
      'client_location',
    ]);

    // Delivery Location (Delivery Details Card): Prioritize delivery_location -> location -> site_location -> delivery_address
    String locationVal = extractKey([
      'delivery_location',
      'location',
      'site_location',
      'delivery_address',
    ]);

    // Fallbacks if one is missing
    if (addressVal.isEmpty) {
      addressVal = locationVal;
    }
    if (locationVal.isEmpty) {
      locationVal = addressVal;
    }

    return OrderdsDataModel(
      id: _toInt(json['id']),
      order_number: json['order_number']?.toString() ?? '',
      invoice_no: json['invoice_no']?.toString() ?? '',
      client_id: json['client_id']?.toString() ?? '',
      client_name: json['client_name']?.toString() ?? '',
      client_mobile: json['client_mobile']?.toString() ?? '',
      delivery_address: addressVal,
      delivery_location: locationVal,
      delivery_date: json['delivery_date']?.toString() ?? '',
      vehicle_number: json['vehicle_number']?.toString() ?? '',
      order_type: json['order_type']?.toString() ?? '',
      order_status: json['order_status']?.toString() ?? '',
      dispatch_status: json['dispatch_status']?.toString() ?? '',
      sub_total: json['sub_total']?.toString() ?? '',
      transport_charge: json['transport_charge']?.toString() ?? '',
      labour_charge: json['labour_charge']?.toString() ?? '',
      discount: json['discount']?.toString() ?? '',
      total_amount: json['total_amount']?.toString() ?? '',
      advance_amount: json['advance_amount']?.toString() ?? '',
      amount_paid: json['amount_paid']?.toString() ?? '',
      remaining_balance: json['remaining_balance']?.toString() ?? '',
      payment_mode: json['payment_mode']?.toString() ?? '',
      order_date: json['order_date']?.toString() ?? '',
      notes: json['notes']?.toString() ?? '',
      created_at: json['created_at']?.toString() ?? '',
      updated_at: json['updated_at']?.toString() ?? '',
      payment_status: json['payment_status']?.toString() ?? '',
      total_pieces: json['total_pieces']?.toString() ?? '',
      amount_in_words: json['amount_in_words']?.toString() ?? '',
      invoice_url: () {
        List<String> keys = [
          'invoice_url',
          'invoice_pdf',
          'invoice_file',
          'invoice_link',
          'pdf_url',
          'download_url',
          'invoice_path',
        ];
        for (String k in keys) {
          if (json[k] != null && json[k].toString().trim().isNotEmpty) {
            String val = json[k].toString().trim();
            if (val.toLowerCase() != 'null') return val;
          }
        }
        if (json['invoice'] != null && json['invoice'] is String) {
          String val = json['invoice'].toString().trim();
          if (val.startsWith('http')) return val;
        }
        final int orderId = _toInt(json['id']);
        if (orderId > 0) {
          return '${ApiConstants.baseUrl}orders/$orderId/invoice';
        }
        return '';
      }(),
      items: (json['items'] as List? ?? [])
          .map((e) => OrderItemsModel.fromJson(e))
          .toList(),
      primary_item: json['primary_item'] != null
          ? OrderItemsModel.fromJson(json['primary_item'])
          : ((json['items'] as List? ?? []).isNotEmpty
              ? OrderItemsModel.fromJson(json['items'][0])
              : null),
    );
  }
}

class OrderItemsModel {
  final int id;
  final String order_id;
  final String product_id;
  final String product_name;
  final String product_sku;
  final String dimensions;
  final String colour;
  final String quantity;
  final String rate;
  final String amount;
  final String created_at;
  final String updated_at;
  final String image_url;

  OrderItemsModel({
    required this.id,
    required this.order_id,
    required this.product_id,
    required this.product_name,
    required this.product_sku,
    required this.dimensions,
    required this.colour,
    required this.quantity,
    required this.rate,
    required this.amount,
    required this.created_at,
    required this.updated_at,
    required this.image_url,
  });

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      id: _toInt(json['id']),
      order_id: json['order_id']?.toString() ?? '',
      product_id: json['product_id']?.toString() ?? '',
      product_name: json['product_name']?.toString() ?? '',
      product_sku: json['product_sku']?.toString() ?? '',
      dimensions: json['dimensions']?.toString() ?? '',
      colour: json['colour']?.toString() ?? '',
      quantity: json['quantity']?.toString() ?? '',
      rate: json['rate']?.toString() ?? '',
      amount: json['amount']?.toString() ?? '',
      created_at: json['created_at']?.toString() ?? '',
      updated_at: json['updated_at']?.toString() ?? '',
      image_url: _getFullImageUrl(
        json['image_url']?.toString() ??
            json['product_image']?.toString() ??
            json['image']?.toString() ??
            (json['product'] is Map
                ? (json['product']['image_url']?.toString() ??
                    json['product']['product_image']?.toString() ??
                    json['product']['image']?.toString())
                : null) ??
            '',
      ),
    );
  }
}
