import 'package:flutter_playground/src/github_page/domain/repositories/github_repository_interface.dart';
import 'package:flutter_playground/src/github_page/domain/usecases/fetch_github_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/github_repositories_page_mock.dart';

class GithubRepositoryMock extends Mock implements IGithubRepository {}

void main() {
  late GithubRepositoryMock repositoryMock;
  late IFetchGithubDataUsecase useCase;

  setUp(() {
    repositoryMock = GithubRepositoryMock();
    useCase = FetchGitbubDataUsecase(repositoryMock);
  });

  test(
      'GIVEN repository answers valid model WHEN fetch data use case THEN expect same values',
      () async {
    //Given
    when(() => repositoryMock.getModels()).thenAnswer(
      (_) => Future.value(repositoryListMock),
    );

    //When
    var models = await useCase.call();

    //Then
    expect(models, repositoryListMock);
  });

  test(
      'GIVEN repository answers null value WHEN fetch data use case THEN answers null',
      () async {
    //Given
    when(() => repositoryMock.getModels()).thenAnswer(
      (_) => Future.value(null),
    );

    //When
    var models = await useCase.call();

    //Then
    expect(models, null);
  });

  test(
      'GIVEN repository answers error WHEN fetch data use case THEN expect catch error',
      () async {
    //Given
    when(() => repositoryMock.getModels()).thenAnswer(
      (_) => Future.error('error'),
    );

    //When/ Then
    await useCase.call().catchError((onError) {
      expect('error', onError);
    });
  });
}
