import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/events/github_events.dart';
import 'package:flutter_playground/src/github_page/domain/repositories/github_repository.dart';
import 'package:flutter_playground/src/github_page/states/github_page_state.dart';

class GithubPageBloc extends Bloc<GithubEvents, PageState> {
  final GithubRepository repository;

  GithubPageBloc({required this.repository}) : super(GithubInitialState()) {
    on<FetchGithubEvent>(_fetchGithubRepos);
  }

  Future<void> _fetchGithubRepos(event, emit) async {
    emit(GithubLoadingState());
    try {
      final model = await repository.getModels();
      if (model != null) {
        emit(GithubSuccessState(model));
      } else {
        emit(GithubErrorState('Erro ao carregar modelo da página!'));
      }
    } catch (e) {
      emit(GithubErrorState('Erro ao carregar modelo da página!'));
    }
  }
}
