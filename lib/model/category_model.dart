
class CategoryModel {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic isActive;
  dynamic createdAt;
  dynamic updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}