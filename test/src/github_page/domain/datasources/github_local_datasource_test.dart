import 'package:flutter_playground/src/github_page/domain/datasources/github_local_datasource.dart';
import 'package:flutter_playground/src/github_page/domain/model/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/github_repositories_page_mock.dart';

class GithubLocalDataSourceMock extends Mock implements GithubLocalDataSource {}

void main() {
  late GithubLocalDataSourceMock dataSourceMock;

  setUp(() {
    dataSourceMock = GithubLocalDataSourceMock();
  });

  test(
      'GIVEN getModels answer with repository list model WHEN data source get models THEN answer with correct response',
      () async {
    //Given;
    when(() => dataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(
        repositoryListMock,
      ),
    );

    //When
    List<RepositoryModel>? repositoryListResponse =
        await dataSourceMock.getModels();

    expect(repositoryListResponse, repositoryListMock);
  });

  test(
      'GIVEN getModels answer with null WHEN data source get models THEN answer null',
      () async {
    //Given
    when(() => dataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(
        null,
      ),
    );

    //When
    List<RepositoryModel>? repositoryListResponse =
        await dataSourceMock.getModels();

    expect(repositoryListResponse, null);
  });

  test(
      'GIVEN getModels answer error WHEN data source get models THEN answer with null value',
      () async {
    //Given
    when(() => dataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(
        null,
      ),
    );

    //When
    List<RepositoryModel>? repositoryListResponse =
        await dataSourceMock.getModels();

    expect(repositoryListResponse, null);
  });
}
