import 'package:flutter_playground/src/about_page/domain/repositories/about_repository_interface.dart';
import 'package:flutter_playground/src/about_page/domain/usecases/fetch_about_service_use_case.dart';
import 'package:flutter_playground/src/about_page/states/about_page_state.dart';
import 'package:flutter_playground/src/about_page/store/about_screen_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils/about_page_mock.dart';

class AboutRepositoryMock extends Mock implements IAboutRepository {}

class FetchAboutDataUseCaseMock extends Mock
    implements IFetchAboutDataUseCase {}

/// Mocks a callback function on which you can use verify

main() {
  late AboutPageStore store;
  late AboutRepositoryMock repositoryMock;
  late FetchAboutDataUseCaseMock useCase;

  setUp(() {
    repositoryMock = AboutRepositoryMock();
    useCase = FetchAboutDataUseCaseMock();
    store = AboutPageStore(useCase: useCase);
  });

  test(
      'GIVEN repository getModel answer Loading WHEN fetch about screen model THEN store value is LoadingState',
      () async {
    //Given
    when(() => repositoryMock.getModel())
        .thenAnswer((_) async => LoadingState());
    when(() => useCase.call()).thenAnswer((_) async => LoadingState());

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
    when(() => useCase.call()).thenAnswer((_) async => SuccessState(modelMock));

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
    when(() => useCase.call()).thenAnswer((_) async => ErrorState(''));

    //When
    await store.fetchAboutScreenModel();

    //Then
    expect(store.value, isA<ErrorState>());
  });
}
