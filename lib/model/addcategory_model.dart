class AddCategoryModel {
  final int id;
  final String name;
  final String description;
  final String isActive;
  final String accessToken;
  final String created_at;
  final String updated_at;

  AddCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
    required this.accessToken,
    required this.created_at,
    required this.updated_at,
  });

  factory AddCategoryModel.fromJson(Map<String, dynamic> json) {
    return AddCategoryModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        isActive: json['is_Active'] ?? '',
        accessToken: json['token'] ?? '',
        created_at: json['created_at'] ?? '',
        updated_at: json['updated_at'] ?? '',
    );
  }
}
