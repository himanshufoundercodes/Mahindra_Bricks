class DailyattendenceModel {
  final String date;
  final Summary summary;
  final List<Workers> workers;

  const DailyattendenceModel({
    required this.date,
    required this.summary,
    required this.workers,
  });

  factory DailyattendenceModel.fromJson(Map<String, dynamic> json) => DailyattendenceModel(
    date: json["date"],
    summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
    workers: (json['workers'] as List<dynamic>? ?? []).map((e) => Workers.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'summary': summary,
    'workers': workers.map((e) => e.toJson()).toList(),
  };
}

class Workers {
  final int labourId;
  final String labourCode;
  final String name;
  final String mobile;
  final dynamic dailyRate;
  final bool isMarked;
  final dynamic status;
  final dynamic overtimeHours;
  final dynamic overtimeRate;
  final dynamic overtimeAmount;
  final dynamic dailyWage;
  final dynamic totalWage;
  final dynamic notes;

  const Workers({
    required this.labourId,
    required this.labourCode,
    required this.name,
    required this.mobile,
    required this.dailyRate,
    required this.isMarked,
    required this.status,
    required this.overtimeHours,
    required this.overtimeRate,
    required this.overtimeAmount,
    required this.dailyWage,
    required this.totalWage,
    required this.notes,
  });

  factory Workers.fromJson(Map<String, dynamic> json) => Workers(
    labourId: json['labour_id'] is int ? json['labour_id'] : int.tryParse(json['labour_id']?.toString() ?? '0') ?? 0,
    labourCode: json['labour_code']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    mobile: json['mobile']?.toString() ?? '',
    dailyRate: json['daily_rate'],
    isMarked: json['is_marked'] ?? false,
    status: json['status'],
    overtimeHours: json['overtime_hours'],
    overtimeRate: json['overtime_rate'],
    overtimeAmount: json['overtime_amount'],
    dailyWage: json['daily_wage'],
    totalWage: json['total_wage'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'labour_id': labourId,
    'labour_code': labourCode,
    'name': name,
    'mobile': mobile,
    'daily_rate': dailyRate,
    'is_marked': isMarked,
    'status': status,
    'overtime_hours': overtimeHours,
    'overtime_rate': overtimeRate,
    'overtime_amount': overtimeAmount,
    'daily_wage': dailyWage,
    'total_wage': totalWage,
    'notes': notes,
  };
}

class Summary {
  final dynamic totalLabour;
  final dynamic present;
  final dynamic halfDay;
  final dynamic absent;
  final dynamic notMarked;

  const Summary({
    required this.totalLabour,
    required this.present,
    required this.halfDay,
    required this.absent,
    required this.notMarked,
  });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      Summary(
        totalLabour: json['total_labour'],
        present: json['present'],
        halfDay: json['half_day'],
        absent: json['absent'],
        notMarked: json['not_marked'],
      );
}