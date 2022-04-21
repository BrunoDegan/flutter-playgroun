import 'package:flutter_playground/src/about_page/domain/repositories/about_repository_interface.dart';
import 'package:flutter_playground/src/common/page_state.dart';

abstract class IFetchAboutDataUseCase {
  Future<PageState> call();
}

class FetchAboutDataUseCase implements IFetchAboutDataUseCase {
  final IAboutRepository repository;

  FetchAboutDataUseCase(this.repository);

  @override
  Future<PageState> call() async {
    return await repository.getModel();
  }
}
