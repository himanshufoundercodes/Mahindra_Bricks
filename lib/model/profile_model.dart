class ProfileModel {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic role;
  dynamic status;
  dynamic profileImage;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic lastLoginAt;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.status,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.lastLoginAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      status: json['status'],
      profileImage: json['profile_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lastLoginAt: json['last_login_at'],
    );
  }
}

