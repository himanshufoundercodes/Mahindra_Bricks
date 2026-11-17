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

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) {
    return double.tryParse(value);
  }
  return null;
}

class DashBoardListModel {
  String? date;
  String? greeting;
  String? subTitle;
  Cards? cards;
  List<QuickActions>? quickActions;

  DashBoardListModel(
      {this.date, this.greeting, this.subTitle, this.cards, this.quickActions});

  DashBoardListModel.fromJson(Map<String, dynamic> jsonInput) {
    final json = (jsonInput['data'] is Map<String, dynamic>)
        ? jsonInput['data'] as Map<String, dynamic>
        : jsonInput;

    date = json['date']?.toString();
    greeting = json['greeting']?.toString();
    subTitle = json['sub_title']?.toString();
    cards = json['cards'] != null ? Cards.fromJson(json['cards']) : null;
    if (json['quick_actions'] != null && json['quick_actions'] is List) {
      quickActions = <QuickActions>[];
      (json['quick_actions'] as List).forEach((v) {
        if (v is Map<String, dynamic>) {
          quickActions!.add(QuickActions.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['greeting'] = this.greeting;
    data['sub_title'] = this.subTitle;
    if (this.cards != null) {
      data['cards'] = this.cards!.toJson();
    }
    if (this.quickActions != null) {
      data['quick_actions'] =
          this.quickActions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  TotalStock? totalStock;
  TotalStock? todayProduction;
  TotalClients? totalClients;
  TodayDispatch? todayDispatch;
  LabourPresent? labourPresent;
  PendingLabourPayout? pendingLabourPayout;

  Cards(
      {this.totalStock,
        this.todayProduction,
        this.totalClients,
        this.todayDispatch,
        this.labourPresent,
        this.pendingLabourPayout});

  Cards.fromJson(Map<String, dynamic> json) {
    totalStock = json['total_stock'] != null
        ? TotalStock.fromJson(json['total_stock'])
        : null;
    todayProduction = json['today_production'] != null
        ? TotalStock.fromJson(json['today_production'])
        : null;
    totalClients = json['total_clients'] != null
        ? TotalClients.fromJson(json['total_clients'])
        : null;
    todayDispatch = json['today_dispatch'] != null
        ? TodayDispatch.fromJson(json['today_dispatch'])
        : null;
    labourPresent = json['labour_present'] != null
        ? LabourPresent.fromJson(json['labour_present'])
        : null;
    pendingLabourPayout = json['pending_labour_payout'] != null
        ? PendingLabourPayout.fromJson(json['pending_labour_payout'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalStock != null) {
      data['total_stock'] = this.totalStock!.toJson();
    }
    if (this.todayProduction != null) {
      data['today_production'] = this.todayProduction!.toJson();
    }
    if (this.totalClients != null) {
      data['total_clients'] = this.totalClients!.toJson();
    }
    if (this.todayDispatch != null) {
      data['today_dispatch'] = this.todayDispatch!.toJson();
    }
    if (this.labourPresent != null) {
      data['labour_present'] = this.labourPresent!.toJson();
    }
    if (this.pendingLabourPayout != null) {
      data['pending_labour_payout'] = this.pendingLabourPayout!.toJson();
    }
    return data;
  }
}

class TotalStock {
  dynamic pieces;
  dynamic productsCount;
  String? label;
  String? subLabel;
  String? link;

  TotalStock(
      {this.pieces, this.productsCount, this.label, this.subLabel, this.link});

  TotalStock.fromJson(Map<String, dynamic> json) {
    pieces = json['pieces'];
    productsCount = json['products_count'];
    label = json['label'];
    subLabel = json['sub_label'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pieces'] = this.pieces;
    data['products_count'] = this.productsCount;
    data['label'] = this.label;
    data['sub_label'] = this.subLabel;
    data['link'] = this.link;
    return data;
  }
}

class TotalClients {
  dynamic clientsCount;
  dynamic pendingPaymentsCount;
  String? label;
  String? subLabel;
  String? link;

  TotalClients(
      {this.clientsCount,
        this.pendingPaymentsCount,
        this.label,
        this.subLabel,
        this.link});

  TotalClients.fromJson(Map<String, dynamic> json) {
    clientsCount = json['clients_count'];
    pendingPaymentsCount = json['pending_payments_count'];
    label = json['label'];
    subLabel = json['sub_label'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clients_count'] = this.clientsCount;
    data['pending_payments_count'] = this.pendingPaymentsCount;
    data['label'] = this.label;
    data['sub_label'] = this.subLabel;
    data['link'] = this.link;
    return data;
  }
}

class TodayDispatch {
  dynamic pieces;
  dynamic tripsCount;
  String? label;
  String? subLabel;
  String? link;

  TodayDispatch(
      {this.pieces, this.tripsCount, this.label, this.subLabel, this.link});

  TodayDispatch.fromJson(Map<String, dynamic> json) {
    pieces = json['pieces'];
    tripsCount = json['trips_count'];
    label = json['label'];
    subLabel = json['sub_label'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pieces'] = this.pieces;
    data['trips_count'] = this.tripsCount;
    data['label'] = this.label;
    data['sub_label'] = this.subLabel;
    data['link'] = this.link;
    return data;
  }
}

class LabourPresent {
  dynamic present;
  dynamic total;
  dynamic absent;
  dynamic halfDay;
  String? ratio;
  String? subLabel;
  String? link;

  LabourPresent(
      {this.present,
        this.total,
        this.absent,
        this.halfDay,
        this.ratio,
        this.subLabel,
        this.link});

  LabourPresent.fromJson(Map<String, dynamic> json) {
    present = json['present'];
    total = json['total'];
    absent = json['absent'];
    halfDay = json['half_day'];
    ratio = json['ratio'];
    subLabel = json['sub_label'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['present'] = this.present;
    data['total'] = this.total;
    data['absent'] = this.absent;
    data['half_day'] = this.halfDay;
    data['ratio'] = this.ratio;
    data['sub_label'] = this.subLabel;
    data['link'] = this.link;
    return data;
  }
}

class PendingLabourPayout {
  dynamic amount;
  dynamic labourersCount;
  String? label;
  String? subLabel;
  String? link;

  PendingLabourPayout(
      {this.amount, this.labourersCount, this.label, this.subLabel, this.link});

  PendingLabourPayout.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    labourersCount = json['labourers_count'];
    label = json['label'];
    subLabel = json['sub_label'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['labourers_count'] = this.labourersCount;
    data['label'] = this.label;
    data['sub_label'] = this.subLabel;
    data['link'] = this.link;
    return data;
  }
}

class QuickActions {
  String? name;
  String? route;
  String? method;
  int? page;

  QuickActions({this.name, this.route, this.method, this.page});

  QuickActions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    route = json['route'];
    method = json['method'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['route'] = this.route;
    data['method'] = this.method;
    data['page'] = this.page;
    return data;
  }
}