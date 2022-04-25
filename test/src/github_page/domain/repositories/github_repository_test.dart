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
  late RemoteDataSourceMock remoteDataSourceMock;
  late LocalDataSourceMock localDataSourceMock;
  late CheckConnectivityServiceMock checkConnectivityServiceMock;

  setUp(() {
    remoteDataSourceMock = RemoteDataSourceMock();
    localDataSourceMock = LocalDataSourceMock();
    checkConnectivityServiceMock = CheckConnectivityServiceMock();
  });

  test(
      'GIVEN internet is connected WHEN remote datasource get model THEN check its values',
      () async {
    //Given
    when(() => checkConnectivityServiceMock.isConnected()).thenAnswer(
      (_) => Future.value(true),
    );
    when(() => remoteDataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(repositoryListMock),
    );
    when(() => remoteDataSourceMock.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await remoteDataSourceMock.getModels();

    //Then
    expect(models, repositoryListMock);
  });

  test(
      'GIVEN internet is not connected WHEN local datasource get model THEN check its values',
      () async {
    //Given
    when(() => checkConnectivityServiceMock.isConnected()).thenAnswer(
      (_) => Future.value(false),
    );
    when(() => localDataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(repositoryListMock),
    );
    when(() => remoteDataSourceMock.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await localDataSourceMock.getModels();

    expect(models, repositoryListMock);
  });

  test(
      'GIVEN internet is connected WHEN remote datasource get null model value THEN check its values',
      () async {
    //Given
    when(() => checkConnectivityServiceMock.isConnected()).thenAnswer(
      (_) => Future.value(true),
    );
    when(() => localDataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(null),
    );
    when(() => remoteDataSourceMock.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await localDataSourceMock.getModels();

    //Then
    expect(models, null);
  });

  test(
      'GIVEN internet is not connected and shared preferences has no model saved WHEN get models THEN answers null',
      () async {
    //Given
    when(() => checkConnectivityServiceMock.isConnected()).thenAnswer(
      (_) => Future.value(false),
    );
    when(() => localDataSourceMock.getModels()).thenAnswer(
      (_) => Future.value(),
    );
    when(() => remoteDataSourceMock.saveModels(repositoryListMock)).thenAnswer(
      (_) => Future.value(),
    );

    //When
    var models = await localDataSourceMock.getModels();

    expect(models, null);
  });
}
