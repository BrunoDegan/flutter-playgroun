import 'package:flutter/widgets.dart';
import 'package:flutter_playground/src/flutterando_page/about/repositories/about_repository.dart';
import 'package:flutter_playground/src/flutterando_page/states/about_page_state.dart';
import 'package:flutter_playground/src/common/page_state.dart';

class AboutPageStore extends ValueNotifier<PageState> {
  AboutRepository repository;

  AboutPageStore({required this.repository}) : super(InitialState());

  fetchAboutScreenModel() async {
    value = LoadingState();
    value = await repository.getModel();
    notifyListeners();
  }
}
