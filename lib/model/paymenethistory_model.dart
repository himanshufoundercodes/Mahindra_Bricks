class PaymentHistoryModel {
  dynamic count;
  List<Data>? data;

  PaymentHistoryModel({this.count, this.data});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic labourId;
  dynamic amount;
  dynamic paymentDate;
  dynamic paymentMode;
  dynamic paymentType;
  dynamic notes;
  dynamic addedBy;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.id,
        this.labourId,
        this.amount,
        this.paymentDate,
        this.paymentMode,
        this.paymentType,
        this.notes,
        this.addedBy,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labourId = json['labour_id'];
    amount = json['amount'];
    paymentDate = json['payment_date'];
    paymentMode = json['payment_mode'];
    paymentType = json['payment_type'];
    notes = json['notes'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['labour_id'] = labourId;
    data['amount'] = amount;
    data['payment_date'] = paymentDate;
    data['payment_mode'] = paymentMode;
    data['payment_type'] = paymentType;
    data['notes'] = notes;
    data['added_by'] = addedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}