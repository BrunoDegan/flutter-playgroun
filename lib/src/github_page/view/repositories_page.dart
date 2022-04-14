import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/github_page/blocs/github_page_bloc.dart';
import 'package:flutter_playground/src/github_page/events/github_events.dart';
import 'package:flutter_playground/src/github_page/states/github_page_state.dart';

class RepositoriesPage extends StatefulWidget {
  final GithubPageBloc bloc;
  const RepositoriesPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = widget.bloc.stream.listen((event) {
      setState(() {});
    });

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.bloc.add(FetchGithubEvent());
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
    return _handleWidgetState(widget.bloc.state);
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
          final model = repositories[index];
          return ListTile(
            title: Text(model.name ?? 'No name provided'),
            subtitle: Text(model.description ?? 'No description provided'),
          );
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
                  widget.bloc.add(FetchGithubEvent());
                },
                child: const Text('Tentar novamente'))
          ],
        ),
      );
    }
  }
}
