class GithubModel {
  late String _name;
  late String _language;
  late String _description;
  int? _stars;
  String? _createdAt;
  String? _updatedAt;
  String? _defaultBranch;
  String? _url;

  String get name => _name;
  String get language => _language;
  String get description => _description;
  int? get stars => _stars;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get defaultBranch => _defaultBranch;
  String? get url => _url;

  GithubModel(
      {int? stars,
      String? createdAt,
      String? updatedAt,
      String? defaultBranch,
      String? url,
      required String name,
      required String language,
      required String description}) {
    _name = name;
    _language = language;
    _stars = stars;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _defaultBranch = defaultBranch;
    _description = description;
    _url = url;
  }
}
