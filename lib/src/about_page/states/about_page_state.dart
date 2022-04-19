import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_playground/src/common/page_state.dart';

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
