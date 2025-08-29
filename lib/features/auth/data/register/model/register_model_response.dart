class RegisterResponse {
  dynamic message;
  UserResponse? data;
  int? statusCode;

  RegisterResponse({this.message, this.data, this.statusCode});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    // data = json['data'] != null ? UserResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {}; //new Map<String, dynamic>()
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserResponse {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserResponse({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {}; //new Map<String, dynamic>()
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['phone'] = phone;
    data['avaterId'] = avaterId;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
