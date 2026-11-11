class ReportsModel {
  final DateRange dateRange;
  final StockReport stockReport;
  final DispatchReport dispatchReport;
  final ProductionReport productionReport;
  final LabourReport labourReport;
  final PaymentReport paymentReport;
  final ClientReport clientReport;

  const ReportsModel({
    required this.dateRange,
    required this.stockReport,
    required this.dispatchReport,
    required this.productionReport,
    required this.labourReport,
    required this.paymentReport,
    required this.clientReport,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
    dateRange: DateRange.fromJson(json['date_range'] as Map<String, dynamic>),
    stockReport: StockReport.fromJson(json['stock_report'] as Map<String, dynamic>),
    dispatchReport: DispatchReport.fromJson(json['dispatch_report'] as Map<String, dynamic>),
    productionReport: ProductionReport.fromJson(json['production_report'] as Map<String, dynamic>),
    labourReport: LabourReport.fromJson(json['labour_report'] as Map<String, dynamic>),
    paymentReport: PaymentReport.fromJson(json['payment_report'] as Map<String, dynamic>),
    clientReport: ClientReport.fromJson(json['client_report'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'date_range': dateRange.toJson(),
    'stock_report': stockReport.toJson(),
    'dispatch_report': dispatchReport.toJson(),
    'production_report': productionReport.toJson(),
    'labour_report': labourReport.toJson(),
    'payment_report': paymentReport.toJson(),
    'client_report': clientReport.toJson(),
  };
}

class ClientReport {
  final int totalClients;
  final int totalOrders;
  final int totalBilling;
  final int pendingAmount;

  const ClientReport({
    required this.totalClients,
    required this.totalOrders,
    required this.totalBilling,
    required this.pendingAmount,
  });

  factory ClientReport.fromJson(Map<String, dynamic> json) => ClientReport(
    totalClients: json['total_clients'],
    totalOrders: json['total_orders'],
    totalBilling: json['total_billing'],
    pendingAmount: json['pending_amount'],
  );

  Map<String, dynamic> toJson() => {
    'total_clients': totalClients,
    'total_orders': totalOrders,
    'total_billing': totalBilling,
    'pending_amount': pendingAmount,
  };
}

class PaymentReport {
  final int receivedClients;
  final int pendingClients;
  final int labourPayout;
  final int cementPurchase;

  const PaymentReport({
    required this.receivedClients,
    required this.pendingClients,
    required this.labourPayout,
    required this.cementPurchase,
  });

  factory PaymentReport.fromJson(Map<String, dynamic> json) => PaymentReport(
    receivedClients: json['received_clients'],
    pendingClients: json['pending_clients'],
    labourPayout: json['labour_payout'],
    cementPurchase: json['cement_purchase'],
  );

  Map<String, dynamic> toJson() => {
    'received_clients': receivedClients,
    'pending_clients': pendingClients,
    'labour_payout': labourPayout,
    'cement_purchase': cementPurchase,
  };
}

class LabourReport {
  final int totalLabour;
  final int present;
  final int absent;
  final String overtime;
  final int overtimeHours;

  const LabourReport({
    required this.totalLabour,
    required this.present,
    required this.absent,
    required this.overtime,
    required this.overtimeHours,
  });

  factory LabourReport.fromJson(Map<String, dynamic> json) => LabourReport(
    totalLabour: json['total_labour'],
    present: json['present'],
    absent: json['absent'],
    overtime: json['overtime'],
    overtimeHours: json['overtime_hours'],
  );

  Map<String, dynamic> toJson() => {
    'total_labour': totalLabour,
    'present': present,
    'absent': absent,
    'overtime': overtime,
    'overtime_hours': overtimeHours,
  };
}

class ProductionReport {
  final String totalProduced;
  final int totalPiecesProduced;
  final String totalBreakage;
  final int totalBreakagePieces;
  final String netProduced;
  final int netPieces;
  final int batchesCount;

  const ProductionReport({
    required this.totalProduced,
    required this.totalPiecesProduced,
    required this.totalBreakage,
    required this.totalBreakagePieces,
    required this.netProduced,
    required this.netPieces,
    required this.batchesCount,
  });

  factory ProductionReport.fromJson(Map<String, dynamic> json) => ProductionReport(
    totalProduced: json['total_produced'],
    totalPiecesProduced: json['total_pieces_produced'],
    totalBreakage: json['total_breakage'],
    totalBreakagePieces: json['total_breakage_pieces'],
    netProduced: json['net_produced'],
    netPieces: json['net_pieces'],
    batchesCount: json['batches_count'],
  );

  Map<String, dynamic> toJson() => {
    'total_produced': totalProduced,
    'total_pieces_produced': totalPiecesProduced,
    'total_breakage': totalBreakage,
    'total_breakage_pieces': totalBreakagePieces,
    'net_produced': netProduced,
    'net_pieces': netPieces,
    'batches_count': batchesCount,
  };
}

class DispatchReport {
  final String totalDispatch;
  final int totalDispatchPieces;
  final int totalTrips;
  final int totalClients;

  const DispatchReport({
    required this.totalDispatch,
    required this.totalDispatchPieces,
    required this.totalTrips,
    required this.totalClients,
  });

  factory DispatchReport.fromJson(Map<String, dynamic> json) => DispatchReport(
    totalDispatch: json['total_dispatch'],
    totalDispatchPieces: json['total_dispatch_pieces'],
    totalTrips: json['total_trips'],
    totalClients: json['total_clients'],
  );

  Map<String, dynamic> toJson() => {
    'total_dispatch': totalDispatch,
    'total_dispatch_pieces': totalDispatchPieces,
    'total_trips': totalTrips,
    'total_clients': totalClients,
  };
}

class StockReport {
  final String cementStock;
  final int cementStockBags;
  final String brickStock;
  final int brickStockPieces;
  final String paverStock;
  final int paverStockPieces;

  const StockReport({
    required this.cementStock,
    required this.cementStockBags,
    required this.brickStock,
    required this.brickStockPieces,
    required this.paverStock,
    required this.paverStockPieces,
  });

  factory StockReport.fromJson(Map<String, dynamic> json) => StockReport(
    cementStock: json['cement_stock'],
    cementStockBags: json['cement_stock_bags'],
    brickStock: json['brick_stock'],
    brickStockPieces: json['brick_stock_pieces'],
    paverStock: json['paver_stock'],
    paverStockPieces: json['paver_stock_pieces'],
  );

  Map<String, dynamic> toJson() => {
    'cement_stock': cementStock,
    'cement_stock_bags': cementStockBags,
    'brick_stock': brickStock,
    'brick_stock_pieces': brickStockPieces,
    'paver_stock': paverStock,
    'paver_stock_pieces': paverStockPieces,
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