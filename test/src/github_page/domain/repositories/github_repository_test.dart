import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/github_page/domain/datasources/github_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/github_repositories_page_mock.dart';

class LocalDataSourceMock extends Mock implements GithubRemoteDataSource {}

class CheckConnectivityServiceMock extends Mock
    implements CheckConnectivityService {}

class RemoteDataSourceMock extends Mock implements GithubRemoteDataSource {}

void main() {
  late RemoteDataSourceMock remoteDataSource;
  late LocalDataSourceMock localDataSource;
  late CheckConnectivityServiceMock checkConnectivityService;

  setUp(() {
    remoteDataSource = RemoteDataSourceMock();
    localDataSource = LocalDataSourceMock();
    checkConnectivityService = CheckConnectivityServiceMock();
  });

  test(
      'GIVEN internet is connected WHEN remote datasource get model THEN check its values',
      () async {
    //Given
    when(() => checkConnectivityService.isConnected()).thenAnswer(
      (_) => Future.value(true),
    );
    when(() => remoteDataSource.getModels()).thenAnswer(
      (_) => Future.value(repositoryListMock),
    );
    when(() => remoteDataSource.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await remoteDataSource.getModels();

    //Then
    expect(models, repositoryListMock);
  });

  test(
      'GIVEN internet is not connected WHEN local datasource get model THEN check its values',
      () async {
    //Given
    when(() => checkConnectivityService.isConnected()).thenAnswer(
      (_) => Future.value(false),
    );
    when(() => localDataSource.getModels()).thenAnswer(
      (_) => Future.value(repositoryListMock),
    );
    when(() => remoteDataSource.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await localDataSource.getModels();

    expect(models, repositoryListMock);
  });

  test(
      'GIVEN internet is connected WHEN remote datasource get null model value THEN check its values',
      () async {
    //Given
    when(() => checkConnectivityService.isConnected()).thenAnswer(
      (_) => Future.value(true),
    );
    when(() => localDataSource.getModels()).thenAnswer(
      (_) => Future.value(null),
    );
    when(() => remoteDataSource.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await localDataSource.getModels();

    //Then
    expect(models, null);
  });

  test(
      'GIVEN internet is not connected and shared preferences has no model saved WHEN get models THEN answers null',
      () async {
    //Given
    when(() => checkConnectivityService.isConnected()).thenAnswer(
      (_) => Future.value(false),
    );
    when(() => localDataSource.getModels()).thenAnswer(
      (_) => Future.value(),
    );
    when(() => remoteDataSource.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await localDataSource.getModels();

    expect(models, null);
  });
}
