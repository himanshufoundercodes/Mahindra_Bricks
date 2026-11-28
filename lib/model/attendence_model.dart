class AttendanceDetailsModel{
  Filter? filter;
  Labour? labour;
  Summary? summary;
  List<AttendanceHistory> attendanceHistory;
  List<dynamic> transactions;

  AttendanceDetailsModel({
    this.filter,
    this.labour,
    this.summary,
    this.attendanceHistory = const [],
    this.transactions = const [],
  });

  factory AttendanceDetailsModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDetailsModel(
      filter: json['filter'] != null
          ? Filter.fromJson(json['filter'])
          : null,
      labour: json['labour'] != null
          ? Labour.fromJson(json['labour'])
          : null,
      summary: json['summary'] != null
          ? Summary.fromJson(json['summary'])
          : null,
      attendanceHistory: (json['attendance_history'] as List? ?? [])
          .map((e) => AttendanceHistory.fromJson(e))
          .toList(),
      transactions: json['transaction_history'] ?? json['transactions'] ?? [],
    );
  }
}

class Filter {
  String? date;
  String? fromDate;
  String? toDate;

  Filter({this.date, this.fromDate, this.toDate});

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      date: json['date'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
    );
  }
}

class Labour {
  int? id;
  String? labourCode;
  String? name;
  String? mobile;
  int? dailyRate;
  String? status;
  int? totalEarned;
  int? totalPaid;
  int? remainingBalance;
  String? createdAt;
  String? updatedAt;
  String? profileImage;

  Labour({
    this.id,
    this.labourCode,
    this.name,
    this.mobile,
    this.dailyRate,
    this.status,
    this.totalEarned,
    this.totalPaid,
    this.remainingBalance,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
  });

  factory Labour.fromJson(Map<String, dynamic> json) {
    return Labour(
      id: json['id'],
      labourCode: json['labour_code'],
      name: json['name'],
      mobile: json['mobile'],
      dailyRate: (json['daily_rate'] as num?)?.toInt(),
      status: json['status'],
      totalEarned: (json['total_earned'] as num?)?.toInt(),
      totalPaid: (json['total_paid'] as num?)?.toInt(),
      remainingBalance: (json['remaining_balance'] as num?)?.toInt(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profileImage: json['profile_image'],
    );
  }
}

class Summary {
  Attendance? attendance;
  TransactionsSummary? transactions;

  Summary({this.attendance, this.transactions});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      attendance: json['attendance_summary'] != null
          ? Attendance.fromJson(json['attendance_summary'])
          : json['attendance'] != null
              ? Attendance.fromJson(json['attendance'])
              : null,
      transactions: json['payment_summary'] != null
          ? TransactionsSummary.fromJson(json['payment_summary'])
          : json['transactions'] != null
              ? TransactionsSummary.fromJson(json['transactions'])
              : null,
    );
  }
}

class Attendance {
  int? presentDays;
  int? halfDays;
  int? absentDays;
  int? totalDays;
  int? totalOvertimeHours;
  int? totalOvertimeAmount;
  int? totalDailyWage;
  int? totalEarnedInRange;

  Attendance({
    this.presentDays,
    this.halfDays,
    this.absentDays,
    this.totalDays,
    this.totalOvertimeHours,
    this.totalOvertimeAmount,
    this.totalDailyWage,
    this.totalEarnedInRange,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      presentDays: (json['present_days'] as num?)?.toInt(),
      halfDays: (json['half_days'] as num?)?.toInt(),
      absentDays: (json['absent_days'] as num?)?.toInt(),
      totalDays: (json['total_days'] as num?)?.toInt(),
      totalOvertimeHours: (json['total_overtime_hours'] as num?)?.toInt(),
      totalOvertimeAmount: (json['total_overtime_amount'] as num?)?.toInt(),
      totalDailyWage: (json['total_daily_wage'] as num?)?.toInt(),
      totalEarnedInRange: (json['total_earned_in_range'] as num?)?.toInt(),
    );
  }
}

class TransactionsSummary {
  int? totalTransactions;
  int? totalPaidInRange;
  int? allTimeEarned;
  int? allTimePaid;
  int? remainingBalance;

  TransactionsSummary({
    this.totalTransactions,
    this.totalPaidInRange,
    this.allTimeEarned,
    this.allTimePaid,
    this.remainingBalance,
  });

  factory TransactionsSummary.fromJson(Map<String, dynamic> json) {
    return TransactionsSummary(
      totalTransactions: (json['total_transactions'] as num?)?.toInt(),
      totalPaidInRange: (json['total_paid_in_range'] as num?)?.toInt(),
      allTimeEarned: (json['all_time_earned'] as num?)?.toInt(),
      allTimePaid: (json['all_time_paid'] as num?)?.toInt(),
      remainingBalance: (json['remaining_balance'] as num?)?.toInt(),
    );
  }
}

class AttendanceHistory {
  int? id;
  int? labourId;
  String? attendanceDate;
  String? status;
  int? dailyWage;
  int? overtimeHours;
  int? overtimeRate;
  int? overtimeAmount;
  int? totalWage;
  String? createdAt;
  String? updatedAt;

  AttendanceHistory({
    this.id,
    this.labourId,
    this.attendanceDate,
    this.status,
    this.dailyWage,
    this.overtimeHours,
    this.overtimeRate,
    this.overtimeAmount,
    this.totalWage,
    this.createdAt,
    this.updatedAt,
  });

  factory AttendanceHistory.fromJson(Map<String, dynamic> json) {
    return AttendanceHistory(
      id: (json['id'] as num?)?.toInt(),
      labourId: (json['labour_id'] as num?)?.toInt(),
      attendanceDate: json['attendance_date'],
      status: json['status'],
      dailyWage: (json['daily_wage'] as num?)?.toInt(),
      overtimeHours: (json['overtime_hours'] as num?)?.toInt(),
      overtimeRate: (json['overtime_rate'] as num?)?.toInt(),
      overtimeAmount: (json['overtime_amount'] as num?)?.toInt(),
      totalWage: (json['total_wage'] as num?)?.toInt(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
