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
    dateRange: DateRange.fromJson(json['date_range'] as Map<String, dynamic>),
    summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
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
    labourId: json['labour_id'],
    labourCode: json['labour_code'],
    name: json['name'],
    mobile: json['mobile'],
    dailyRate: json['daily_rate'],
    breakdown: Breakdown.fromJson(json['breakdown'] as Map<String, dynamic>),
    payableAmount: json['payable_amount'],
    paidAmount: json['paid_amount'],
    remainingAmount: json['remaining_amount'],
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
    present: json['present'],
    halfDay: json['half_day'],
    absent: json['absent'],
    overtimeHours: json['overtime_hours'],
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
    totalLabour: json['total_labour'],
    present: json['present'] ,
    halfDay: json['half_day'],
    absent: json['absent'],
    overtimeHours: json['overtime_hours'],
    totalPayable: json['total_payable'],
    totalPaid: json['total_paid'],
    remaining: json['remaining'],
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
    fromDate: json['from_date'],
    toDate: json['to_date'],
  );

  Map<String, dynamic> toJson() => {
    'from_date': fromDate,
    'to_date': toDate,
  };
}