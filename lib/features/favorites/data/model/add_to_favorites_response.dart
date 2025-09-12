class AddToFavoritesResponse {
  String? message;
  Data? data;

  AddToFavoritesResponse({this.message, this.data});

  AddToFavoritesResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? movieId;
  String? name;
  double? rating;
  String? imageURL;
  String? year;

  Data({this.movieId, this.name, this.rating, this.imageURL, this.year});

  Data.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['movieId'] = movieId;
    data['name'] = name;
    data['rating'] = rating;
    data['imageURL'] = imageURL;
    data['year'] = year;
    return data;
  }
}
