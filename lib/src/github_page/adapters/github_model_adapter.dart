import 'package:flutter_playground/src/github_page/model/repository_model.dart';
import 'package:intl/intl.dart';

class GithubModelAdapter {
  RepositoryModel fromJson(Map<String, dynamic> json) {
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    return RepositoryModel(
      stars: json['stargazers_count'],
      url: json['git_url'],
      createdAt: dateFormatter.parse(json['created_at']).toString(),
      updatedAt: dateFormatter.parse(json['updated_at']).toString(),
      defaultBranch: json['default_branch'],
      name: json['name'],
      language: json['language'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson(RepositoryModel model) => {
        'name': model.name,
        'description': model.description,
        'language': model.language,
        'stargazers_count': model.stars,
        'create_at': model.createdAt,
        'updated_at': model.updatedAt,
        'default_branch': model.defaultBranch,
        'git_url': model.url
      };
}
