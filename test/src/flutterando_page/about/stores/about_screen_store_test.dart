import 'package:flutter_playground/src/flutterando_page/about/repositories/about_repository.dart';
import 'package:flutter_playground/src/flutterando_page/about/store/about_screen_store.dart';
import 'package:flutter_playground/src/flutterando_page/states/about_page_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/about_page_mock.dart';

class AboutRepositoryMock extends Mock implements AboutRepository {}

/// Mocks a callback function on which you can use verify

main() {
  late AboutPageStore store;
  late AboutRepositoryMock repositoryMock;

  setUp(() {
    repositoryMock = AboutRepositoryMock();
    store = AboutPageStore(repository: repositoryMock);
  });

  test(
      'GIVEN repository getModel answer Loading WHEN fetch about screen model THEN store value is LoadingState',
      () async {
    //Given
    when(() => repositoryMock.getModel())
        .thenAnswer((_) async => LoadingState());

    //When
    await store.fetchAboutScreenModel();

    //Then
    expect(store.value, isA<LoadingState>());
  });

  test(
      'GIVEN repository getModel answer SuccessState WHEN fetch about screen model THEN store value is SuccessState',
      () async {
    //Given
    when(() => repositoryMock.getModel())
        .thenAnswer((_) async => SuccessState(modelMock));

    //When
    await store.fetchAboutScreenModel();

    //Then
    expect(store.value, isA<SuccessState>());
  });

  test(
      'GIVEN repository getModel answer ErrorState WHEN fetch about screen model THEN store value is ErrorState',
      () async {
    //Given
    when(() => repositoryMock.getModel())
        .thenAnswer((_) async => ErrorState(''));

    //When
    await store.fetchAboutScreenModel();

    //Then
    expect(store.value, isA<ErrorState>());
  });
}
