class LoginResponse {
  dynamic message;
  String? error;
  int? statusCode;
  String? data;

  LoginResponse({this.message, this.error, this.statusCode, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['error'] = error;
    data['statusCode'] = statusCode;
    data['data'] = data;
    return data;
  }
}
