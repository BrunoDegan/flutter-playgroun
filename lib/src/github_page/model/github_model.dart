import 'package:intl/intl.dart';

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

  GithubModel(int stars, String createdAt, String updatedAt, String mainBranch,
      String url,
      {required String name,
      required String language,
      required String description}) {
    _name = name;
    _language = language;
    _stars = stars;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _defaultBranch = mainBranch;
    _description = description;
    _url = url;
  }

  GithubModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _description = json['description'];
    _language = json['language'];
    _stars = json['stargazers_count'];
    _url = json['git_url'];

    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');

    _createdAt = dateFormatter.parse(json['created_at']).toString();
    _updatedAt = dateFormatter.parse(json['updated_at']).toString();
    _defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() => {
        'name': _name,
        'description': _description,
        'language': _language,
        'stargazers_count': _stars,
        'create_at': _createdAt,
        'updated_at': _updatedAt,
        'default_branch': _defaultBranch,
        'git_url': _url
      };
}
