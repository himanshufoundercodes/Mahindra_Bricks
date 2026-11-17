int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is num) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? double.tryParse(value)?.toInt();
  }
  return null;
}

class LabourListModel {
  dynamic count;
  dynamic totalLabour;
  DateRange? dateRange;
  List<Data>? data;

  LabourListModel({this.count, this.totalLabour, this.dateRange, this.data});

  LabourListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalLabour = json['total_labour'];
    dateRange = json['date_range'] != null
        ? new DateRange.fromJson(json['date_range'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total_labour'] = this.totalLabour;
    if (this.dateRange != null) {
      data['date_range'] = this.dateRange!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DateRange {
  String? fromDate;
  String? toDate;

  DateRange({this.fromDate, this.toDate});

  DateRange.fromJson(Map<String, dynamic> json) {
    fromDate = json['from_date'];
    toDate = json['to_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    return data;
  }
}

class Data {
  dynamic id;
  dynamic labourCode;
  dynamic name;
  dynamic mobile;
  dynamic dailyRate;
  dynamic status;
  dynamic totalEarned;
  dynamic totalPaid;
  dynamic remainingBalance;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic profileImage;
  dynamic approvedOvertime;
  dynamic approvedOvertimeAmount;
  dynamic totalOvertimeHours;
  dynamic attendanceSummary;
  dynamic overtimeSummary;

  Data(
      {this.id,
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
        this.approvedOvertime,
        this.approvedOvertimeAmount,
        this.totalOvertimeHours,
        this.attendanceSummary,
        this.overtimeSummary});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labourCode = json['labour_code'];
    name = json['name'];
    mobile = json['mobile'];
    dailyRate = json['daily_rate'];
    status = json['status'];
    totalEarned = json['total_earned'];
    totalPaid = json['total_paid'];
    remainingBalance = json['remaining_balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    approvedOvertime = json['approved_overtime'];
    approvedOvertimeAmount = json['approved_overtime_amount'];
    totalOvertimeHours = json['total_overtime_hours'];
    attendanceSummary = json['attendance_summary'] != null
        ? new AttendanceSummary.fromJson(json['attendance_summary'])
        : null;
    overtimeSummary = json['overtime_summary'] != null
        ? new OvertimeSummary.fromJson(json['overtime_summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['labour_code'] = this.labourCode;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['daily_rate'] = this.dailyRate;
    data['status'] = this.status;
    data['total_earned'] = this.totalEarned;
    data['total_paid'] = this.totalPaid;
    data['remaining_balance'] = this.remainingBalance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_image'] = this.profileImage;
    data['approved_overtime'] = this.approvedOvertime;
    data['approved_overtime_amount'] = this.approvedOvertimeAmount;
    data['total_overtime_hours'] = this.totalOvertimeHours;
    if (this.attendanceSummary != null) {
      data['attendance_summary'] = this.attendanceSummary!.toJson();
    }
    if (this.overtimeSummary != null) {
      data['overtime_summary'] = this.overtimeSummary!.toJson();
    }
    return data;
  }
}

class AttendanceSummary {
  String? filterRange;
  int? presentDays;
  int? halfDays;
  int? absentDays;
  int? totalDays;
  int? totalOvertimeHours;
  int? approvedOvertime;
  int? approvedOvertimeAmount;
  int? totalOvertimeAmount;
  int? totalWages;

  AttendanceSummary(
      {this.filterRange,
        this.presentDays,
        this.halfDays,
        this.absentDays,
        this.totalDays,
        this.totalOvertimeHours,
        this.approvedOvertime,
        this.approvedOvertimeAmount,
        this.totalOvertimeAmount,
        this.totalWages});

  AttendanceSummary.fromJson(Map<String, dynamic> json) {
    filterRange = json['filter_range'];
    presentDays = _toInt(json['present_days']);
    halfDays = _toInt(json['half_days']);
    absentDays = _toInt(json['absent_days']);
    totalDays = _toInt(json['total_days']);
    totalOvertimeHours = _toInt(json['total_overtime_hours']);
    approvedOvertime = _toInt(json['approved_overtime']);
    approvedOvertimeAmount = _toInt(json['approved_overtime_amount']);
    totalOvertimeAmount = _toInt(json['total_overtime_amount']);
    totalWages = _toInt(json['total_wages']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filter_range'] = this.filterRange;
    data['present_days'] = this.presentDays;
    data['half_days'] = this.halfDays;
    data['absent_days'] = this.absentDays;
    data['total_days'] = this.totalDays;
    data['total_overtime_hours'] = this.totalOvertimeHours;
    data['approved_overtime'] = this.approvedOvertime;
    data['approved_overtime_amount'] = this.approvedOvertimeAmount;
    data['total_overtime_amount'] = this.totalOvertimeAmount;
    data['total_wages'] = this.totalWages;
    return data;
  }
}

class OvertimeSummary {
  int? totalOvertimeHours;
  int? approvedOvertime;
  int? approvedOvertimeAmount;

  OvertimeSummary(
      {this.totalOvertimeHours,
        this.approvedOvertime,
        this.approvedOvertimeAmount});

  OvertimeSummary.fromJson(Map<String, dynamic> json) {
    totalOvertimeHours = _toInt(json['total_overtime_hours']);
    approvedOvertime = _toInt(json['approved_overtime']);
    approvedOvertimeAmount = _toInt(json['approved_overtime_amount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_overtime_hours'] = this.totalOvertimeHours;
    data['approved_overtime'] = this.approvedOvertime;
    data['approved_overtime_amount'] = this.approvedOvertimeAmount;
    return data;
  }
}
