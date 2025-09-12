class FavoritesModel {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  FavoritesModel({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      movieId: json['movieId'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
      year: json['year'] as String,
    );
  }
}
