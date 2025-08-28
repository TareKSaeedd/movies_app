class UpdateProfileResponse {
  String? message;

  UpdateProfileResponse({this.message});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}