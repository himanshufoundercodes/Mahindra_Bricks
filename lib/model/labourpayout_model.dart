int _toIntNonNull(dynamic value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is num) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? double.tryParse(value)?.toInt() ?? defaultValue;
  }
  return defaultValue;
}

class LabourpayoutModel {
  final DateRange dateRange;
  final Summary summary;
  final List<Workers> workers;

  const LabourpayoutModel({
    required this.dateRange,
    required this.summary,
    required this.workers,
  });

  factory LabourpayoutModel.fromJson(Map<String, dynamic> json) => LabourpayoutModel(
    dateRange: DateRange.fromJson(json['date_range'] as Map<String, dynamic>? ?? {}),
    summary: Summary.fromJson(json['summary'] as Map<String, dynamic>? ?? {}),
    workers: (json['workers'] as List<dynamic>? ?? []).map((e) => Workers.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'date_range': dateRange.toJson(),
    'summary': summary.toJson(),
    'workers': workers.map((e) => e.toJson()).toList(),
  };
}

class Workers {
  final int labourId;
  final String labourCode;
  final String name;
  final String mobile;
  final int dailyRate;
  final Breakdown breakdown;
  final int payableAmount;
  final int paidAmount;
  final int remainingAmount;

  const Workers({
    required this.labourId,
    required this.labourCode,
    required this.name,
    required this.mobile,
    required this.dailyRate,
    required this.breakdown,
    required this.payableAmount,
    required this.paidAmount,
    required this.remainingAmount,
  });

  factory Workers.fromJson(Map<String, dynamic> json) => Workers(
    labourId: _toIntNonNull(json['labour_id']),
    labourCode: json['labour_code']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    mobile: json['mobile']?.toString() ?? '',
    dailyRate: _toIntNonNull(json['daily_rate']),
    breakdown: Breakdown.fromJson(json['breakdown'] as Map<String, dynamic>? ?? {}),
    payableAmount: _toIntNonNull(json['payable_amount']),
    paidAmount: _toIntNonNull(json['paid_amount']),
    remainingAmount: _toIntNonNull(json['remaining_amount']),
  );

  Map<String, dynamic> toJson() => {
    'labour_id': labourId,
    'labour_code': labourCode,
    'name': name,
    'mobile': mobile,
    'daily_rate': dailyRate,
    'breakdown': breakdown.toJson(),
    'payable_amount': payableAmount,
    'paid_amount': paidAmount,
    'remaining_amount': remainingAmount,
  };
}

class Breakdown {
  final int present;
  final int halfDay;
  final int absent;
  final int overtimeHours;

  const Breakdown({
    required this.present,
    required this.halfDay,
    required this.absent,
    required this.overtimeHours,
  });

  factory Breakdown.fromJson(Map<String, dynamic> json) => Breakdown(
    present: _toIntNonNull(json['present']),
    halfDay: _toIntNonNull(json['half_day']),
    absent: _toIntNonNull(json['absent']),
    overtimeHours: _toIntNonNull(json['overtime_hours']),
  );

  Map<String, dynamic> toJson() => {
    'present': present,
    'half_day': halfDay,
    'absent': absent,
    'overtime_hours': overtimeHours,
  };
}

class Summary {
  final int totalLabour;
  final int present;
  final int halfDay;
  final int absent;
  final int overtimeHours;
  final int totalPayable;
  final int totalPaid;
  final int remaining;

  const Summary({
    required this.totalLabour,
    required this.present,
    required this.halfDay,
    required this.absent,
    required this.overtimeHours,
    required this.totalPayable,
    required this.totalPaid,
    required this.remaining,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalLabour: _toIntNonNull(json['total_labour']),
    present: _toIntNonNull(json['present']),
    halfDay: _toIntNonNull(json['half_day']),
    absent: _toIntNonNull(json['absent']),
    overtimeHours: _toIntNonNull(json['overtime_hours']),
    totalPayable: _toIntNonNull(json['total_payable']),
    totalPaid: _toIntNonNull(json['total_paid']),
    remaining: _toIntNonNull(json['remaining']),
  );

  Map<String, dynamic> toJson() => {
    'total_labour': totalLabour,
    'present': present,
    'half_day': halfDay,
    'absent': absent,
    'overtime_hours': overtimeHours,
    'total_payable': totalPayable,
    'total_paid': totalPaid,
    'remaining': remaining,
  };
}

class DateRange {
  final String fromDate;
  final String toDate;

  const DateRange({
    required this.fromDate,
    required this.toDate,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) => DateRange(
    fromDate: json['from_date']?.toString() ?? '',
    toDate: json['to_date']?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    'from_date': fromDate,
    'to_date': toDate,
  };
}
