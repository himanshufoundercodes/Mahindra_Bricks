//
// class ClientListModel {
//   dynamic id;
//   dynamic client_code;
//   dynamic company_name;
//   dynamic contact_person;
//   dynamic mobile;
//   dynamic alternate_mobile;
//   dynamic address;
//   dynamic city;
//   dynamic profile_image;
//   dynamic total_orders;
//   dynamic total_purchase_qty;
//   dynamic total_order_amount;
//   dynamic total_paid_amount;
//   dynamic pending_balance;
//   dynamic status;
//   dynamic created_at;
//   dynamic updated_at;
//   dynamic client_status_badge;
//   dynamic call_url;
//   dynamic whatsapp_url;
//
//   ClientListModel({
//     this.id,
//     this.client_code,
//     this.company_name,
//     this.contact_person,
//     this.mobile,
//     this.alternate_mobile,
//     this.address,
//     this.city,
//     this.profile_image,
//     this.total_orders,
//     this.total_purchase_qty,
//     this.total_order_amount,
//     this.total_paid_amount,
//     this.pending_balance,
//     this.status,
//     this.created_at,
//     this.updated_at,
//     this.client_status_badge,
//     this.call_url,
//     this.whatsapp_url,
//   });
//
//   ClientListModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     client_code = json['client_code'];
//     company_name = json['company_name'];
//     contact_person = json['contact_person'];
//     mobile = json['mobile'];
//     alternate_mobile = json['alternate_mobile'];
//     address = json['address'];
//     city = json['city'];
//     profile_image = json['profile_image'];
//     total_orders = json['total_orders'];
//     total_purchase_qty = json['total_purchase_qty'];
//     total_order_amount = json['total_order_amount'];
//     total_paid_amount = json['total_paid_amount'];
//     pending_balance = json['pending_balance'];
//     status = json['status'];
//     created_at = json['created_at'];
//     updated_at = json['updated_at'];
//     client_status_badge = json['client_status_badge'];
//     call_url = json['call_url'];
//     whatsapp_url = json['whatsapp_url'];
//   }
// }

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is num) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? double.tryParse(value)?.toInt();
  }
  return null;
}

class ClientListModel {
  int? count;
  List<Data>? data;

  ClientListModel({this.count, this.data});

