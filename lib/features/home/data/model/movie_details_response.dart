class MovieDetailsResponse {
  MovieDetailsResponse({
    this.status,
    this.statusMessage,
    this.movie,
    this.meta, required data,
  });

  MovieDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    movie = json['data'] != null && json['data']['movie'] != null
        ? Movie.fromJson(json['data']['movie'])
        : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  String? status;
  String? statusMessage;
  Movie? movie;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }
}

class Movie {
  Movie({
    this.id,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.descriptionFull,
    this.language,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.backgroundImageOriginal,
    this.ytTrailerCode,
    this.screenshots,
  });

  Movie.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    rating = (json['rating'] != null) ? (json['rating'] as num).toDouble() : null;
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    descriptionFull = json['description_full'];
    language = json['language'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    backgroundImageOriginal = json['background_image_original'];
    ytTrailerCode = json['yt_trailer_code'];
    screenshots = json['screenshots'] != null
        ? List<String>.from(json['screenshots'])
        : null;
  }

  int? id;
  String? title;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? descriptionFull;
  String? language;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? backgroundImageOriginal;
  String? ytTrailerCode;
  List<String>? screenshots;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['description_full'] = descriptionFull;
    map['language'] = language;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['yt_trailer_code'] = ytTrailerCode;
    map['screenshots'] = screenshots;
    return map;
  }
}

class Meta {
  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  Meta.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = serverTime;
    map['server_timezone'] = serverTimezone;
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }
}
