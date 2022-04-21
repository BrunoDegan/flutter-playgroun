import 'package:flutter/widgets.dart';
import 'package:flutter_playground/src/about_page/domain/usecases/fetch_about_service_use_case.dart';
import 'package:flutter_playground/src/common/page_state.dart';

import '../states/about_page_state.dart';

class AboutPageStore extends ValueNotifier<PageState> {
  final IFetchAboutDataUseCase useCase;

  AboutPageStore({required this.useCase}) : super(InitialState());

  fetchAboutScreenModel() async {
    value = LoadingState();
    notifyListeners();
    value = await useCase.call();
    notifyListeners();
  }
}
