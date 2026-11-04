class CementStockModel {
  String? date;
  CementStockSummaryModel? summary;
  List<dynamic>? today_activities;

  CementStockModel({
    this.date,
    this.summary,
    this.today_activities,
  });

  factory CementStockModel.fromJson(Map<String, dynamic> json) {
    return CementStockModel(
      date: json['date'],
      summary: json['summary'] != null
          ? CementStockSummaryModel.fromJson(json['summary'])
          : null,
      today_activities: json['today_activities'] ?? [],
    );
  }
}

class CementStockSummaryModel {
  dynamic current_stock;
  dynamic today_stock_in;
  dynamic today_used;
  dynamic closing_stock;
  String? unit;
  dynamic min_stock_alert;
  String? stock_status;
  String? formula;

  CementStockSummaryModel({
    this.current_stock,
    this.today_stock_in,
    this.today_used,
    this.closing_stock,
    this.unit,
    this.min_stock_alert,
    this.stock_status,
    this.formula,
  });

  factory CementStockSummaryModel.fromJson(Map<String, dynamic> json) {
    return CementStockSummaryModel(
      current_stock: json['current_stock'],
      today_stock_in: json['today_stock_in'],
      today_used: json['today_used'],
      closing_stock: json['closing_stock'],
      unit: json['unit'],
      min_stock_alert: json['min_stock_alert'],
      stock_status: json['stock_status'],
      formula: json['formula'],
    );
  }
}