int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is num) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? double.tryParse(value)?.toInt() ?? 0;
  }
  return 0;
}

class ProductDetailModel {
  final String title;
  final String subtitle;
  final StockSummary? stockSummary;
  final int count;
  final List<Data> data;

  const ProductDetailModel({
    required this.title,
    required this.subtitle,
    this.stockSummary,
    required this.count,
    required this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    title: json['title']?.toString() ?? '',
    subtitle: json['subtitle']?.toString() ?? '',
    stockSummary: json['stock_summary'] != null ? StockSummary.fromJson(json['stock_summary'] as Map<String, dynamic>) : null,
    count: _toInt(json['count']),
    data: (json['data'] as List<dynamic>? ?? []).map((e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'stock_summary': stockSummary?.toJson(),
    'count': count,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class Data {
  final int id;
  final String name;
  final String sku;
  final String category;
  final String dimensions;
  final String pricePerUnit;
  final int stockQuantity;
  final String description;
  final int isActive;
  final String createdAt;
  final String updatedAt;
  final String colour;
  final String productType;
  final int lengthMm;
  final int widthMm;
  final int heightMm;
  final String costPrice;
  final String sellingPrice;
  final int minStockAlert;
  final int totalProduction;
  final int totalDispatched;
  final int totalSold;
  final int categoryId;
  final String imageUrl;
  final String stockStatus;
  final int currentStockValue;

  const Data({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    required this.dimensions,
    required this.pricePerUnit,
    required this.stockQuantity,
    required this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.colour,
    required this.productType,
    required this.lengthMm,
    required this.widthMm,
    required this.heightMm,
    required this.costPrice,
    required this.sellingPrice,
    required this.minStockAlert,
    required this.totalProduction,
    required this.totalDispatched,
    required this.totalSold,
    required this.categoryId,
    required this.imageUrl,
    required this.stockStatus,
    required this.currentStockValue,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: _toInt(json['id']),
    name: json['name']?.toString() ?? '',
    sku: json['sku']?.toString() ?? '',
    category: json['category']?.toString() ?? '',
    dimensions: json['dimensions']?.toString() ?? '',
    pricePerUnit: json['price_per_unit']?.toString() ?? '',
    stockQuantity: _toInt(json['stock_quantity']),
    description: json['description']?.toString() ?? '',
    isActive: _toInt(json['is_active']),
    createdAt: json['created_at']?.toString() ?? '',
    updatedAt: json['updated_at']?.toString() ?? '',
    colour: json['colour']?.toString() ?? '',
    productType: json['product_type']?.toString() ?? '',
    lengthMm: _toInt(json['length_mm']),
    widthMm: _toInt(json['width_mm']),
    heightMm: _toInt(json['height_mm']),
    costPrice: json['cost_price']?.toString() ?? '',
    sellingPrice: json['selling_price']?.toString() ?? '',
    minStockAlert: _toInt(json['min_stock_alert']),
    totalProduction: _toInt(json['total_production']),
    totalDispatched: _toInt(json['total_dispatched']),
    totalSold: _toInt(json['total_sold']),
    categoryId: _toInt(json['category_id']),
    imageUrl: json['image_url']?.toString() ?? '',
    stockStatus: json['stock_status']?.toString() ?? '',
    currentStockValue: _toInt(json['current_stock_value']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'sku': sku,
    'category': category,
    'dimensions': dimensions,
    'price_per_unit': pricePerUnit,
    'stock_quantity': stockQuantity,
    'description': description,
    'is_active': isActive,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'colour': colour,
    'product_type': productType,
    'length_mm': lengthMm,
    'width_mm': widthMm,
    'height_mm': heightMm,
    'cost_price': costPrice,
    'selling_price': sellingPrice,
    'min_stock_alert': minStockAlert,
    'total_production': totalProduction,
    'total_dispatched': totalDispatched,
    'total_sold': totalSold,
    'category_id': categoryId,
    'image_url': imageUrl,
    'stock_status': stockStatus,
    'current_stock_value': currentStockValue,
  };
}

class StockSummary {
  final String title;
  final int totalStock;
  final String totalStockFormatted;
  final String unit;

  const StockSummary({
    required this.title,
    required this.totalStock,
    required this.totalStockFormatted,
    required this.unit,
  });

  factory StockSummary.fromJson(Map<String, dynamic> json) => StockSummary(
    title: json['title']?.toString() ?? '',
    totalStock: _toInt(json['total_stock']),
    totalStockFormatted: json['total_stock_formatted']?.toString() ?? '',
    unit: json['unit']?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'total_stock': totalStock,
    'total_stock_formatted': totalStockFormatted,
    'unit': unit,
  };
}
