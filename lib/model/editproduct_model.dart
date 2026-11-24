class EditProductModel {
  String? message;
  EditProductData? data;

  EditProductModel({
    this.message,
    this.data,
  });

  EditProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null
        ? EditProductData.fromJson(json['data'])
        : null;
  }
}

class EditProductData {
  int? id;
  int? productId;
  String? name;
  String? sku;
  String? category;
  String? pricePerUnit;
  int? stockQuantity;
  String? sellingPrice;
  String? costPrice;
  String? colour;
  String? productType;
  int? categoryId;
  String? imageUrl;
  String? stockStatus;

  EditProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    sku = json['sku'];
    category = json['category'];
    pricePerUnit = json['price_per_unit'];
    stockQuantity = json['stock_quantity'];
    sellingPrice = json['selling_price'];
    costPrice = json['cost_price'];
    colour = json['colour'];
    productType = json['product_type'];
    categoryId = json['category_id'];
    imageUrl = json['image_url'];
    stockStatus = json['stock_status'];
  }
}