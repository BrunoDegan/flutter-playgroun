import 'package:flutter_playground/src/about_page/domain/datasource/about_remote_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/about_page_mock.dart';

class RemoteDataSourceMock extends Mock implements AboutRemoteDataSource {}

main() {
  late RemoteDataSourceMock remoteDatasourceMock;

  setUp(() {
    remoteDatasourceMock = RemoteDataSourceMock();
  });

  test(
    'GIVEN valid about model WHEN remote fetchs model on server THEN answer with model',
    () async {
      //Given
      when(() => remoteDatasourceMock.getModel())
          .thenAnswer((_) => Future.value(modelMock));

      //When
      AboutModel? expectedModel = await remoteDatasourceMock.getModel();

      //Then
      expect(modelMock, expectedModel);
    },
  );

test(
    'GIVEN null about model WHEN fetching remote fails THEN answer with null value',
    () async {
      //Given
      when(() => remoteDatasourceMock.getModel())
          .thenAnswer((_) => Future.value(null));

      //When
      AboutModel? expectedModel = await remoteDatasourceMock.getModel();

      //Then
      expect(null, expectedModel);
    },
  );

}
