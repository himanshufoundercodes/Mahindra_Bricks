class AddproductionModel {
  final dynamic id;
  final dynamic production_date;
  final dynamic product_id;
  final dynamic shift;
  final dynamic quantity_produced;
  final dynamic breakage_quantity;
  final dynamic net_produced;
  final dynamic cement_bags_used;
  final dynamic batch_number;
  final dynamic supervisor_name;
  final dynamic notes;
  final dynamic created_at;
  final dynamic updated_at;
  final dynamic product_name;
  final dynamic product_sku;
  final dynamic breakage_rate_percentage;

  AddproductionModel({
    required this.id,
    required this.production_date,
    required this.product_id,
    required this.shift,
    required this.quantity_produced,
    this.breakage_quantity,
    this.net_produced,
    this.cement_bags_used,
    this.batch_number,
    this.supervisor_name,
    this.notes,
    this.created_at,
    this.updated_at,
    this.product_name,
    this.product_sku,
    this.breakage_rate_percentage,
  });

  factory AddproductionModel.fromJson(Map<String, dynamic> json) {
    return AddproductionModel(
        id: json['id'] ?? 0,
        production_date: json['production_date'] ?? '',
        product_id: json['product_id'] ?? '',
        shift: json['shift'] ?? '',
        quantity_produced:  json['quantity_produced']??'',
        breakage_quantity: json['breakage_quantity'] ?? '',
        net_produced: json['net_produced'] ?? '',
        cement_bags_used: json['cement_bags_used'] ?? '',
        batch_number:  json['batch_number']??'',
        supervisor_name:  json['supervisor_name']??'',
        notes: json['notes'] ?? '',
        created_at: json['created_at'] ?? '',
        updated_at: json['updated_at'] ?? '',
        product_name:  json['product_name']??'',
        product_sku: json['product_sku'] ?? '',
        breakage_rate_percentage: json['breakage_rate_percentage'] ?? '',
    );
  }
}
