import 'package:flutter_playground/src/github_page/domain/model/repository_model.dart';

final repositoriesModelMock = RepositoryModel(
  name: 'Repository test name',
  description: 'lorem ipsu, lorem ipsum, loren ipsum',
  language: 'Dart',
  createdAt: '20-03-2018',
  defaultBranch: 'develop',
  stars: 5,
  url: 'lorem ipsum lorem ipsum',
  updatedAt: '20-03-2018',
);

final repositoryModelJson = {
  'name': 'Repository test name',
  'description': 'lorem ipsu, lorem ipsum, loren ipsum',
  'language': 'Dart',
  'created_at': '2018-03-20T00:00:00Z',
  'default_branch': 'develop',
  'stargazers_count': 5,
  'git_url': 'lorem ipsum lorem ipsum',
  'updated_at': '2018-03-20T00:00:00Z'
};

final repositoryListMock = [
  repositoriesModelMock,
  repositoriesModelMock,
  repositoriesModelMock,
  repositoriesModelMock
];
