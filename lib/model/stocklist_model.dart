
class StocklistModel {
  dynamic id;
  dynamic name;
  dynamic sku;
  dynamic category;
  dynamic dimensions;
  dynamic price_per_unit;
  dynamic stock_quantity;
  dynamic description;
  dynamic is_active;
  dynamic created_at;
  dynamic updated_at;
  dynamic colour;
  dynamic product_type;
  dynamic length_mm;
  dynamic width_mm;
  dynamic height_mm;
  dynamic cost_price;
  dynamic selling_price;
  dynamic min_stock_alert;
  dynamic total_production;
  dynamic total_dispatched;
  dynamic total_sold;
  dynamic image_url;
  dynamic category_id;
  dynamic stock_status;
  dynamic current_stock_value;
  dynamic images;

  StocklistModel({
    this.id,
    this.name,
    this.sku,
    this.category,
    this.dimensions,
    this.price_per_unit,
    this.stock_quantity,
    this.description,
    this.is_active,
    this.created_at,
    this.updated_at,
    this.colour,
    this.product_type,
    this.length_mm,
    this.width_mm,
    this.height_mm,
    this.cost_price,
    this.selling_price,
    this.min_stock_alert,
    this.total_production,
    this.total_dispatched,
    this.total_sold,
    this.image_url,
    this.category_id,
    this.stock_status,
    this.current_stock_value,
    this.images,
  });

  StocklistModel.fromJson(Map<String, dynamic> json) {
    print("datahimashu${json}");
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    category = json['category'];
    dimensions = json['dimensions'];
    price_per_unit = json['price_per_unit'];
    stock_quantity = json['stock_quantity'];
    description = json['description'];
    is_active = json['is_active'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    colour = json['colour'];
    product_type = json['product_type'];
    length_mm = json['length_mm'];
    width_mm = json['width_mm'];
    height_mm = json['height_mm'];
    cost_price = json['cost_price'];
    selling_price = json['selling_price'];
    min_stock_alert = json['min_stock_alert'];
    total_production = json['total_production'];
    total_dispatched = json['total_dispatched'];
    total_sold = json['total_sold'];
    image_url = json['image_url'];
    category_id = json['category_id'];
    stock_status = json['stock_status'];
    current_stock_value = json['current_stock_value'];
    images = json['images'];
  }

  String get image {
    String? url;
    if (image_url != null && image_url.toString().trim().isNotEmpty) {
      url = image_url.toString().trim();
    } else if (images != null) {
      if (images is String && images.toString().trim().isNotEmpty) {
        url = images.toString().trim();
      } else if (images is List && (images as List).isNotEmpty) {
        final first = (images as List).first;
        if (first is String && first.trim().isNotEmpty) {
          url = first.trim();
        } else if (first is Map) {
          final imgUrl = first['image_url'] ?? first['url'] ?? first['path'];
          if (imgUrl != null && imgUrl.toString().trim().isNotEmpty) {
            url = imgUrl.toString().trim();
          }
        }
      }
    }

    if (url == null || url.isEmpty) {
      return 'assets/bricks.jpg';
    }

    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url;
    }

    if (url.startsWith('assets/')) {
      return url;
    }

    if (!url.startsWith('/')) {
      url = '/$url';
    }
    return 'https://mahindrabricks.fcsocket.site$url';
  }
  String get size => dimensions?.toString() ?? '';
  String get code => sku?.toString() ?? '';
  String get price => selling_price?.toString() ?? price_per_unit?.toString() ?? '';
  String get stockStatus => stock_status?.toString() ?? 'In Stock';
}