  ClientListModel.fromJson(Map<String, dynamic> json) {
    count = _toInt(json['count']);
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic clientCode;
  dynamic companyName;
  dynamic contactPerson;
  dynamic mobile;
  dynamic alternateMobile;
  dynamic address;
  dynamic totalOrders;
  dynamic totalPurchaseQty;
  dynamic totalOrderAmount;
  dynamic totalPaidAmount;
  dynamic pendingBalance;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic profileImage;
  dynamic clientStatusBadge;
  dynamic clientStatus;
  BusinessSummary? businessSummary;
  List<OrderHistory>? orderHistory;

  Data(
      {this.id,
        this.clientCode,
        this.companyName,
        this.contactPerson,
        this.mobile,
        this.alternateMobile,
        this.address,
        this.totalOrders,
        this.totalPurchaseQty,
        this.totalOrderAmount,
        this.totalPaidAmount,
        this.pendingBalance,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.profileImage,
        this.clientStatusBadge,
        this.clientStatus,
        this.businessSummary,
        this.orderHistory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientCode = json['client_code'];
    companyName = json['company_name'];
    contactPerson = json['contact_person'];
    mobile = json['mobile'];
    alternateMobile = json['alternate_mobile'];
    address = json['address'];
    totalOrders = json['total_orders'];
    totalPurchaseQty = json['total_purchase_qty'];
    totalOrderAmount = json['total_order_amount'];
    totalPaidAmount = json['total_paid_amount'];
    pendingBalance = json['pending_balance'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    clientStatusBadge = json['client_status_badge'];
    clientStatus = json['client_status'];
    businessSummary = json['business_summary'] != null
        ? BusinessSummary.fromJson(json['business_summary'])
        : null;
    if (json['order_history'] != null) {
      orderHistory = <OrderHistory>[];
      json['order_history'].forEach((v) {
        orderHistory!.add(OrderHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_code'] = clientCode;
    data['company_name'] = companyName;
    data['contact_person'] = contactPerson;
    data['mobile'] = mobile;
    data['alternate_mobile'] = alternateMobile;
    data['address'] = address;
    data['total_orders'] = totalOrders;
    data['total_purchase_qty'] = totalPurchaseQty;
    data['total_order_amount'] = totalOrderAmount;
    data['total_paid_amount'] = totalPaidAmount;
    data['pending_balance'] = pendingBalance;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image'] = profileImage;
    data['client_status_badge'] = clientStatusBadge;
    data['client_status'] = clientStatus;
    if (businessSummary != null) {
      data['business_summary'] = businessSummary!.toJson();
    }
    if (orderHistory != null) {
      data['order_history'] =
          orderHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusinessSummary {
  dynamic totalOrders;
  dynamic totalPurchaseQty;
  dynamic totalOrderAmount;
  dynamic totalPaidAmount;
  dynamic pendingBalance;

  BusinessSummary(
      {this.totalOrders,
        this.totalPurchaseQty,
        this.totalOrderAmount,
        this.totalPaidAmount,
        this.pendingBalance});

  BusinessSummary.fromJson(Map<String, dynamic> json) {
    totalOrders = json['total_orders'];
    totalPurchaseQty = json['total_purchase_qty'];
    totalOrderAmount = json['total_order_amount'];
    totalPaidAmount = json['total_paid_amount'];
    pendingBalance = json['pending_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_orders'] = totalOrders;
    data['total_purchase_qty'] = totalPurchaseQty;
    data['total_order_amount'] = totalOrderAmount;
    data['total_paid_amount'] = totalPaidAmount;
    data['pending_balance'] = pendingBalance;
    return data;
  }
}

class OrderHistory {
  dynamic id;
  dynamic orderNumber;
  dynamic invoiceNo;
  dynamic clientId;
  dynamic clientName;
  dynamic clientMobile;
  dynamic deliveryAddress;
  dynamic deliveryDate;
  dynamic vehicleNumber;
  dynamic orderType;
  dynamic orderStatus;
  dynamic dispatchStatus;
  dynamic subTotal;
  dynamic transportCharge;
  dynamic labourCharge;
  dynamic discount;
  dynamic totalAmount;
  dynamic advanceAmount;
  dynamic amountPaid;
  dynamic remainingBalance;
  dynamic paymentMode;
  dynamic orderDate;
  dynamic createdAt;
  dynamic updatedAt;
  List<Items>? items;

  OrderHistory(
      {this.id,
        this.orderNumber,
        this.invoiceNo,
        this.clientId,
        this.clientName,
        this.clientMobile,
        this.deliveryAddress,
        this.deliveryDate,
        this.vehicleNumber,
        this.orderType,
        this.orderStatus,
        this.dispatchStatus,
        this.subTotal,
        this.transportCharge,
        this.labourCharge,
        this.discount,
        this.totalAmount,
        this.advanceAmount,
        this.amountPaid,
        this.remainingBalance,
        this.paymentMode,
        this.orderDate,
        this.createdAt,
        this.updatedAt,
        this.items});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    invoiceNo = json['invoice_no'];
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientMobile = json['client_mobile'];
    deliveryAddress = json['delivery_address'];
    deliveryDate = json['delivery_date'];
    vehicleNumber = json['vehicle_number'];
    orderType = json['order_type'];
    orderStatus = json['order_status'];
    dispatchStatus = json['dispatch_status'];
    subTotal = json['sub_total'];
    transportCharge = json['transport_charge'];
    labourCharge = json['labour_charge'];
    discount = json['discount'];
    totalAmount = json['total_amount'];
    advanceAmount = json['advance_amount'];
    amountPaid = json['amount_paid'];
    remainingBalance = json['remaining_balance'];
    paymentMode = json['payment_mode'];
    orderDate = json['order_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['invoice_no'] = invoiceNo;
    data['client_id'] = clientId;
    data['client_name'] = clientName;
    data['client_mobile'] = clientMobile;
    data['delivery_address'] = deliveryAddress;
    data['delivery_date'] = deliveryDate;
    data['vehicle_number'] = vehicleNumber;
    data['order_type'] = orderType;
    data['order_status'] = orderStatus;
    data['dispatch_status'] = dispatchStatus;
    data['sub_total'] = subTotal;
    data['transport_charge'] = transportCharge;
    data['labour_charge'] = labourCharge;
    data['discount'] = discount;
    data['total_amount'] = totalAmount;
    data['advance_amount'] = advanceAmount;
    data['amount_paid'] = amountPaid;
    data['remaining_balance'] = remainingBalance;
    data['payment_mode'] = paymentMode;
    data['order_date'] = orderDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  dynamic id;
  dynamic orderId;
  dynamic productId;
  dynamic productName;
  dynamic productImage;
  dynamic productSku;
  dynamic dimensions;
  dynamic colour;
  dynamic quantity;
  dynamic rate;
  dynamic amount;
  dynamic createdAt;
  dynamic updatedAt;

  Items(
      {this.id,
        this.orderId,
        this.productId,
        this.productName,
        this.productImage,
        this.productSku,
        this.dimensions,
        this.colour,
        this.quantity,
        this.rate,
        this.amount,
        this.createdAt,
        this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productSku = json['product_sku'];
    dimensions = json['dimensions'];
    colour = json['colour'];
    quantity = json['quantity'];
    rate = json['rate'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['product_sku'] = productSku;
    data['dimensions'] = dimensions;
    data['colour'] = colour;
    data['quantity'] = quantity;
    data['rate'] = rate;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
