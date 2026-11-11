class AddlabourModel {
  final dynamic id;
  final dynamic labour_code;
  final dynamic name;
  final dynamic mobile;
  final dynamic alternate_mobile;
  final dynamic daily_rate;
  final dynamic trade;
  final dynamic profile_image;
  final dynamic status;
  final dynamic total_earned;
  final dynamic total_paid;
  final dynamic remaining_balance;
  final dynamic notes;
  final dynamic created_at;
  final dynamic updated_at;
  final dynamic call_url;

  AddlabourModel({
    required this.id,
    this.labour_code,
    required this.name,
    required this.mobile,
    this.alternate_mobile,
    required this.daily_rate,
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

  factory AddlabourModel.fromJson(Map<String, dynamic> json) {
    return AddlabourModel(
        id: json['id'] ?? 0,
        labour_code: json['labour_code'] ?? '',
        name: json['name'] ?? '',
        mobile: json['mobile'] ?? '',
        alternate_mobile:  json['alternate_mobile']??'',
        daily_rate: json['daily_rate'] ?? '',
        trade: json['trade'] ?? '',
        profile_image: json['profile_image'] ?? '',
        status:  json['status']??'',
        total_earned: json['total_earned'] ?? '',
        total_paid: json['total_paid'] ?? '',
        remaining_balance: json['remaining_balance'] ?? '',
        notes:  json['notes']??'',
        created_at: json['created_at'] ?? '',
        updated_at: json['updated_at'] ?? '',
        call_url: json['call_url'] ?? '',
    );
  }
}
