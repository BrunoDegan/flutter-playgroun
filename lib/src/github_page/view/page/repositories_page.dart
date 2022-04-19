import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/src/common/complete_state_mixin.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/blocs/github_page_bloc.dart';
import 'package:flutter_playground/src/github_page/events/github_events.dart';
import 'package:flutter_playground/src/github_page/states/github_page_state.dart';
import 'package:flutter_playground/src/github_page/view/widgets/repositories_card.dart';

class RepositoriesPage extends StatefulWidget {
  final GithubPageBloc bloc;
  const RepositoriesPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage>
    with CompleteStateMixin {
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = widget.bloc.stream.listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    widget.bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<GithubPageBloc>();
    final state = bloc.state;

    return _handleWidgetState(state);
  }

  Widget _handleWidgetState(PageState state) {
    if (state is GithubInitialState || state is GithubLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is GithubSuccessState) {
      final repositories = state.models;
      return ListView.builder(
        itemCount: repositories.length,
        itemBuilder: ((_, index) {
          return RepositoryCard(model: repositories[index]);
        }),
      );
    } else {
      final errorState = state as GithubErrorState;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorState.errorMessage),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                context.read<GithubPageBloc>().add(FetchGithubEvent());
              },
              child: const Text(
                'Tentar novamente',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    backgroundColor: Colors.blueGrey),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  void completeState() {
    widget.bloc.add(FetchGithubEvent());
  }
}
