// class StockListModel {
//   String? title;
//   String? subtitle;
//   StockSummary? stockSummary;
//   Pagination? pagination;
//   List<Data>? data;
//
//   StockListModel(
//       {this.title,
//         this.subtitle,
//         this.stockSummary,
//         this.pagination,
//         this.data});
//
//   StockListModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     subtitle = json['subtitle'];
//     stockSummary = json['stock_summary'] != null
//         ? new StockSummary.fromJson(json['stock_summary'])
//         : null;
//     pagination = json['pagination'] != null
//         ? new Pagination.fromJson(json['pagination'])
//         : null;
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['subtitle'] = this.subtitle;
//     if (this.stockSummary != null) {
//       data['stock_summary'] = this.stockSummary!.toJson();
//     }
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class StockSummary {
//   dynamic title;
//   dynamic totalStock;
//   dynamic totalStockFormatted;
//   dynamic unit;
//
//   StockSummary(
//       {this.title, this.totalStock, this.totalStockFormatted, this.unit});
//
//   StockSummary.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     totalStock = json['total_stock'];
//     totalStockFormatted = json['total_stock_formatted'];
//     unit = json['unit'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['total_stock'] = this.totalStock;
//     data['total_stock_formatted'] = this.totalStockFormatted;
//     data['unit'] = this.unit;
//     return data;
//   }
// }
//
// class Pagination {
//   dynamic total;
//   dynamic page;
//   dynamic limit;
//   dynamic totalPages;
//   dynamic hasNextPage;
//   dynamic hasPrevPage;
//
//   Pagination(
//       {this.total,
//         this.page,
//         this.limit,
//         this.totalPages,
//         this.hasNextPage,
//         this.hasPrevPage});
//
//   Pagination.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     page = json['page'];
//     limit = json['limit'];
//     totalPages = json['totalPages'];
//     hasNextPage = json['hasNextPage'];
//     hasPrevPage = json['hasPrevPage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['page'] = this.page;
//     data['limit'] = this.limit;
//     data['totalPages'] = this.totalPages;
//     data['hasNextPage'] = this.hasNextPage;
//     data['hasPrevPage'] = this.hasPrevPage;
//     return data;
//   }
// }
//
// class Data {
//   dynamic id;
//   dynamic name;
//   dynamic sku;
//   dynamic category;
//   dynamic dimensions;
//   dynamic pricePerUnit;
//   dynamic stockQuantity;
//   dynamic description;
//   dynamic isActive;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic colour;
//   dynamic productType;
//   dynamic lengthMm;
//   dynamic widthMm;
//   dynamic heightMm;
//   dynamic costPrice;
//   dynamic sellingPrice;
//   dynamic minStockAlert;
//   dynamic totalProduction;
//   dynamic totalDispatched;
//   dynamic totalSold;
//   dynamic categoryId;
//   dynamic imageUrl;
//   dynamic stockStatus;
//   dynamic currentStockValue;
//
//   Data(
//       {this.id,
//         this.name,
//         this.sku,
//         this.category,
//         this.dimensions,
//         this.pricePerUnit,
//         this.stockQuantity,
//         this.description,
//         this.isActive,
//         this.createdAt,
//         this.updatedAt,
//         this.colour,
//         this.productType,
//         this.lengthMm,
//         this.widthMm,
//         this.heightMm,
//         this.costPrice,
//         this.sellingPrice,
//         this.minStockAlert,
//         this.totalProduction,
//         this.totalDispatched,
//         this.totalSold,
//         this.categoryId,
//         this.imageUrl,
//         this.stockStatus,
//         this.currentStockValue});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     sku = json['sku'];
//     category = json['category'];
//     dimensions = json['dimensions'];
//     pricePerUnit = json['price_per_unit'];
//     stockQuantity = json['stock_quantity'];
//     description = json['description'];
//     isActive = json['is_active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     colour = json['colour'];
//     productType = json['product_type'];
//     lengthMm = json['length_mm'];
//     widthMm = json['width_mm'];
//     heightMm = json['height_mm'];
//     costPrice = json['cost_price'];
//     sellingPrice = json['selling_price'];
//     minStockAlert = json['min_stock_alert'];
//     totalProduction = json['total_production'];
//     totalDispatched = json['total_dispatched'];
//     totalSold = json['total_sold'];
//     categoryId = json['category_id'];
//     imageUrl = json['image_url'];
//     stockStatus = json['stock_status'];
//     currentStockValue = json['current_stock_value'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['sku'] = this.sku;
//     data['category'] = this.category;
//     data['dimensions'] = this.dimensions;
//     data['price_per_unit'] = this.pricePerUnit;
//     data['stock_quantity'] = this.stockQuantity;
//     data['description'] = this.description;
//     data['is_active'] = this.isActive;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['colour'] = this.colour;
//     data['product_type'] = this.productType;
//     data['length_mm'] = this.lengthMm;
//     data['width_mm'] = this.widthMm;
//     data['height_mm'] = this.heightMm;
//     data['cost_price'] = this.costPrice;
//     data['selling_price'] = this.sellingPrice;
//     data['min_stock_alert'] = this.minStockAlert;
//     data['total_production'] = this.totalProduction;
//     data['total_dispatched'] = this.totalDispatched;
//     data['total_sold'] = this.totalSold;
//     data['category_id'] = this.categoryId;
//     data['image_url'] = this.imageUrl;
//     data['stock_status'] = this.stockStatus;
//     data['current_stock_value'] = this.currentStockValue;
//     return data;
//   }
// }

class StockListModel {
  dynamic title;
  dynamic subtitle;
  StockSummary? stockSummary;
  dynamic count;
  List<Data>? data;

  StockListModel(
      {this.title, this.subtitle, this.stockSummary, this.count, this.data});

  StockListModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    stockSummary = json['stock_summary'] != null
        ? StockSummary.fromJson(json['stock_summary'])
        : null;
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    if (stockSummary != null) {
      data['stock_summary'] = stockSummary!.toJson();
    }
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockSummary {
  dynamic title;
  dynamic totalStock;
  dynamic totalStockFormatted;
  dynamic unit;

  StockSummary(
      {this.title, this.totalStock, this.totalStockFormatted, this.unit});

  StockSummary.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalStock = json['total_stock'];
    totalStockFormatted = json['total_stock_formatted'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['total_stock'] = totalStock;
    data['total_stock_formatted'] = totalStockFormatted;
    data['unit'] = unit;
    return data;
  }
}

class Data {
  dynamic id;
  dynamic name;
  dynamic sku;
  dynamic category;
  dynamic dimensions;
  dynamic pricePerUnit;
  dynamic stockQuantity;
  dynamic description;
  dynamic isActive;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic colour;
  dynamic productType;
  dynamic lengthMm;
  dynamic widthMm;
  dynamic heightMm;
  dynamic costPrice;
  dynamic sellingPrice;
  dynamic minStockAlert;
  dynamic totalProduction;
  dynamic totalDispatched;
  dynamic totalSold;
  dynamic categoryId;
  dynamic imageUrl;
  dynamic stockStatus;
  dynamic currentStockValue;

  Data(
      {this.id,
        this.name,
        this.sku,
        this.category,
        this.dimensions,
        this.pricePerUnit,
        this.stockQuantity,
        this.description,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.colour,
        this.productType,
        this.lengthMm,
        this.widthMm,
        this.heightMm,
        this.costPrice,
        this.sellingPrice,
        this.minStockAlert,
        this.totalProduction,
        this.totalDispatched,
        this.totalSold,
        this.categoryId,
        this.imageUrl,
        this.stockStatus,
        this.currentStockValue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    category = json['category'];
    dimensions = json['dimensions'];
    pricePerUnit = json['price_per_unit'];
    stockQuantity = json['stock_quantity'];
    description = json['description'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    colour = json['colour'];
    productType = json['product_type'];
    lengthMm = json['length_mm'];
    widthMm = json['width_mm'];
    heightMm = json['height_mm'];
    costPrice = json['cost_price'];
    sellingPrice = json['selling_price'];
    minStockAlert = json['min_stock_alert'];
    totalProduction = json['total_production'];
    totalDispatched = json['total_dispatched'];
    totalSold = json['total_sold'];
    categoryId = json['category_id'];
    imageUrl = json['image_url'];
    stockStatus = json['stock_status'];
    currentStockValue = json['current_stock_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['category'] = category;
    data['dimensions'] = dimensions;
    data['price_per_unit'] = pricePerUnit;
    data['stock_quantity'] = stockQuantity;
    data['description'] = description;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['colour'] = colour;
    data['product_type'] = productType;
    data['length_mm'] = lengthMm;
    data['width_mm'] = widthMm;
    data['height_mm'] = heightMm;
    data['cost_price'] = costPrice;
    data['selling_price'] = sellingPrice;
    data['min_stock_alert'] = minStockAlert;
    data['total_production'] = totalProduction;
    data['total_dispatched'] = totalDispatched;
    data['total_sold'] = totalSold;
    data['category_id'] = categoryId;
    data['image_url'] = imageUrl;
    data['stock_status'] = stockStatus;
    data['current_stock_value'] = currentStockValue;
    return data;
  }
}
