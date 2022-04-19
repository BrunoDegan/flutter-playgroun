import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/src/about_page/domain/datasource/about_local_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/datasource/about_remote_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/repositories/about_repository.dart';
import 'package:flutter_playground/src/about_page/store/about_screen_store.dart';
import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/common/services/internet_service.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/blocs/github_page_bloc.dart';
import 'package:flutter_playground/src/github_page/datasources/github_local_datasource.dart';
import 'package:flutter_playground/src/github_page/datasources/github_remote_datasource.dart';
import 'package:flutter_playground/src/github_page/repositories/github_repository.dart';
import 'package:provider/provider.dart';

final module = [
  Provider(create: (_) => Dio()),
  Provider(create: (context) => CheckConnectivityService()),
  Provider(
    create: (context) => InternetRequestService(
      dio: context.read(),
    ),
  ),
  Provider(
    create: (context) => AboutRemoteDataSource(
      internetRequestService: context.read(),
    ),
  ),
  Provider(create: (context) => AboutLocalDataSource()),
  Provider(
    create: (context) => AboutRepository(
      remoteDataSource: context.read(),
      localDataSource: context.read(),
      connectivityService: context.read(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => AboutPageStore(repository: context.read()),
  ),
  Provider(create: (_) => GithubModelAdapter()),
  Provider(
    create: (context) => GithubLocalDataSource(
      adapter: context.read(),
    ),
  ),
  Provider(
    create: (context) => GithubRemoteDataSource(
      internetRequestService: context.read(),
      adapter: context.read(),
    ),
  ),
  Provider(
    create: (context) => GithubRepository(
      localDataSource: context.read(),
      remoteDataSource: context.read(),
      connectivityService: context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => GithubPageBloc(
      repository: context.read(),
    ),
  )
];
