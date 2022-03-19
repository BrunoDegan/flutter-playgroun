import 'package:flutter/widgets.dart';
import 'package:flutter_playground/src/flutterando_page/about/repositories/about_repository.dart';
import 'package:flutter_playground/src/flutterando_page/about/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/flutterando_page/states/flutterando_page_state.dart';

class AboutPageStore extends ValueNotifier<PageState> {
  AboutRepository repository;
  CheckConnectivityService connectivityService;

  AboutPageStore({required this.connectivityService, required this.repository})
      : super(InitialState());

  fetchAboutScreenModel() async {
    value = LoadingState();
    value = await repository.getModel();
    notifyListeners();
  }
}
