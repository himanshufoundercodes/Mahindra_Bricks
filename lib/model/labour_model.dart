class LabourListModel {
  dynamic id;
  dynamic labour_code;
  dynamic name;
  dynamic mobile;
  dynamic alternate_mobile;
  dynamic daily_rate;
  dynamic trade;
  dynamic profile_image;
  dynamic status;
  dynamic total_earned;
  dynamic total_paid;
  dynamic remaining_balance;
  dynamic notes;
  dynamic created_at;
  dynamic updated_at;
  dynamic call_url;

  LabourListModel({
    this.id,
    this.labour_code,
    this.name,
    this.mobile,
    this.alternate_mobile,
    this.daily_rate,
    this.trade,
    this.profile_image,
    this.status,
    this.total_earned,
    this.total_paid,
    this.remaining_balance,
    this.notes,
    this.created_at,
    this.updated_at,
    this.call_url,
  });

  LabourListModel.fromJson(Map<String, dynamic> json) {
    print("Labour Data: $json");

    id = json['id'];
    labour_code = json['labour_code'];
    name = json['name'];
    mobile = json['mobile'];
    alternate_mobile = json['alternate_mobile'];
    daily_rate = json['daily_rate'];
    trade = json['trade'];
    profile_image = json['profile_image'];
    status = json['status'];
    total_earned = json['total_earned'];
    total_paid = json['total_paid'];
    remaining_balance = json['remaining_balance'];
    notes = json['notes'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    call_url = json['call_url'];
  }
}