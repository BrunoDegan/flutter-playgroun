import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/events/github_events.dart';
import 'package:flutter_playground/src/github_page/repositories/github_repository.dart';
import 'package:flutter_playground/src/github_page/states/github_page_state.dart';

class GithubBloc extends Bloc<GithubEvents, PageState> {
  final GithubRepository repository;

  GithubBloc({required this.repository}) : super(GithubInitialState()) {
    on<FetchGithubEvent>((FetchGithubEvent event, emit) => _fetchGithubRepos);
  }

  Future<void> _fetchGithubRepos(FetchGithubEvent event, emit) async {
    emit(GithubLoadingState());

    try {
      final model = await repository.getModel();
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
