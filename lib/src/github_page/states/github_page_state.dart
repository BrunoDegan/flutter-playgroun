import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/model/repository_model.dart';

class GithubInitialState implements PageState {}

class GithubLoadingState implements PageState {}

class GithubSuccessState implements PageState {
  final List<RepositoryModel> models;
  GithubSuccessState(this.models);
}

class GithubErrorState implements PageState {
  final String errorMessage;
  final StackTrace? stackTrace;

  GithubErrorState(this.errorMessage, [this.stackTrace]);
}
