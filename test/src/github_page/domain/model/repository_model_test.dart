import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/domain/model/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/github_repositories_page_mock.dart';

void main() {
  late Map<String, dynamic> jsonModel;
  late RepositoryModel model;
  late GithubModelAdapter adapter;

  setUp(() {
    adapter = GithubModelAdapter();
    jsonModel = adapter.toJson(repositoriesModelMock);
    model = adapter.fromJson(repositoryModelJson);
  });

  test(
      'GIVEN data model mock WHEN fromJson is called THEN convert correctly to data model',
      () {
    expect(model.url, equals(repositoriesModelMock.url));
    expect(model.stars, equals(repositoriesModelMock.stars));
    expect('20-03-2018', equals(repositoriesModelMock.createdAt));
    expect('20-03-2018', equals(repositoriesModelMock.updatedAt));
    expect(model.defaultBranch, equals(repositoriesModelMock.defaultBranch));
    expect(model.name, equals(repositoriesModelMock.name));
    expect(model.language, equals(repositoriesModelMock.language));
    expect(model.description, equals(repositoriesModelMock.description));
  });

  test(
      'GIVEN json model mock WHEN toJson is called THEN convert correctly to json model',
      () {
    expect(jsonModel['url'], equals(repositoryModelJson['url']));
    expect(jsonModel['stars'], equals(repositoryModelJson['stars']));
    expect(jsonModel['createdAt'], equals(repositoryModelJson['createdAt']));
    expect(jsonModel['updatedAt'], equals(repositoryModelJson['updatedAt']));
    expect(jsonModel['defaultBranch'],
        equals(repositoryModelJson['defaultBranch']));
    expect(jsonModel['name'], equals(repositoryModelJson['name']));
    expect(jsonModel['language'], equals(repositoryModelJson['language']));
    expect(
        jsonModel['description'], equals(repositoryModelJson['description']));
  });
}
