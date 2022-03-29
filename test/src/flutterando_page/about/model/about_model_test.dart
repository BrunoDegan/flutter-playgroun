import 'package:flutter/foundation.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/about_page_mock.dart';


main() {
  late Map<String, dynamic> jsonModel;

  setUp(() {
    jsonModel = modelMock.toJson();
  });

  test('GIVEN description WHEN fromJson is called THEN convert to data model',
      () {
    var convertedModel = AboutModel.fromJson(jsonModel);

    expect(convertedModel.description, equals(modelMock.description));
  });

  test(
      'GIVEN user image path WHEN fromJson is called THEN convert to data model',
      () {
    var convertedModel = AboutModel.fromJson(jsonModel);

    expect(convertedModel.userImagePath, equals(modelMock.userImagePath));
  });

  test('GIVEN user name WHEN fromJson is called THEN convert to data model',
      () {
    var convertedModel = AboutModel.fromJson(jsonModel);

    expect(convertedModel.userName, equals(modelMock.userName));
  });

  test('GIVEN user skills WHEN fromJson is called THEN convert to data model',
      () {
    var convertedModel = AboutModel.fromJson(jsonModel);

    expect(true, listEquals(convertedModel.skills, modelMock.skills));
  });

  test('GIVEN favorites WHEN fromJson is called THEN convert to data model',
      () {
    var convertedModel = AboutModel.fromJson(jsonModel);

    expect(true, listEquals(convertedModel.favorites, modelMock.favorites));
  });
}
