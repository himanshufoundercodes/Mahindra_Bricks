class LoginModel {
  final int id;
  final String email;
  final String password;
  final String accessToken;
  final dynamic message;

  LoginModel({
    required this.id,
    required this.email,
    required this.accessToken,
    required this.password,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      accessToken: json['token'] ?? '',
      message:  json['message']??''
    );
  }
}
