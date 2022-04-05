import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/model/github_model.dart';

class GithubInitialState implements PageState {}

class GithubLoadingState implements PageState {}

class GithubSuccessState implements PageState {
  final GithubModel model;
  GithubSuccessState(this.model);
}

class GithubErrorState implements PageState {
  final String errorMessage;
  final StackTrace? stackTrace;

  GithubErrorState(this.errorMessage, [this.stackTrace]);
}
