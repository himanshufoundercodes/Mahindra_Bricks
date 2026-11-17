class orderDetailsModel {
  dynamic count;
  List<Data>? data;

  orderDetailsModel({this.count, this.data});

  orderDetailsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  dynamic productImage;
  dynamic paymentOption;
  dynamic paymentOptionName;
  dynamic paymentStatus;
  dynamic totalPieces;
  dynamic amountInWords;
  List<Items>? items;
  dynamic primaryItem;

  Data(
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
        this.productImage,
        this.paymentOption,
        this.paymentOptionName,
        this.paymentStatus,
        this.totalPieces,
        this.amountInWords,
        this.items,
        this.primaryItem});

  Data.fromJson(Map<String, dynamic> json) {
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
    productImage = json['product_image'];
    paymentOption = json['payment_option'];
    paymentOptionName = json['payment_option_name'];
    paymentStatus = json['payment_status'];
    totalPieces = json['total_pieces'];
    amountInWords = json['amount_in_words'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    primaryItem = json['primary_item'] != null
        ? new Items.fromJson(json['primary_item'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['invoice_no'] = this.invoiceNo;
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_mobile'] = this.clientMobile;
    data['delivery_address'] = this.deliveryAddress;
    data['delivery_date'] = this.deliveryDate;
    data['vehicle_number'] = this.vehicleNumber;
    data['order_type'] = this.orderType;
    data['order_status'] = this.orderStatus;
    data['dispatch_status'] = this.dispatchStatus;
    data['sub_total'] = this.subTotal;
    data['transport_charge'] = this.transportCharge;
    data['labour_charge'] = this.labourCharge;
    data['discount'] = this.discount;
    data['total_amount'] = this.totalAmount;
    data['advance_amount'] = this.advanceAmount;
    data['amount_paid'] = this.amountPaid;
    data['remaining_balance'] = this.remainingBalance;
    data['payment_mode'] = this.paymentMode;
    data['order_date'] = this.orderDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_image'] = this.productImage;
    data['payment_option'] = this.paymentOption;
    data['payment_option_name'] = this.paymentOptionName;
    data['payment_status'] = this.paymentStatus;
    data['total_pieces'] = this.totalPieces;
    data['amount_in_words'] = this.amountInWords;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.primaryItem != null) {
      data['primary_item'] = this.primaryItem!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_sku'] = this.productSku;
    data['dimensions'] = this.dimensions;
    data['colour'] = this.colour;
    data['quantity'] = this.quantity;
    data['rate'] = this.rate;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}