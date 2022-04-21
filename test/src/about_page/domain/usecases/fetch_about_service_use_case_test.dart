import 'package:flutter_playground/src/about_page/domain/repositories/about_repository_interface.dart';
import 'package:flutter_playground/src/about_page/domain/usecases/fetch_about_service_use_case.dart';
import 'package:flutter_playground/src/about_page/states/about_page_state.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/about_page_mock.dart';

class FetchAboutServiceUseCaseMock extends Mock
    implements IFetchAboutDataUseCase {}

class AboutRepositoryMock extends Mock implements IAboutRepository {}

void main() {
  late FetchAboutServiceUseCaseMock useCaseMock;

  setUp(() {
    useCaseMock = FetchAboutServiceUseCaseMock();
  });

  test(
    'Given use case call returns Initial When use case calls Then answers InitialState',
    () async {
      //Given
      when(() => useCaseMock.call())
          .thenAnswer((_) => Future.value(InitialState()));

      //When
      PageState pageState = await useCaseMock.call();

      //Then
      expect(pageState, isA<InitialState>());
    },
  );

  test(
    'Given use case call returns Loading When use case calls Then answers LaodingState',
    () async {
      //Given
      when(() => useCaseMock.call())
          .thenAnswer((_) => Future.value(LoadingState()));

      //When
      PageState pageState = await useCaseMock.call();

      //then
      expect(pageState, isA<LoadingState>());
    },
  );

  test(
    'Given use case call returns success When use case calls Then answers SuccessState',
    () async {
      //Given
      when(() => useCaseMock.call())
          .thenAnswer((_) => Future.value(SuccessState(modelMock)));

      //When
      PageState pageState = await useCaseMock.call();

      //Then
      expect(pageState, isA<SuccessState>());
    },
  );

  test(
    'Given use case call returns errors When use case calls Then answers ErrorState',
    () async {
      //Given
      when(() => useCaseMock.call())
          .thenAnswer((_) => Future.value(ErrorState('')));

      //When
      PageState pageState = await useCaseMock.call();

      //Then
      expect(pageState, isA<ErrorState>());
    },
  );
}
