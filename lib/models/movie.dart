class Movie {
  int? id;
  String? title;
  double? voteAverage;
  String? overview;
  String? posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> paserdJson) {
    id = paserdJson['id'];
    title = paserdJson['title'];
    voteAverage = paserdJson['voteAverage'];
    overview = paserdJson['overview'];
    posterPath = paserdJson['poster_path'];
  }
}
