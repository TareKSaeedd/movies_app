class LoginModel {
  final String message;
  final String token;

  LoginModel({
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] ?? '',
      token: json['data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': token,
    };
  }
}
