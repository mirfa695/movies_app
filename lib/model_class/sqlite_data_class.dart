class SqliteData {
  int? id;
  String? title;
  String? overview;
  String? posterPath;

  SqliteData({this.id, this.title, this.overview, this.posterPath});

  SqliteData.fromMap(Map<String, dynamic> res) {
    id = res['id'];
    title = res['title'];
    overview = res['overview'];
    posterPath = res['posterPath'];
  }

  Map<String, dynamic> toMap() {
    return{
      'id':id,
    'title' :title,
    'overview' :overview,
    'posterPath' : posterPath
  };
  }
}