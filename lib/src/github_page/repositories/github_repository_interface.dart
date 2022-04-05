import 'package:flutter_playground/src/github_page/model/github_model.dart';

abstract class IGithubRepository {
  Future<GithubModel?> getModel();
}
