class AddClientModel {
  final int id;
  final String client_code;
  final String company_name;
  final String contact_person;
  final String mobile;
  final String alternate_mobile;
  final String address;
  final String city;
  final String profile_image;
  final String total_orders;
  final String total_purchase_qty;
  final String total_order_amount;
  final String total_paid_amount;
  final String pending_balance;
  final String status;
  final String created_at;
  final String updated_at;
  final String client_status_badge;
  final String call_url;
  final String whatsapp_url;

  AddClientModel({
    required this.id,
    required this.client_code,
    required this.company_name,
    required this.contact_person,
    required this.mobile,
    required this.alternate_mobile,
    required this.address,
    required this.city,
    required this.profile_image,
    required this.total_orders,
    required this.total_purchase_qty,
    required this.total_order_amount,
    required this.total_paid_amount,
    required this.pending_balance,
    required this.status,
    required this.created_at,
    required this.updated_at,
    required this.client_status_badge,
    required this.call_url,
    required this.whatsapp_url,
  });

  factory AddClientModel.fromJson(Map<String, dynamic> json) {
    return AddClientModel(
      id: json['id'] ?? 0,
      client_code: json['client_code'] ?? '',
      company_name: json['company_name'] ?? '',
      contact_person: json['contact_person'] ?? '',
      mobile: json['mobile'] ?? '',
      alternate_mobile: json['alternate_mobile'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      profile_image: json['profile_image'] ?? '',
      total_orders: json['total_orders'] ?? '',
      total_purchase_qty: json['total_purchase_qty'] ?? '',
      total_order_amount: json['total_order_amount'] ?? '',
      total_paid_amount: json['total_paid_amount'] ?? '',
      pending_balance: json['pending_balance'] ?? '',
      status: json['status'] ?? '',
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
      client_status_badge: json['client_status_badge'] ?? '',
      call_url: json['call_url'] ?? '',
      whatsapp_url: json['whatsapp_url'] ?? '',
    );
  }
}
