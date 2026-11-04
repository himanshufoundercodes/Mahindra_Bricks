class AddCementModel{
  final int id;
  final String activity_date;
  final String activity_time;
  final String activity_type;
  final String bags;
  final String supplier_name;
  final String purpose;
  final String cost_per_bag;
  final String total_cost;
  final String notes;
  final String created_at;
  final String updated_at;

  AddCementModel({
    required this.id,
    required this.activity_date,
    required this.activity_time,
    required this.activity_type,
    required this.bags,
    required this.supplier_name,
    required this.purpose,
    required this.cost_per_bag,
    required this.total_cost,
    required this.notes,
    required this.created_at,
    required this.updated_at,
  });

  factory AddCementModel.fromJson(Map<String, dynamic> json) {
    return AddCementModel(
        id: int.parse(json['id'].toString()),
        activity_date: json['activity_date']?.toString() ?? '',
        activity_time: json['activity_time']?.toString() ?? '',
        activity_type: json['activity_type']?.toString() ?? '',
        bags:  json['bags']?.toString() ?? '',
        supplier_name: json['supplier_name']?.toString() ?? '',
        purpose: json['purpose']?.toString() ?? '',
        cost_per_bag: json['cost_per_bag']?.toString() ?? '',
        total_cost: json['total_cost']?.toString() ?? '',
        notes:  json['notes']?.toString() ?? '',
        created_at: json['created_at']?.toString() ?? '',
        updated_at: json['updated_at']?.toString() ?? '',
    );
  }
}
