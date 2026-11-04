class AddVehicleModel {
  final int id;
  final String vehicle_name;
  final String vehicle_number;
  final String vehicle_type;
  final String driver_name;
  final String driver_mobile;
  final String capacity_pieces;
  final String status;
  final String notes;
  final String created_at;
  final String updated_at;
  final String call_url;

  AddVehicleModel({
    required this.id,
    required this.vehicle_name,
    required this.vehicle_number,
    required this.vehicle_type,
    required this.driver_name,
    required this.driver_mobile,
    required this.capacity_pieces,
    required this.status,
    required this.notes,
    required this.created_at,
    required this.updated_at,
    required this.call_url,
  });

  factory AddVehicleModel.fromJson(Map<String, dynamic> json) {
    return AddVehicleModel(
      id: json['id'] ?? 0,
      vehicle_name: json['vehicle_name'] ?? '',
      vehicle_number: json['vehicle_number'] ?? '',
      vehicle_type: json['vehicle_type'] ?? '',
      driver_name: json['driver_name'] ?? '',
      driver_mobile: json['driver_mobile'] ?? '',
      capacity_pieces: json['capacity_pieces'] ?? '',
      status: json['status'] ?? '',
      notes: json['notes'] ?? '',
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
      call_url: json['call_url'] ?? '',
    );
  }
}
