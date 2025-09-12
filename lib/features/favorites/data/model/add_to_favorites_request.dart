class AddToFavoritesRequest {
  String? movieId;
  String? name;
  double? rating;
  String? imageURL;
  String? year;

  AddToFavoritesRequest({this.movieId, this.name, this.rating, this.imageURL, this.year});

  AddToFavoritesRequest.fromJson(Map<String, dynamic> json) {
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
