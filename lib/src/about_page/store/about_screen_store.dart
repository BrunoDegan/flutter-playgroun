import 'package:flutter/widgets.dart';
import 'package:flutter_playground/src/about_page/domain/repositories/about_repository_interface.dart';
import 'package:flutter_playground/src/common/page_state.dart';

import '../states/about_page_state.dart';

class AboutPageStore extends ValueNotifier<PageState> {
  IAboutRepository repository;

  AboutPageStore({required this.repository}) : super(InitialState());

  fetchAboutScreenModel() async {
    value = LoadingState();
    notifyListeners();
    value = await repository.getModel();
    notifyListeners();
  }
}
