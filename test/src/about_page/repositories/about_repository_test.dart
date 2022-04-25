import 'package:flutter_playground/src/about_page/domain/datasource/about_local_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/datasource/about_remote_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/repositories/about_repository.dart';
import 'package:flutter_playground/src/about_page/states/about_page_state.dart';
import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/about_page_mock.dart';

class RemoteDataSourceMock extends Mock implements AboutRemoteDataSource {}

class CheckConnectivityServiceMock extends Mock
    implements CheckConnectivityService {}

class LocalDataSourceMock extends Mock implements AboutLocalDataSource {}

main() {
  late RemoteDataSourceMock remoteDatasourceMock;
  late LocalDataSourceMock localDataSourceMock;
  late CheckConnectivityServiceMock checkConnectivityMock;
  late AboutRepository repository;

  setUp(() {
    localDataSourceMock = LocalDataSourceMock();
    remoteDatasourceMock = RemoteDataSourceMock();
    checkConnectivityMock = CheckConnectivityServiceMock();
    repository = AboutRepository(
     remoteDataSource: remoteDatasourceMock,
      localDataSource: localDataSourceMock,
      connectivityService: checkConnectivityMock,
    );
  });

  test(
      'GIVEN user device is connected and local datasource answer with null model value WHEN get model THEN retrieve Success State',
      () async {
    //Given
    when(() => checkConnectivityMock.isConnected())
        .thenAnswer((_) => Future.value(true));
    when(() => remoteDatasourceMock.getModel())
        .thenAnswer((_) => Future.value(modelMock));
    when(() => localDataSourceMock.saveModel(modelMock))
        .thenAnswer((_) => Future.value(null));

    //When
    var pageState = await repository.getModel();

    //Then
    expect(pageState, isA<SuccessState>());
  });

  test(
      'GIVEN user device local datasource answer with null model value and is NOT connected WHEN get model THEN retrieve Error State',
      () async {
    //Given
    when(() => checkConnectivityMock.isConnected())
        .thenAnswer((_) => Future.value(false));
    when(() => localDataSourceMock.getModel())
        .thenAnswer((_) => Future.value(null));

    //When
    var pageState = await repository.getModel();

    //Then
    expect(pageState, isA<ErrorState>());
  });

  test(
      'GIVEN user device is connected and remote datasource answer with null model value WHEN get model THEN retrieve Error State',
      () async {
    //Given
    when(() => checkConnectivityMock.isConnected())
        .thenAnswer((_) => Future.value(true));
    when(() => remoteDatasourceMock.getModel())
        .thenAnswer((_) => Future.value(null));

    //When
    var pageState = await repository.getModel();

    //Then
    expect(pageState, isA<ErrorState>());
  });

  test(
      'GIVEN user device is not connected and local datasource answer with model value WHEN get model THEN retrieve Success State',
      () async {
    //Given
    when(() => checkConnectivityMock.isConnected())
        .thenAnswer((_) => Future.value(false));
    when(() => localDataSourceMock.getModel())
        .thenAnswer((_) => Future.value(modelMock));

    //When
    var pageState = await repository.getModel();

    //Then
    expect(pageState, isA<SuccessState>());
  });
}
