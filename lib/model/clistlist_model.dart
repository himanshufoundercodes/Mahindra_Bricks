
class ClientListModel {
  dynamic id;
  dynamic client_code;
  dynamic company_name;
  dynamic contact_person;
  dynamic mobile;
  dynamic alternate_mobile;
  dynamic address;
  dynamic city;
  dynamic profile_image;
  dynamic total_orders;
  dynamic total_purchase_qty;
  dynamic total_order_amount;
  dynamic total_paid_amount;
  dynamic pending_balance;
  dynamic status;
  dynamic created_at;
  dynamic updated_at;
  dynamic client_status_badge;
  dynamic call_url;
  dynamic whatsapp_url;

  ClientListModel({
    this.id,
    this.client_code,
    this.company_name,
    this.contact_person,
    this.mobile,
    this.alternate_mobile,
    this.address,
    this.city,
    this.profile_image,
    this.total_orders,
    this.total_purchase_qty,
    this.total_order_amount,
    this.total_paid_amount,
    this.pending_balance,
    this.status,
    this.created_at,
    this.updated_at,
    this.client_status_badge,
    this.call_url,
    this.whatsapp_url,
  });

  ClientListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client_code = json['client_code'];
    company_name = json['company_name'];
    contact_person = json['contact_person'];
    mobile = json['mobile'];
    alternate_mobile = json['alternate_mobile'];
    address = json['address'];
    city = json['city'];
    profile_image = json['profile_image'];
    total_orders = json['total_orders'];
    total_purchase_qty = json['total_purchase_qty'];
    total_order_amount = json['total_order_amount'];
    total_paid_amount = json['total_paid_amount'];
    pending_balance = json['pending_balance'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    client_status_badge = json['client_status_badge'];
    call_url = json['call_url'];
    whatsapp_url = json['whatsapp_url'];
  }
}