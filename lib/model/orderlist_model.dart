
class OrderdsListModel {
  final int count;
  final List<OrderdsDataModel> data;

  OrderdsListModel({
    required this.count,
    required this.data,
  });

  factory OrderdsListModel.fromJson(Map<String, dynamic> json) {
    return OrderdsListModel(
      count: json['count'] is int ? json['count'] : int.tryParse(json['count']?.toString() ?? '0') ?? 0,
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
    required this.items,
    this.primary_item,
  });

  factory OrderdsDataModel.fromJson(Map<String, dynamic> json) {
    return OrderdsDataModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      order_number: json['order_number']?.toString() ?? '',
      invoice_no: json['invoice_no']?.toString() ?? '',
      client_id: json['client_id']?.toString() ?? '',
      client_name: json['client_name']?.toString() ?? '',
      client_mobile: json['client_mobile']?.toString() ?? '',
      delivery_address: json['delivery_address']?.toString() ?? '',
      delivery_location: json['delivery_location']?.toString() ?? '',
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
      items: (json['items'] as List? ?? [])
          .map((e) => OrderItemsModel.fromJson(e))
          .toList(),
      primary_item: json['primary_item'] != null
          ? OrderItemsModel.fromJson(json['primary_item'])
          : null,
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
  });

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
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
    );
  }
}
