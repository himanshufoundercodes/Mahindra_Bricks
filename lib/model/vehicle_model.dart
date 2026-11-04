class VehicleModel{
  dynamic id;
  dynamic vehicle_name;
  dynamic vehicle_number;
  dynamic vehicle_type;
  dynamic driver_name;
  dynamic driver_mobile;
  dynamic capacity_pieces;
  dynamic status;
  dynamic notes;
  dynamic created_at;
  dynamic updated_at;
  dynamic call_url;

  VehicleModel({
    this.id,
    this.vehicle_name,
    this.vehicle_number,
    this.vehicle_type,
    this.driver_name,
    this.driver_mobile,
    this.capacity_pieces,
    this.status,
    this.notes,
    this.created_at,
    this.updated_at,
    this.call_url
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      vehicle_name: json['vehicle_name'],
      vehicle_number: json['vehicle_number'],
      vehicle_type: json['vehicle_type'],
      driver_name: json['driver_name'],
      driver_mobile: json['driver_mobile'],
      capacity_pieces: json['capacity_pieces'],
      status: json['status'],
      notes: json['notes'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      call_url: json['call_url'],
    );
  }
}

