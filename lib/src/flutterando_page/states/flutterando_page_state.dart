import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';

abstract class PageState {}

class InitialState implements PageState {}

class LoadingState implements PageState {}

class SuccessState implements PageState {
  final AboutModel model;
  SuccessState(this.model);
}

class ErrorState implements PageState {
  final String errorMessage;
  final StackTrace? stackTrace;

  ErrorState(this.errorMessage, [this.stackTrace]);
}
