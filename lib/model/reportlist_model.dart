class ReportListModel {
  String? title;
  String? subtitle;
  DateRange? dateRange;
  List<ReportCard>? data;
  List<ReportCard>? cards;

  ReportListModel({
    this.title,
    this.subtitle,
    this.dateRange,
    this.data,
    this.cards,
  });

  ReportListModel.fromJson(Map<String, dynamic> jsonInput) {
    final json = (jsonInput['data'] is Map<String, dynamic>)
        ? jsonInput['data'] as Map<String, dynamic>
        : jsonInput;

    title = json['title']?.toString();
    subtitle = json['subtitle']?.toString();
    dateRange = json['date_range'] != null && json['date_range'] is Map<String, dynamic>
        ? DateRange.fromJson(json['date_range'] as Map<String, dynamic>)
        : null;

    if (json['data'] != null && json['data'] is List) {
      data = <ReportCard>[];
      for (var v in (json['data'] as List)) {
        if (v is Map<String, dynamic>) {
          data!.add(ReportCard.fromJson(v));
        }
      }
    }

    if (json['cards'] != null && json['cards'] is List) {
      cards = <ReportCard>[];
      for (var v in (json['cards'] as List)) {
        if (v is Map<String, dynamic>) {
          cards!.add(ReportCard.fromJson(v));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['subtitle'] = subtitle;
    if (dateRange != null) {
      json['date_range'] = dateRange!.toJson();
    }
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (cards != null) {
      json['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class DateRange {
  String? fromDate;
  String? toDate;

  DateRange({this.fromDate, this.toDate});

  DateRange.fromJson(Map<String, dynamic> json) {
    fromDate = json['from_date']?.toString();
    toDate = json['to_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    return data;
  }
}

class ReportCard {
  String? id;
  String? title;
  String? subtitle;
  String? image;
  List<ReportStat>? stats;

  ReportCard({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.stats,
  });

  ReportCard.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    subtitle = json['subtitle']?.toString();
    image = json['image']?.toString();
    if (json['stats'] != null && json['stats'] is List) {
      stats = <ReportStat>[];
      for (var v in (json['stats'] as List)) {
        if (v is Map<String, dynamic>) {
          stats!.add(ReportStat.fromJson(v));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['image'] = image;
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReportStat {
  String? label;
  String? value;

  ReportStat({this.label, this.value});

  ReportStat.fromJson(Map<String, dynamic> json) {
    label = json['label']?.toString();
    value = json['value']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}

// Aliases for compatibility with existing class names
typedef Data = ReportCard;
typedef Cards = ReportCard;
typedef Stats = ReportStat;
