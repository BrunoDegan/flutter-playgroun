import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/src/about_page/domain/datasource/about_local_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/datasource/about_remote_datasource.dart';
import 'package:flutter_playground/src/about_page/domain/repositories/about_repository.dart';
import 'package:flutter_playground/src/about_page/domain/repositories/about_repository_interface.dart';
import 'package:flutter_playground/src/about_page/domain/usecases/fetch_about_service_use_case.dart';
import 'package:flutter_playground/src/about_page/store/about_screen_store.dart';
import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/common/services/internet_request_service.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/blocs/github_page_bloc.dart';
import 'package:flutter_playground/src/github_page/domain/datasources/github_local_datasource.dart';
import 'package:flutter_playground/src/github_page/domain/datasources/github_remote_datasource.dart';
import 'package:flutter_playground/src/github_page/domain/repositories/github_repository.dart';
import 'package:flutter_playground/src/github_page/domain/repositories/github_repository_interface.dart';
import 'package:flutter_playground/src/github_page/domain/usecases/fetch_github_data_usecase.dart';
import 'package:provider/provider.dart';

final module = [
  Provider.value(value: Dio()),
  Provider.value(value: CheckConnectivityService()),
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
  Provider<IAboutRepository>(
    create: (context) => AboutRepository(
      remoteDataSource: context.read(),
      localDataSource: context.read(),
      connectivityService: context.read(),
    ),
  ),
  Provider<IFetchAboutDataUseCase>(
    create: (context) => FetchAboutDataUseCase(
      context.read(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => AboutPageStore(useCase: context.read()),
  ),
  Provider.value(value: GithubModelAdapter()),
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
  Provider<IGithubRepository>(
    create: (context) => GithubRepository(
      localDataSource: context.read(),
      remoteDataSource: context.read(),
      connectivityService: context.read(),
    ),
  ),
  Provider<IFetchGithubDataUsecase>(
    create: (context) => FetchGitbubDataUsecase(
      context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => GithubPageBloc(
      useCase: context.read(),
    ),
  ),
];
