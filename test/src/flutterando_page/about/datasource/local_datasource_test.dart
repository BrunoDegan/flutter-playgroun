import 'package:flutter_playground/src/flutterando_page/about/datasource/about_local_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/about_page_mock.dart';

class LocalDataSourceMock extends Mock implements AboutLocalDataSource {}

void main() {
  late LocalDataSourceMock dataSourceMock;

  setUp(() {
    SharedPreferences.setMockInitialValues(jsonResponse);
    dataSourceMock = LocalDataSourceMock();
  });

  test(
    'GIVEN valid about model WHEN save model on SharedPreferences THEN answer with valid value',
    () async {
      //Given
      when(() => dataSourceMock.getModel()).thenAnswer(
        (_) => Future.value(modelMock),
      );

      //When
      AboutModel? recoveredModel = await dataSourceMock.getModel();

      //Then
      expect(modelMock, recoveredModel);
    },
  );

  test(
    'GIVEN null about model WHEN save model on SharedPreferences THEN answer with null value',
    () async {
      //Given
      when(() => dataSourceMock.getModel()).thenAnswer(
        (_) => Future.value(null),
      );

      //When
      AboutModel? recoveredModel = await dataSourceMock.getModel();

      //Then
      expect(null, recoveredModel);
    },
  );
}
