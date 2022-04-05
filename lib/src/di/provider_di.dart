import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/about_local_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/about_remote_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/repositories/about_repository.dart';
import 'package:flutter_playground/src/flutterando_page/about/store/about_screen_store.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/bloc/github_bloc.dart';
import 'package:flutter_playground/src/github_page/datasources/github_local_datasource.dart';
import 'package:flutter_playground/src/github_page/datasources/github_remote_datasource.dart';
import 'package:flutter_playground/src/github_page/repositories/github_repository.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider(create: (_) => Dio()),
  Provider(
    create: (context) => AboutRemoteDataSource(
      dio: context.read<Dio>(),
    ),
  ),
  Provider(create: (context) => CheckConnectivityService()),
  Provider(create: (context) => AboutLocalDataSource()),
  Provider(
    create: (context) => AboutRepository(
      remoteDataSource: context.read<AboutRemoteDataSource>(),
      localDataSource: context.read<AboutLocalDataSource>(),
      connectivityService: context.read<CheckConnectivityService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        AboutPageStore(repository: context.read<AboutRepository>()),
  ),
  Provider(create: (_) => GithubModelAdapter()),
  Provider(
    create: (context) => GithubLocalDataSource(
      adapter: context.read<GithubModelAdapter>(),
    ),
  ),
  Provider(
    create: (context) => GithubRemoteDataSource(
      dio: context.read<Dio>(),
      adapter: context.read<GithubModelAdapter>(),
    ),
  ),
  Provider(
    create: (context) => GithubRepository(
      localDataSource: context.read<GithubLocalDataSource>(),
      remoteDataSource: context.read<GithubRemoteDataSource>(),
      connectivityService: context.read<CheckConnectivityService>(),
    ),
  ),
  Provider(
    create: (context) => GithubBloc(
      repository: context.read<GithubRepository>(),
    ),
  )
];
