import 'package:flutter/material.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/blocs/github_page_bloc.dart';
import 'package:flutter_playground/src/github_page/events/github_events.dart';
import 'package:flutter_playground/src/github_page/model/repository_model.dart';
import 'package:flutter_playground/src/github_page/states/github_page_state.dart';

class RepositoriesPage extends StatefulWidget {
  final GithubPageBloc bloc;
  const RepositoriesPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  late GithubPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _bloc.add(FetchGithubEvent());
    });
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _handleWidgetState(_bloc.state);
  }

  Widget _handleWidgetState(PageState state) {
    if (state is GithubInitialState || state is GithubLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is GithubSuccessState) {
      List<RepositoryModel> repositories = state.models;

      return ListView.builder(
        itemCount: repositories.length,
        itemBuilder: ((_, index) {
          final model = repositories[index];
          return ListTile(
            title: Text(model.name),
            subtitle: Text(model.description),
          );
        }),
      );
    } else {
      final errorState = state as GithubErrorState;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(errorState.errorMessage),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  _bloc.add(FetchGithubEvent());
                },
                child: const Text('Tentar novamente'))
          ],
        ),
      );
    }
  }
}
